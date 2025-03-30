-- Drop all existing tables in reverse dependency order
DROP TABLE IF EXISTS ArchivedRenting CASCADE;
DROP TABLE IF EXISTS ArchivedBooking CASCADE;
DROP TABLE IF EXISTS Renting CASCADE;
DROP TABLE IF EXISTS Booking CASCADE;
DROP TABLE IF EXISTS Employee CASCADE;
DROP TABLE IF EXISTS Customer CASCADE;
DROP TABLE IF EXISTS Room CASCADE;
DROP TABLE IF EXISTS Hotel CASCADE;
DROP TABLE IF EXISTS HotelChain CASCADE;

------------------------------------------------------------
-- HotelChain Table
------------------------------------------------------------
CREATE TABLE HotelChain (
    Name VARCHAR(100) PRIMARY KEY,
    Address JSONB NOT NULL CHECK (
        Address ? 'StreetName' AND
        Address ? 'City' AND
        Address ? 'PostalCode' AND
        Address ? 'StreetNum'
    ),
    ContactInfo JSONB NOT NULL CHECK (
        (ContactInfo ? 'email') AND 
        (ContactInfo ? 'phoneNumbers')
    ),
    NumHotels INTEGER DEFAULT 0 CHECK (NumHotels >= 0)
);

------------------------------------------------------------
-- Hotel Table
------------------------------------------------------------
CREATE TABLE Hotel (
    Address JSONB PRIMARY KEY CHECK (
        Address ? 'StreetName' AND
        Address ? 'City' AND
        Address ? 'PostalCode' AND
        Address ? 'StreetNum'
    ),
    ChainName VARCHAR(100) NOT NULL,
    ContactInfo JSONB NOT NULL CHECK (
        (ContactInfo ? 'email') AND 
        (ContactInfo ? 'phoneNumbers')
    ),
    Rating INTEGER CHECK (Rating BETWEEN 1 AND 5),
    NumRooms INTEGER CHECK (NumRooms >= 0),
    FOREIGN KEY (ChainName) REFERENCES HotelChain(Name) ON DELETE CASCADE
);

------------------------------------------------------------
-- Room Table
------------------------------------------------------------
CREATE TABLE Room (
    HotelAddress JSONB NOT NULL,
    RoomID INTEGER NOT NULL,
    Price NUMERIC(10,2) CHECK (Price > 0),
    Capacity VARCHAR(10) CHECK (Capacity IN ('Single', 'Double', 'Triple', 'Suite')),
    Extendable BOOLEAN,
    View VARCHAR(50),
    Damages VARCHAR(200),
    Amenities JSONB,
    PRIMARY KEY (HotelAddress, RoomID),
    FOREIGN KEY (HotelAddress) REFERENCES Hotel(Address) ON DELETE CASCADE
);

------------------------------------------------------------
-- Booking Table
------------------------------------------------------------
CREATE TABLE Booking (
    BookingID SERIAL PRIMARY KEY,
    HotelAddress JSONB NOT NULL,
    RoomID INTEGER NOT NULL,
    CustomerID INTEGER NOT NULL,
    CheckInDate DATE NOT NULL,
    CheckOutDate DATE NOT NULL,
    FOREIGN KEY (HotelAddress, RoomID) REFERENCES Room(HotelAddress, RoomID) ON DELETE CASCADE
);

------------------------------------------------------------
-- Renting Table
------------------------------------------------------------
CREATE TABLE Renting (
    RentingID SERIAL PRIMARY KEY,
    HotelAddress JSONB NOT NULL,
    RoomID INTEGER NOT NULL,
    CustomerID INTEGER NOT NULL,
    EmployeeSSN VARCHAR(15) NOT NULL,
    CheckInDate DATE NOT NULL,
    CheckOutDate DATE NOT NULL,
    FOREIGN KEY (HotelAddress, RoomID) REFERENCES Room(HotelAddress, RoomID) ON DELETE CASCADE
);

------------------------------------------------------------
-- Customer Table
------------------------------------------------------------
CREATE TABLE Customer (
    CustomerID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    RegistrationDate DATE NOT NULL,
    Address JSONB NOT NULL CHECK (
        Address ? 'City' AND
        Address ? 'StreetName' AND
        Address ? 'StreetNum' AND
        Address ? 'PostalCode'
    )
);

------------------------------------------------------------
-- Employee Table
------------------------------------------------------------
CREATE TABLE Employee (
    SSN VARCHAR(15) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Role VARCHAR(50)
);

------------------------------------------------------------
-- ArchivedBooking Table
------------------------------------------------------------
CREATE TABLE ArchivedBooking (
    ArchiveBookingID SERIAL PRIMARY KEY,
    BookingID INTEGER,
    ArchiveDate DATE,
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID) ON DELETE SET NULL
);

------------------------------------------------------------
-- ArchivedRenting Table
------------------------------------------------------------
CREATE TABLE ArchivedRenting (
    ArchiveRentingID SERIAL PRIMARY KEY,
    RentingID INTEGER,
    ArchiveDate DATE,
    FOREIGN KEY (RentingID) REFERENCES Renting(RentingID) ON DELETE SET NULL
);

------------------------------------------------------------
-- TRIGGER FUNCTION 1: Update HotelChain.NumHotels when Hotels change
------------------------------------------------------------
CREATE OR REPLACE FUNCTION update_hotelchain_numhotels() RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        UPDATE HotelChain
        SET NumHotels = NumHotels + 1
        WHERE Name = NEW.ChainName;
        RETURN NEW;
    ELSIF (TG_OP = 'DELETE') THEN
        UPDATE HotelChain
        SET NumHotels = NumHotels - 1
        WHERE Name = OLD.ChainName;
        RETURN OLD;
    ELSIF (TG_OP = 'UPDATE') THEN
        IF (OLD.ChainName <> NEW.ChainName) THEN
            UPDATE HotelChain
            SET NumHotels = NumHotels - 1
            WHERE Name = OLD.ChainName;
            UPDATE HotelChain
            SET NumHotels = NumHotels + 1
            WHERE Name = NEW.ChainName;
        END IF;
        RETURN NEW;
    END IF;
    RETURN NULL;  -- Should not reach here.
END;
$$ LANGUAGE plpgsql;

-- Create trigger on Hotel table to fire AFTER INSERT, DELETE, or UPDATE
CREATE TRIGGER trg_update_hotelchain_numhotels
AFTER INSERT OR DELETE OR UPDATE ON Hotel
FOR EACH ROW
EXECUTE FUNCTION update_hotelchain_numhotels();

------------------------------------------------------------
-- TRIGGER FUNCTION 2: Validate that CheckInDate is before CheckOutDate
------------------------------------------------------------
CREATE OR REPLACE FUNCTION validate_check_dates() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.CheckInDate >= NEW.CheckOutDate THEN
        RAISE EXCEPTION 'CheckInDate (%s) must be earlier than CheckOutDate (%s)', NEW.CheckInDate, NEW.CheckOutDate;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create trigger on Booking table for date validation BEFORE INSERT or UPDATE
CREATE TRIGGER trg_validate_booking_dates
BEFORE INSERT OR UPDATE ON Booking
FOR EACH ROW
EXECUTE FUNCTION validate_check_dates();

-- Create trigger on Renting table for date validation BEFORE INSERT or UPDATE
CREATE TRIGGER trg_validate_renting_dates
BEFORE INSERT OR UPDATE ON Renting
FOR EACH ROW
EXECUTE FUNCTION validate_check_dates();

------------------------------------------------------------
-- Indexes
------------------------------------------------------------

-- 1. Index on Hotel(ChainName):
--    Justification: Many queries may retrieve hotels by chain (e.g., listing all hotels of a specific chain).
CREATE INDEX idx_hotel_chainname ON Hotel(ChainName);

-- 2. Index on Room(Price):
--    Justification: Queries that filter or sort rooms based on price (for instance, when customers are looking for the best deals)
--    will benefit from this index.
CREATE INDEX idx_room_price ON Room(Price);

-- 3. Index on Booking(CheckInDate, CheckOutDate):
--    Justification: Frequently, queries will involve filtering bookings by date ranges to check availability or occupancy,
--    making this composite index useful.
CREATE INDEX idx_booking_dates ON Booking(CheckInDate, CheckOutDate);

------------------------------------------------------------
-- Views
------------------------------------------------------------

-- View 1: Number of available rooms per area.
--         Assumption: A room is considered "available" if it is not currently booked or rented.
CREATE VIEW available_rooms_per_area AS
SELECT
    H.Address->>'City' AS City,
    COUNT(R.RoomID) AS AvailableRooms
FROM Room R
JOIN Hotel H ON R.HotelAddress = H.Address
LEFT JOIN Booking B ON R.HotelAddress = B.HotelAddress AND R.RoomID = B.RoomID
LEFT JOIN Renting Ren ON R.HotelAddress = Ren.HotelAddress AND R.RoomID = Ren.RoomID
WHERE B.BookingID IS NULL AND Ren.RentingID IS NULL
GROUP BY H.Address->>'City';

-- View 2: Aggregated capacity of all the rooms of a specific hotel.
--         Assumption: Capacity is interpreted as the number of persons per room:
--                     'Single' = 1, 'Double' = 2, 'Triple' = 3, 'Suite' = 4.
CREATE VIEW aggregated_capacity_per_hotel AS
SELECT
    H.Address,
    SUM(CASE R.Capacity
            WHEN 'Single' THEN 1
            WHEN 'Double' THEN 2
            WHEN 'Triple' THEN 3
            WHEN 'Suite' THEN 4
            ELSE 0
        END) AS TotalCapacity
FROM Room R
JOIN Hotel H ON R.HotelAddress = H.Address
GROUP BY H.Address;
