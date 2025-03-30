DELETE FROM HotelChain;

-- Insert 5 HotelChains
INSERT INTO
  HotelChain (Name, Address, ContactInfo, NumHotels)
VALUES
  (
    'SleepyDan',
    '{"StreetName": "1st Ave", "City": "New York", "PostalCode": "10001", "StreetNum": "101"}',
    '{"email": "contact@sleepydan.com", "phoneNumbers": ["212-555-1234"]}',
    0
  ),
  (
    'RafiBedframe',
    '{"StreetName": "2nd St", "City": "Chicago", "PostalCode": "60601", "StreetNum": "202"}',
    '{"email": "info@rafi.com", "phoneNumbers": ["312-555-2345"]}',
    0
  ),
  (
    'ShawandaBed',
    '{"StreetName": "3rd Blvd", "City": "Miami", "PostalCode": "33101", "StreetNum": "303"}',
    '{"email": "support@shawanda.com", "phoneNumbers": ["305-555-3456"]}',
    0
  ),
  (
    'LiamCardboardBox',
    '{"StreetName": "4th St", "City": "Los Angeles", "PostalCode": "90001", "StreetNum": "404"}',
    '{"email": "hello@liam.com", "phoneNumbers": ["213-555-4567"]}',
    0
  ),
  (
    'PuluGBlock',
    '{"StreetName": "5th Ave", "City": "San Francisco", "PostalCode": "94101", "StreetNum": "505"}',
    '{"email": "info@pulu.com", "phoneNumbers": ["415-555-5678"]}',
    0
  );

------------------------------------------------------------
-- Insert Hotels for "SleepyDan" Chain (8 Hotels)
------------------------------------------------------------
INSERT INTO
  Hotel (Address, ChainName, ContactInfo, Rating, NumRooms)
VALUES
  (
    '{"StreetName": "Broadway", "City": "New York", "PostalCode": "10010", "StreetNum": "11"}',
    'SleepyDan',
    '{"email": "hotel1@sleepydan.com", "phoneNumbers": ["212-555-0001"]}',
    5,
    5
  ),
  (
    '{"StreetName": "Kings Rd", "City": "New York", "PostalCode": "10012", "StreetNum": "12"}',
    'SleepyDan',
    '{"email": "hotel2@sleepydan.com", "phoneNumbers": ["212-555-0002"]}',
    4,
    5
  ),
  (
    '{"StreetName": "Main St", "City": "Boston", "PostalCode": "02108", "StreetNum": "13"}',
    'SleepyDan',
    '{"email": "hotel3@sleepydan.com", "phoneNumbers": ["617-555-0003"]}',
    3,
    5
  ),
  (
    '{"StreetName": "Market St", "City": "Philadelphia", "PostalCode": "19106", "StreetNum": "14"}',
    'SleepyDan',
    '{"email": "hotel4@sleepydan.com", "phoneNumbers": ["215-555-0004"]}',
    5,
    5
  ),
  (
    '{"StreetName": "Park Ave", "City": "Washington", "PostalCode": "20001", "StreetNum": "15"}',
    'SleepyDan',
    '{"email": "hotel5@sleepydan.com", "phoneNumbers": ["202-555-0005"]}',
    4,
    5
  ),
  (
    '{"StreetName": "Sunset Blvd", "City": "Los Angeles", "PostalCode": "90028", "StreetNum": "16"}',
    'SleepyDan',
    '{"email": "hotel6@sleepydan.com", "phoneNumbers": ["323-555-0006"]}',
    3,
    5
  ),
  (
    '{"StreetName": "Ocean Dr", "City": "Miami", "PostalCode": "33139", "StreetNum": "17"}',
    'SleepyDan',
    '{"email": "hotel7@sleepydan.com", "phoneNumbers": ["305-555-0007"]}',
    5,
    5
  ),
  (
    '{"StreetName": "Elm St", "City": "Atlanta", "PostalCode": "30303", "StreetNum": "18"}',
    'SleepyDan',
    '{"email": "hotel8@sleepydan.com", "phoneNumbers": ["404-555-0008"]}',
    4,
    5
  );

------------------------------------------------------------
-- Insert Rooms for Each "SleepyDan" Hotel
------------------------------------------------------------
-- For Hotel 1: Broadway, New York
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Broadway", "City": "New York", "PostalCode": "10010", "StreetNum": "11"}',
    1,
    300.00,
    'Single',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "TV": true}'
  ),
  (
    '{"StreetName": "Broadway", "City": "New York", "PostalCode": "10010", "StreetNum": "11"}',
    2,
    350.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "MiniBar": true}'
  ),
  (
    '{"StreetName": "Broadway", "City": "New York", "PostalCode": "10010", "StreetNum": "11"}',
    3,
    400.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Broadway", "City": "New York", "PostalCode": "10010", "StreetNum": "11"}',
    4,
    450.00,
    'Suite',
    true,
    'City skyline',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Broadway", "City": "New York", "PostalCode": "10010", "StreetNum": "11"}',
    5,
    320.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- For Hotel 2: Kings Rd, New York
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Kings Rd", "City": "New York", "PostalCode": "10012", "StreetNum": "12"}',
    1,
    310.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Kings Rd", "City": "New York", "PostalCode": "10012", "StreetNum": "12"}',
    2,
    360.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "MiniBar": true}'
  ),
  (
    '{"StreetName": "Kings Rd", "City": "New York", "PostalCode": "10012", "StreetNum": "12"}',
    3,
    410.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Kings Rd", "City": "New York", "PostalCode": "10012", "StreetNum": "12"}',
    4,
    460.00,
    'Suite',
    true,
    'City skyline',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Kings Rd", "City": "New York", "PostalCode": "10012", "StreetNum": "12"}',
    5,
    330.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- For Hotel 3: Main St, Boston
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Main St", "City": "Boston", "PostalCode": "02108", "StreetNum": "13"}',
    1,
    290.00,
    'Single',
    false,
    'City view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Main St", "City": "Boston", "PostalCode": "02108", "StreetNum": "13"}',
    2,
    340.00,
    'Double',
    true,
    'Park view',
    NULL,
    '{"WiFi": true, "MiniBar": true}'
  ),
  (
    '{"StreetName": "Main St", "City": "Boston", "PostalCode": "02108", "StreetNum": "13"}',
    3,
    390.00,
    'Triple',
    false,
    'Street view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Main St", "City": "Boston", "PostalCode": "02108", "StreetNum": "13"}',
    4,
    440.00,
    'Suite',
    true,
    'City skyline',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Main St", "City": "Boston", "PostalCode": "02108", "StreetNum": "13"}',
    5,
    310.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- For Hotel 4: Market St, Philadelphia
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Market St", "City": "Philadelphia", "PostalCode": "19106", "StreetNum": "14"}',
    1,
    305.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Market St", "City": "Philadelphia", "PostalCode": "19106", "StreetNum": "14"}',
    2,
    355.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "MiniBar": true}'
  ),
  (
    '{"StreetName": "Market St", "City": "Philadelphia", "PostalCode": "19106", "StreetNum": "14"}',
    3,
    405.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Market St", "City": "Philadelphia", "PostalCode": "19106", "StreetNum": "14"}',
    4,
    455.00,
    'Suite',
    true,
    'City skyline',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Market St", "City": "Philadelphia", "PostalCode": "19106", "StreetNum": "14"}',
    5,
    325.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- For Hotel 5: Park Ave, Washington
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Park Ave", "City": "Washington", "PostalCode": "20001", "StreetNum": "15"}',
    1,
    315.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Park Ave", "City": "Washington", "PostalCode": "20001", "StreetNum": "15"}',
    2,
    365.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "MiniBar": true}'
  ),
  (
    '{"StreetName": "Park Ave", "City": "Washington", "PostalCode": "20001", "StreetNum": "15"}',
    3,
    415.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Park Ave", "City": "Washington", "PostalCode": "20001", "StreetNum": "15"}',
    4,
    465.00,
    'Suite',
    true,
    'City skyline',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Park Ave", "City": "Washington", "PostalCode": "20001", "StreetNum": "15"}',
    5,
    335.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- For Hotel 6: Sunset Blvd, Los Angeles
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Sunset Blvd", "City": "Los Angeles", "PostalCode": "90028", "StreetNum": "16"}',
    1,
    320.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Sunset Blvd", "City": "Los Angeles", "PostalCode": "90028", "StreetNum": "16"}',
    2,
    370.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "MiniBar": true}'
  ),
  (
    '{"StreetName": "Sunset Blvd", "City": "Los Angeles", "PostalCode": "90028", "StreetNum": "16"}',
    3,
    420.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Sunset Blvd", "City": "Los Angeles", "PostalCode": "90028", "StreetNum": "16"}',
    4,
    470.00,
    'Suite',
    true,
    'City skyline',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Sunset Blvd", "City": "Los Angeles", "PostalCode": "90028", "StreetNum": "16"}',
    5,
    340.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- For Hotel 7: Ocean Dr, Miami
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Ocean Dr", "City": "Miami", "PostalCode": "33139", "StreetNum": "17"}',
    1,
    330.00,
    'Single',
    false,
    'Beach view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Ocean Dr", "City": "Miami", "PostalCode": "33139", "StreetNum": "17"}',
    2,
    380.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "MiniBar": true}'
  ),
  (
    '{"StreetName": "Ocean Dr", "City": "Miami", "PostalCode": "33139", "StreetNum": "17"}',
    3,
    430.00,
    'Triple',
    false,
    'Beach view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Ocean Dr", "City": "Miami", "PostalCode": "33139", "StreetNum": "17"}',
    4,
    480.00,
    'Suite',
    true,
    'City skyline',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Ocean Dr", "City": "Miami", "PostalCode": "33139", "StreetNum": "17"}',
    5,
    350.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- For Hotel 8: Elm St, Atlanta
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Elm St", "City": "Atlanta", "PostalCode": "30303", "StreetNum": "18"}',
    1,
    310.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Elm St", "City": "Atlanta", "PostalCode": "30303", "StreetNum": "18"}',
    2,
    360.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "MiniBar": true}'
  ),
  (
    '{"StreetName": "Elm St", "City": "Atlanta", "PostalCode": "30303", "StreetNum": "18"}',
    3,
    410.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Elm St", "City": "Atlanta", "PostalCode": "30303", "StreetNum": "18"}',
    4,
    460.00,
    'Suite',
    true,
    'City skyline',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Elm St", "City": "Atlanta", "PostalCode": "30303", "StreetNum": "18"}',
    5,
    330.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

------------------------------------------------------------
-- Insert Hotels for "RafiBedframe" Chain (8 Hotels)
------------------------------------------------------------
INSERT INTO
  Hotel (Address, ChainName, ContactInfo, Rating, NumRooms)
VALUES
  (
    '{"StreetName": "Michigan Ave", "City": "Chicago", "PostalCode": "60602", "StreetNum": "21"}',
    'RafiBedframe',
    '{"email": "hotel1@rafibedframe.com", "phoneNumbers": ["312-555-0101"]}',
    4,
    5
  ),
  (
    '{"StreetName": "State St", "City": "Chicago", "PostalCode": "60603", "StreetNum": "22"}',
    'RafiBedframe',
    '{"email": "hotel2@rafibedframe.com", "phoneNumbers": ["312-555-0102"]}',
    3,
    5
  ),
  (
    '{"StreetName": "Lake Shore Dr", "City": "Chicago", "PostalCode": "60604", "StreetNum": "23"}',
    'RafiBedframe',
    '{"email": "hotel3@rafibedframe.com", "phoneNumbers": ["312-555-0103"]}',
    5,
    5
  ),
  (
    '{"StreetName": "Wacker Dr", "City": "Chicago", "PostalCode": "60605", "StreetNum": "24"}',
    'RafiBedframe',
    '{"email": "hotel4@rafibedframe.com", "phoneNumbers": ["312-555-0104"]}',
    4,
    5
  ),
  (
    '{"StreetName": "Clark St", "City": "Milwaukee", "PostalCode": "53202", "StreetNum": "25"}',
    'RafiBedframe',
    '{"email": "hotel5@rafibedframe.com", "phoneNumbers": ["414-555-0105"]}',
    3,
    5
  ),
  (
    '{"StreetName": "Grand Ave", "City": "Detroit", "PostalCode": "48226", "StreetNum": "26"}',
    'RafiBedframe',
    '{"email": "hotel6@rafibedframe.com", "phoneNumbers": ["313-555-0106"]}',
    5,
    5
  ),
  (
    '{"StreetName": "Adams St", "City": "Chicago", "PostalCode": "60606", "StreetNum": "27"}',
    'RafiBedframe',
    '{"email": "hotel7@rafibedframe.com", "phoneNumbers": ["312-555-0107"]}',
    4,
    5
  ),
  (
    '{"StreetName": "Randolph St", "City": "Chicago", "PostalCode": "60607", "StreetNum": "28"}',
    'RafiBedframe',
    '{"email": "hotel8@rafibedframe.com", "phoneNumbers": ["312-555-0108"]}',
    3,
    5
  );

------------------------------------------------------------
-- Insert Rooms for Each "RafiBedframe" Hotel
------------------------------------------------------------
-- Hotel 1: Michigan Ave, Chicago
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Michigan Ave", "City": "Chicago", "PostalCode": "60602", "StreetNum": "21"}',
    1,
    280.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Michigan Ave", "City": "Chicago", "PostalCode": "60602", "StreetNum": "21"}',
    2,
    330.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "TV": true}'
  ),
  (
    '{"StreetName": "Michigan Ave", "City": "Chicago", "PostalCode": "60602", "StreetNum": "21"}',
    3,
    380.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Michigan Ave", "City": "Chicago", "PostalCode": "60602", "StreetNum": "21"}',
    4,
    430.00,
    'Suite',
    true,
    'Skyline view',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Michigan Ave", "City": "Chicago", "PostalCode": "60602", "StreetNum": "21"}',
    5,
    300.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- Hotel 2: State St, Chicago
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "State St", "City": "Chicago", "PostalCode": "60603", "StreetNum": "22"}',
    1,
    285.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "State St", "City": "Chicago", "PostalCode": "60603", "StreetNum": "22"}',
    2,
    335.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "TV": true}'
  ),
  (
    '{"StreetName": "State St", "City": "Chicago", "PostalCode": "60603", "StreetNum": "22"}',
    3,
    385.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "State St", "City": "Chicago", "PostalCode": "60603", "StreetNum": "22"}',
    4,
    435.00,
    'Suite',
    true,
    'Skyline view',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "State St", "City": "Chicago", "PostalCode": "60603", "StreetNum": "22"}',
    5,
    305.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- Hotel 3: Lake Shore Dr, Chicago
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Lake Shore Dr", "City": "Chicago", "PostalCode": "60604", "StreetNum": "23"}',
    1,
    290.00,
    'Single',
    false,
    'Lake view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Lake Shore Dr", "City": "Chicago", "PostalCode": "60604", "StreetNum": "23"}',
    2,
    340.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "MiniBar": true}'
  ),
  (
    '{"StreetName": "Lake Shore Dr", "City": "Chicago", "PostalCode": "60604", "StreetNum": "23"}',
    3,
    390.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Lake Shore Dr", "City": "Chicago", "PostalCode": "60604", "StreetNum": "23"}',
    4,
    440.00,
    'Suite',
    true,
    'Skyline view',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Lake Shore Dr", "City": "Chicago", "PostalCode": "60604", "StreetNum": "23"}',
    5,
    310.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- Hotel 4: Wacker Dr, Chicago
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Wacker Dr", "City": "Chicago", "PostalCode": "60605", "StreetNum": "24"}',
    1,
    295.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Wacker Dr", "City": "Chicago", "PostalCode": "60605", "StreetNum": "24"}',
    2,
    345.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "TV": true}'
  ),
  (
    '{"StreetName": "Wacker Dr", "City": "Chicago", "PostalCode": "60605", "StreetNum": "24"}',
    3,
    395.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Wacker Dr", "City": "Chicago", "PostalCode": "60605", "StreetNum": "24"}',
    4,
    445.00,
    'Suite',
    true,
    'Skyline view',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Wacker Dr", "City": "Chicago", "PostalCode": "60605", "StreetNum": "24"}',
    5,
    315.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- Hotel 5: Clark St, Milwaukee
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Clark St", "City": "Milwaukee", "PostalCode": "53202", "StreetNum": "25"}',
    1,
    275.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Clark St", "City": "Milwaukee", "PostalCode": "53202", "StreetNum": "25"}',
    2,
    325.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "TV": true}'
  ),
  (
    '{"StreetName": "Clark St", "City": "Milwaukee", "PostalCode": "53202", "StreetNum": "25"}',
    3,
    375.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Clark St", "City": "Milwaukee", "PostalCode": "53202", "StreetNum": "25"}',
    4,
    425.00,
    'Suite',
    true,
    'Skyline view',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Clark St", "City": "Milwaukee", "PostalCode": "53202", "StreetNum": "25"}',
    5,
    295.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- Hotel 6: Grand Ave, Detroit
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Grand Ave", "City": "Detroit", "PostalCode": "48226", "StreetNum": "26"}',
    1,
    285.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Grand Ave", "City": "Detroit", "PostalCode": "48226", "StreetNum": "26"}',
    2,
    335.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "MiniBar": true}'
  ),
  (
    '{"StreetName": "Grand Ave", "City": "Detroit", "PostalCode": "48226", "StreetNum": "26"}',
    3,
    385.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Grand Ave", "City": "Detroit", "PostalCode": "48226", "StreetNum": "26"}',
    4,
    435.00,
    'Suite',
    true,
    'Skyline view',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Grand Ave", "City": "Detroit", "PostalCode": "48226", "StreetNum": "26"}',
    5,
    305.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- Hotel 7: Adams St, Chicago
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Adams St", "City": "Chicago", "PostalCode": "60606", "StreetNum": "27"}',
    1,
    290.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Adams St", "City": "Chicago", "PostalCode": "60606", "StreetNum": "27"}',
    2,
    340.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "TV": true}'
  ),
  (
    '{"StreetName": "Adams St", "City": "Chicago", "PostalCode": "60606", "StreetNum": "27"}',
    3,
    390.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Adams St", "City": "Chicago", "PostalCode": "60606", "StreetNum": "27"}',
    4,
    440.00,
    'Suite',
    true,
    'Skyline view',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Adams St", "City": "Chicago", "PostalCode": "60606", "StreetNum": "27"}',
    5,
    310.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- Hotel 8: Randolph St, Chicago
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Randolph St", "City": "Chicago", "PostalCode": "60607", "StreetNum": "28"}',
    1,
    295.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Randolph St", "City": "Chicago", "PostalCode": "60607", "StreetNum": "28"}',
    2,
    345.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "TV": true}'
  ),
  (
    '{"StreetName": "Randolph St", "City": "Chicago", "PostalCode": "60607", "StreetNum": "28"}',
    3,
    395.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Randolph St", "City": "Chicago", "PostalCode": "60607", "StreetNum": "28"}',
    4,
    445.00,
    'Suite',
    true,
    'Skyline view',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Randolph St", "City": "Chicago", "PostalCode": "60607", "StreetNum": "28"}',
    5,
    315.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

------------------------------------------------------------
-- Insert Hotels for "ShawandaBed" Chain (8 Hotels)
------------------------------------------------------------
INSERT INTO
  Hotel (Address, ChainName, ContactInfo, Rating, NumRooms)
VALUES
  (
    '{"StreetName": "Ocean Drive", "City": "Miami", "PostalCode": "33139", "StreetNum": "31"}',
    'ShawandaBed',
    '{"email": "hotel1@shawandabed.com", "phoneNumbers": ["305-555-0201"]}',
    5,
    5
  ),
  (
    '{"StreetName": "Collins Ave", "City": "Miami", "PostalCode": "33140", "StreetNum": "32"}',
    'ShawandaBed',
    '{"email": "hotel2@shawandabed.com", "phoneNumbers": ["305-555-0202"]}',
    4,
    5
  ),
  (
    '{"StreetName": "Biscayne Blvd", "City": "Miami", "PostalCode": "33141", "StreetNum": "33"}',
    'ShawandaBed',
    '{"email": "hotel3@shawandabed.com", "phoneNumbers": ["305-555-0203"]}',
    3,
    5
  ),
  (
    '{"StreetName": "Flagler St", "City": "Miami", "PostalCode": "33142", "StreetNum": "34"}',
    'ShawandaBed',
    '{"email": "hotel4@shawandabed.com", "phoneNumbers": ["305-555-0204"]}',
    5,
    5
  ),
  (
    '{"StreetName": "Brickell Ave", "City": "Miami", "PostalCode": "33143", "StreetNum": "35"}',
    'ShawandaBed',
    '{"email": "hotel5@shawandabed.com", "phoneNumbers": ["305-555-0205"]}',
    4,
    5
  ),
  (
    '{"StreetName": "Coral Way", "City": "Orlando", "PostalCode": "32801", "StreetNum": "36"}',
    'ShawandaBed',
    '{"email": "hotel6@shawandabed.com", "phoneNumbers": ["407-555-0206"]}',
    3,
    5
  ),
  (
    '{"StreetName": "Liberty St", "City": "Tampa", "PostalCode": "33602", "StreetNum": "37"}',
    'ShawandaBed',
    '{"email": "hotel7@shawandabed.com", "phoneNumbers": ["813-555-0207"]}',
    5,
    5
  ),
  (
    '{"StreetName": "Dolphin Ave", "City": "Miami", "PostalCode": "33144", "StreetNum": "38"}',
    'ShawandaBed',
    '{"email": "hotel8@shawandabed.com", "phoneNumbers": ["305-555-0208"]}',
    4,
    5
  );

------------------------------------------------------------
-- Insert Rooms for Each "ShawandaBed" Hotel
------------------------------------------------------------
-- Hotel 1: Ocean Drive, Miami
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Ocean Drive", "City": "Miami", "PostalCode": "33139", "StreetNum": "31"}',
    1,
    350.00,
    'Single',
    false,
    'Beach view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Ocean Drive", "City": "Miami", "PostalCode": "33139", "StreetNum": "31"}',
    2,
    400.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "TV": true}'
  ),
  (
    '{"StreetName": "Ocean Drive", "City": "Miami", "PostalCode": "33139", "StreetNum": "31"}',
    3,
    450.00,
    'Triple',
    false,
    'Beach view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Ocean Drive", "City": "Miami", "PostalCode": "33139", "StreetNum": "31"}',
    4,
    500.00,
    'Suite',
    true,
    'City skyline',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Ocean Drive", "City": "Miami", "PostalCode": "33139", "StreetNum": "31"}',
    5,
    370.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- Hotel 2: Collins Ave, Miami
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Collins Ave", "City": "Miami", "PostalCode": "33140", "StreetNum": "32"}',
    1,
    355.00,
    'Single',
    false,
    'Beach view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Collins Ave", "City": "Miami", "PostalCode": "33140", "StreetNum": "32"}',
    2,
    405.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "TV": true}'
  ),
  (
    '{"StreetName": "Collins Ave", "City": "Miami", "PostalCode": "33140", "StreetNum": "32"}',
    3,
    455.00,
    'Triple',
    false,
    'Beach view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Collins Ave", "City": "Miami", "PostalCode": "33140", "StreetNum": "32"}',
    4,
    505.00,
    'Suite',
    true,
    'City skyline',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Collins Ave", "City": "Miami", "PostalCode": "33140", "StreetNum": "32"}',
    5,
    375.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- Hotel 3: Biscayne Blvd, Miami
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Biscayne Blvd", "City": "Miami", "PostalCode": "33141", "StreetNum": "33"}',
    1,
    360.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Biscayne Blvd", "City": "Miami", "PostalCode": "33141", "StreetNum": "33"}',
    2,
    410.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "TV": true}'
  ),
  (
    '{"StreetName": "Biscayne Blvd", "City": "Miami", "PostalCode": "33141", "StreetNum": "33"}',
    3,
    460.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Biscayne Blvd", "City": "Miami", "PostalCode": "33141", "StreetNum": "33"}',
    4,
    510.00,
    'Suite',
    true,
    'City skyline',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Biscayne Blvd", "City": "Miami", "PostalCode": "33141", "StreetNum": "33"}',
    5,
    365.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- Hotel 4: Flagler St, Miami
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Flagler St", "City": "Miami", "PostalCode": "33142", "StreetNum": "34"}',
    1,
    365.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Flagler St", "City": "Miami", "PostalCode": "33142", "StreetNum": "34"}',
    2,
    415.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "TV": true}'
  ),
  (
    '{"StreetName": "Flagler St", "City": "Miami", "PostalCode": "33142", "StreetNum": "34"}',
    3,
    465.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Flagler St", "City": "Miami", "PostalCode": "33142", "StreetNum": "34"}',
    4,
    515.00,
    'Suite',
    true,
    'City skyline',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Flagler St", "City": "Miami", "PostalCode": "33142", "StreetNum": "34"}',
    5,
    370.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- Hotel 5: Brickell Ave, Miami
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Brickell Ave", "City": "Miami", "PostalCode": "33143", "StreetNum": "35"}',
    1,
    370.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Brickell Ave", "City": "Miami", "PostalCode": "33143", "StreetNum": "35"}',
    2,
    420.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "TV": true}'
  ),
  (
    '{"StreetName": "Brickell Ave", "City": "Miami", "PostalCode": "33143", "StreetNum": "35"}',
    3,
    470.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Brickell Ave", "City": "Miami", "PostalCode": "33143", "StreetNum": "35"}',
    4,
    520.00,
    'Suite',
    true,
    'City skyline',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Brickell Ave", "City": "Miami", "PostalCode": "33143", "StreetNum": "35"}',
    5,
    375.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- Hotel 6: Coral Way, Orlando
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Coral Way", "City": "Orlando", "PostalCode": "32801", "StreetNum": "36"}',
    1,
    375.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Coral Way", "City": "Orlando", "PostalCode": "32801", "StreetNum": "36"}',
    2,
    425.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "TV": true}'
  ),
  (
    '{"StreetName": "Coral Way", "City": "Orlando", "PostalCode": "32801", "StreetNum": "36"}',
    3,
    475.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Coral Way", "City": "Orlando", "PostalCode": "32801", "StreetNum": "36"}',
    4,
    525.00,
    'Suite',
    true,
    'City skyline',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Coral Way", "City": "Orlando", "PostalCode": "32801", "StreetNum": "36"}',
    5,
    380.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- Hotel 7: Liberty St, Tampa
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Liberty St", "City": "Tampa", "PostalCode": "33602", "StreetNum": "37"}',
    1,
    380.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Liberty St", "City": "Tampa", "PostalCode": "33602", "StreetNum": "37"}',
    2,
    430.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "TV": true}'
  ),
  (
    '{"StreetName": "Liberty St", "City": "Tampa", "PostalCode": "33602", "StreetNum": "37"}',
    3,
    480.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Liberty St", "City": "Tampa", "PostalCode": "33602", "StreetNum": "37"}',
    4,
    530.00,
    'Suite',
    true,
    'City skyline',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Liberty St", "City": "Tampa", "PostalCode": "33602", "StreetNum": "37"}',
    5,
    385.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- Hotel 8: Dolphin Ave, Miami
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Dolphin Ave", "City": "Miami", "PostalCode": "33144", "StreetNum": "38"}',
    1,
    385.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Dolphin Ave", "City": "Miami", "PostalCode": "33144", "StreetNum": "38"}',
    2,
    435.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "TV": true}'
  ),
  (
    '{"StreetName": "Dolphin Ave", "City": "Miami", "PostalCode": "33144", "StreetNum": "38"}',
    3,
    485.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Dolphin Ave", "City": "Miami", "PostalCode": "33144", "StreetNum": "38"}',
    4,
    535.00,
    'Suite',
    true,
    'City skyline',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Dolphin Ave", "City": "Miami", "PostalCode": "33144", "StreetNum": "38"}',
    5,
    390.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

------------------------------------------------------------
-- Insert Hotels for "LiamCardboardBox" Chain (8 Hotels)
------------------------------------------------------------
INSERT INTO
  Hotel (Address, ChainName, ContactInfo, Rating, NumRooms)
VALUES
  (
    '{"StreetName": "Sunset Strip", "City": "Los Angeles", "PostalCode": "90028", "StreetNum": "41"}',
    'LiamCardboardBox',
    '{"email": "hotel1@liam.com", "phoneNumbers": ["213-555-0301"]}',
    3,
    5
  ),
  (
    '{"StreetName": "Hollywood Blvd", "City": "Los Angeles", "PostalCode": "90029", "StreetNum": "42"}',
    'LiamCardboardBox',
    '{"email": "hotel2@liam.com", "phoneNumbers": ["213-555-0302"]}',
    4,
    5
  ),
  (
    '{"StreetName": "Rodeo Drive", "City": "Beverly Hills", "PostalCode": "90210", "StreetNum": "43"}',
    'LiamCardboardBox',
    '{"email": "hotel3@liam.com", "phoneNumbers": ["310-555-0303"]}',
    5,
    5
  ),
  (
    '{"StreetName": "Melrose Ave", "City": "Los Angeles", "PostalCode": "90030", "StreetNum": "44"}',
    'LiamCardboardBox',
    '{"email": "hotel4@liam.com", "phoneNumbers": ["213-555-0304"]}',
    3,
    5
  ),
  (
    '{"StreetName": "Vine St", "City": "Los Angeles", "PostalCode": "90031", "StreetNum": "45"}',
    'LiamCardboardBox',
    '{"email": "hotel5@liam.com", "phoneNumbers": ["213-555-0305"]}',
    4,
    5
  ),
  (
    '{"StreetName": "Figueroa St", "City": "Los Angeles", "PostalCode": "90032", "StreetNum": "46"}',
    'LiamCardboardBox',
    '{"email": "hotel6@liam.com", "phoneNumbers": ["213-555-0306"]}',
    5,
    5
  ),
  (
    '{"StreetName": "Santa Monica Blvd", "City": "Los Angeles", "PostalCode": "90033", "StreetNum": "47"}',
    'LiamCardboardBox',
    '{"email": "hotel7@liam.com", "phoneNumbers": ["213-555-0307"]}',
    3,
    5
  ),
  (
    '{"StreetName": "Wilshire Blvd", "City": "Los Angeles", "PostalCode": "90034", "StreetNum": "48"}',
    'LiamCardboardBox',
    '{"email": "hotel8@liam.com", "phoneNumbers": ["213-555-0308"]}',
    4,
    5
  );

------------------------------------------------------------
-- Insert Rooms for Each "LiamCardboardBox" Hotel
------------------------------------------------------------
-- Hotel 1: Sunset Strip, Los Angeles
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Sunset Strip", "City": "Los Angeles", "PostalCode": "90028", "StreetNum": "41"}',
    1,
    320.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Sunset Strip", "City": "Los Angeles", "PostalCode": "90028", "StreetNum": "41"}',
    2,
    370.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "MiniBar": true}'
  ),
  (
    '{"StreetName": "Sunset Strip", "City": "Los Angeles", "PostalCode": "90028", "StreetNum": "41"}',
    3,
    420.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Sunset Strip", "City": "Los Angeles", "PostalCode": "90028", "StreetNum": "41"}',
    4,
    470.00,
    'Suite',
    true,
    'City skyline',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Sunset Strip", "City": "Los Angeles", "PostalCode": "90028", "StreetNum": "41"}',
    5,
    340.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- Hotel 2: Hollywood Blvd, Los Angeles
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Hollywood Blvd", "City": "Los Angeles", "PostalCode": "90029", "StreetNum": "42"}',
    1,
    325.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Hollywood Blvd", "City": "Los Angeles", "PostalCode": "90029", "StreetNum": "42"}',
    2,
    375.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "MiniBar": true}'
  ),
  (
    '{"StreetName": "Hollywood Blvd", "City": "Los Angeles", "PostalCode": "90029", "StreetNum": "42"}',
    3,
    425.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Hollywood Blvd", "City": "Los Angeles", "PostalCode": "90029", "StreetNum": "42"}',
    4,
    475.00,
    'Suite',
    true,
    'City skyline',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Hollywood Blvd", "City": "Los Angeles", "PostalCode": "90029", "StreetNum": "42"}',
    5,
    345.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- Hotel 3: Rodeo Drive, Beverly Hills
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Rodeo Drive", "City": "Beverly Hills", "PostalCode": "90210", "StreetNum": "43"}',
    1,
    330.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Rodeo Drive", "City": "Beverly Hills", "PostalCode": "90210", "StreetNum": "43"}',
    2,
    380.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "MiniBar": true}'
  ),
  (
    '{"StreetName": "Rodeo Drive", "City": "Beverly Hills", "PostalCode": "90210", "StreetNum": "43"}',
    3,
    430.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Rodeo Drive", "City": "Beverly Hills", "PostalCode": "90210", "StreetNum": "43"}',
    4,
    480.00,
    'Suite',
    true,
    'City skyline',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Rodeo Drive", "City": "Beverly Hills", "PostalCode": "90210", "StreetNum": "43"}',
    5,
    350.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- Hotel 4: Melrose Ave, Los Angeles
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Melrose Ave", "City": "Los Angeles", "PostalCode": "90030", "StreetNum": "44"}',
    1,
    335.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Melrose Ave", "City": "Los Angeles", "PostalCode": "90030", "StreetNum": "44"}',
    2,
    385.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "MiniBar": true}'
  ),
  (
    '{"StreetName": "Melrose Ave", "City": "Los Angeles", "PostalCode": "90030", "StreetNum": "44"}',
    3,
    435.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Melrose Ave", "City": "Los Angeles", "PostalCode": "90030", "StreetNum": "44"}',
    4,
    485.00,
    'Suite',
    true,
    'City skyline',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Melrose Ave", "City": "Los Angeles", "PostalCode": "90030", "StreetNum": "44"}',
    5,
    355.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- Hotel 5: Vine St, Los Angeles
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Vine St", "City": "Los Angeles", "PostalCode": "90031", "StreetNum": "45"}',
    1,
    340.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Vine St", "City": "Los Angeles", "PostalCode": "90031", "StreetNum": "45"}',
    2,
    390.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "MiniBar": true}'
  ),
  (
    '{"StreetName": "Vine St", "City": "Los Angeles", "PostalCode": "90031", "StreetNum": "45"}',
    3,
    440.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Vine St", "City": "Los Angeles", "PostalCode": "90031", "StreetNum": "45"}',
    4,
    490.00,
    'Suite',
    true,
    'City skyline',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Vine St", "City": "Los Angeles", "PostalCode": "90031", "StreetNum": "45"}',
    5,
    360.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- Hotel 6: Figueroa St, Los Angeles
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Figueroa St", "City": "Los Angeles", "PostalCode": "90032", "StreetNum": "46"}',
    1,
    345.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Figueroa St", "City": "Los Angeles", "PostalCode": "90032", "StreetNum": "46"}',
    2,
    395.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "MiniBar": true}'
  ),
  (
    '{"StreetName": "Figueroa St", "City": "Los Angeles", "PostalCode": "90032", "StreetNum": "46"}',
    3,
    445.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Figueroa St", "City": "Los Angeles", "PostalCode": "90032", "StreetNum": "46"}',
    4,
    495.00,
    'Suite',
    true,
    'City skyline',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Figueroa St", "City": "Los Angeles", "PostalCode": "90032", "StreetNum": "46"}',
    5,
    370.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- Hotel 7: Santa Monica Blvd, Los Angeles
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Santa Monica Blvd", "City": "Los Angeles", "PostalCode": "90033", "StreetNum": "47"}',
    1,
    350.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Santa Monica Blvd", "City": "Los Angeles", "PostalCode": "90033", "StreetNum": "47"}',
    2,
    400.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "MiniBar": true}'
  ),
  (
    '{"StreetName": "Santa Monica Blvd", "City": "Los Angeles", "PostalCode": "90033", "StreetNum": "47"}',
    3,
    450.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Santa Monica Blvd", "City": "Los Angeles", "PostalCode": "90033", "StreetNum": "47"}',
    4,
    500.00,
    'Suite',
    true,
    'City skyline',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Santa Monica Blvd", "City": "Los Angeles", "PostalCode": "90033", "StreetNum": "47"}',
    5,
    375.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- Hotel 8: Wilshire Blvd, Los Angeles
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Wilshire Blvd", "City": "Los Angeles", "PostalCode": "90034", "StreetNum": "48"}',
    1,
    355.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Wilshire Blvd", "City": "Los Angeles", "PostalCode": "90034", "StreetNum": "48"}',
    2,
    405.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "MiniBar": true}'
  ),
  (
    '{"StreetName": "Wilshire Blvd", "City": "Los Angeles", "PostalCode": "90034", "StreetNum": "48"}',
    3,
    455.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Wilshire Blvd", "City": "Los Angeles", "PostalCode": "90034", "StreetNum": "48"}',
    4,
    505.00,
    'Suite',
    true,
    'City skyline',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Wilshire Blvd", "City": "Los Angeles", "PostalCode": "90034", "StreetNum": "48"}',
    5,
    360.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

------------------------------------------------------------
-- Insert Hotels for "PuluGBlock" Chain (8 Hotels)
------------------------------------------------------------
INSERT INTO
  Hotel (Address, ChainName, ContactInfo, Rating, NumRooms)
VALUES
  (
    '{"StreetName": "Market Street", "City": "San Francisco", "PostalCode": "94102", "StreetNum": "51"}',
    'PuluGBlock',
    '{"email": "hotel1@pulu.com", "phoneNumbers": ["415-555-0401"]}',
    4,
    5
  ),
  (
    '{"StreetName": "Van Ness Ave", "City": "San Francisco", "PostalCode": "94103", "StreetNum": "52"}',
    'PuluGBlock',
    '{"email": "hotel2@pulu.com", "phoneNumbers": ["415-555-0402"]}',
    5,
    5
  ),
  (
    '{"StreetName": "Lombard St", "City": "San Francisco", "PostalCode": "94104", "StreetNum": "53"}',
    'PuluGBlock',
    '{"email": "hotel3@pulu.com", "phoneNumbers": ["415-555-0403"]}',
    3,
    5
  ),
  (
    '{"StreetName": "Embarcadero", "City": "San Francisco", "PostalCode": "94105", "StreetNum": "54"}',
    'PuluGBlock',
    '{"email": "hotel4@pulu.com", "phoneNumbers": ["415-555-0404"]}',
    4,
    5
  ),
  (
    '{"StreetName": "Haight Street", "City": "San Francisco", "PostalCode": "94106", "StreetNum": "55"}',
    'PuluGBlock',
    '{"email": "hotel5@pulu.com", "phoneNumbers": ["415-555-0405"]}',
    5,
    5
  ),
  (
    '{"StreetName": "Folsom St", "City": "San Francisco", "PostalCode": "94107", "StreetNum": "56"}',
    'PuluGBlock',
    '{"email": "hotel6@pulu.com", "phoneNumbers": ["415-555-0406"]}',
    3,
    5
  ),
  (
    '{"StreetName": "Mission St", "City": "San Francisco", "PostalCode": "94108", "StreetNum": "57"}',
    'PuluGBlock',
    '{"email": "hotel7@pulu.com", "phoneNumbers": ["415-555-0407"]}',
    4,
    5
  ),
  (
    '{"StreetName": "Castro St", "City": "San Francisco", "PostalCode": "94109", "StreetNum": "58"}',
    'PuluGBlock',
    '{"email": "hotel8@pulu.com", "phoneNumbers": ["415-555-0408"]}',
    5,
    5
  );

------------------------------------------------------------
-- Insert Rooms for Each "PuluGBlock" Hotel
------------------------------------------------------------
-- Hotel 1: Market Street, San Francisco
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Market Street", "City": "San Francisco", "PostalCode": "94102", "StreetNum": "51"}',
    1,
    330.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Market Street", "City": "San Francisco", "PostalCode": "94102", "StreetNum": "51"}',
    2,
    380.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "TV": true}'
  ),
  (
    '{"StreetName": "Market Street", "City": "San Francisco", "PostalCode": "94102", "StreetNum": "51"}',
    3,
    430.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Market Street", "City": "San Francisco", "PostalCode": "94102", "StreetNum": "51"}',
    4,
    480.00,
    'Suite',
    true,
    'Skyline view',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Market Street", "City": "San Francisco", "PostalCode": "94102", "StreetNum": "51"}',
    5,
    350.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- Hotel 2: Van Ness Ave, San Francisco
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Van Ness Ave", "City": "San Francisco", "PostalCode": "94103", "StreetNum": "52"}',
    1,
    335.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Van Ness Ave", "City": "San Francisco", "PostalCode": "94103", "StreetNum": "52"}',
    2,
    385.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "TV": true}'
  ),
  (
    '{"StreetName": "Van Ness Ave", "City": "San Francisco", "PostalCode": "94103", "StreetNum": "52"}',
    3,
    435.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Van Ness Ave", "City": "San Francisco", "PostalCode": "94103", "StreetNum": "52"}',
    4,
    485.00,
    'Suite',
    true,
    'Skyline view',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Van Ness Ave", "City": "San Francisco", "PostalCode": "94103", "StreetNum": "52"}',
    5,
    360.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- Hotel 3: Lombard St, San Francisco
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Lombard St", "City": "San Francisco", "PostalCode": "94104", "StreetNum": "53"}',
    1,
    340.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Lombard St", "City": "San Francisco", "PostalCode": "94104", "StreetNum": "53"}',
    2,
    390.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "TV": true}'
  ),
  (
    '{"StreetName": "Lombard St", "City": "San Francisco", "PostalCode": "94104", "StreetNum": "53"}',
    3,
    440.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Lombard St", "City": "San Francisco", "PostalCode": "94104", "StreetNum": "53"}',
    4,
    490.00,
    'Suite',
    true,
    'Skyline view',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Lombard St", "City": "San Francisco", "PostalCode": "94104", "StreetNum": "53"}',
    5,
    365.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- Hotel 4: Embarcadero, San Francisco
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Embarcadero", "City": "San Francisco", "PostalCode": "94105", "StreetNum": "54"}',
    1,
    345.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Embarcadero", "City": "San Francisco", "PostalCode": "94105", "StreetNum": "54"}',
    2,
    395.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "TV": true}'
  ),
  (
    '{"StreetName": "Embarcadero", "City": "San Francisco", "PostalCode": "94105", "StreetNum": "54"}',
    3,
    445.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Embarcadero", "City": "San Francisco", "PostalCode": "94105", "StreetNum": "54"}',
    4,
    495.00,
    'Suite',
    true,
    'Skyline view',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Embarcadero", "City": "San Francisco", "PostalCode": "94105", "StreetNum": "54"}',
    5,
    370.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- Hotel 5: Haight Street, San Francisco
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Haight Street", "City": "San Francisco", "PostalCode": "94106", "StreetNum": "55"}',
    1,
    350.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Haight Street", "City": "San Francisco", "PostalCode": "94106", "StreetNum": "55"}',
    2,
    400.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "TV": true}'
  ),
  (
    '{"StreetName": "Haight Street", "City": "San Francisco", "PostalCode": "94106", "StreetNum": "55"}',
    3,
    450.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Haight Street", "City": "San Francisco", "PostalCode": "94106", "StreetNum": "55"}',
    4,
    500.00,
    'Suite',
    true,
    'Skyline view',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Haight Street", "City": "San Francisco", "PostalCode": "94106", "StreetNum": "55"}',
    5,
    355.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- Hotel 6: Folsom St, San Francisco
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Folsom St", "City": "San Francisco", "PostalCode": "94107", "StreetNum": "56"}',
    1,
    355.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Folsom St", "City": "San Francisco", "PostalCode": "94107", "StreetNum": "56"}',
    2,
    405.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "TV": true}'
  ),
  (
    '{"StreetName": "Folsom St", "City": "San Francisco", "PostalCode": "94107", "StreetNum": "56"}',
    3,
    455.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Folsom St", "City": "San Francisco", "PostalCode": "94107", "StreetNum": "56"}',
    4,
    505.00,
    'Suite',
    true,
    'Skyline view',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Folsom St", "City": "San Francisco", "PostalCode": "94107", "StreetNum": "56"}',
    5,
    360.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- Hotel 7: Mission St, San Francisco
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Mission St", "City": "San Francisco", "PostalCode": "94108", "StreetNum": "57"}',
    1,
    360.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Mission St", "City": "San Francisco", "PostalCode": "94108", "StreetNum": "57"}',
    2,
    410.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "TV": true}'
  ),
  (
    '{"StreetName": "Mission St", "City": "San Francisco", "PostalCode": "94108", "StreetNum": "57"}',
    3,
    460.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Mission St", "City": "San Francisco", "PostalCode": "94108", "StreetNum": "57"}',
    4,
    510.00,
    'Suite',
    true,
    'Skyline view',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Mission St", "City": "San Francisco", "PostalCode": "94108", "StreetNum": "57"}',
    5,
    365.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

-- Hotel 8: Castro St, San Francisco
INSERT INTO
  Room (
    HotelAddress,
    RoomID,
    Price,
    Capacity,
    Extendable,
    View,
    Damages,
    Amenities
  )
VALUES
  (
    '{"StreetName": "Castro St", "City": "San Francisco", "PostalCode": "94109", "StreetNum": "58"}',
    1,
    365.00,
    'Single',
    false,
    'Street view',
    NULL,
    '{"WiFi": true}'
  ),
  (
    '{"StreetName": "Castro St", "City": "San Francisco", "PostalCode": "94109", "StreetNum": "58"}',
    2,
    415.00,
    'Double',
    true,
    'City view',
    NULL,
    '{"WiFi": true, "TV": true}'
  ),
  (
    '{"StreetName": "Castro St", "City": "San Francisco", "PostalCode": "94109", "StreetNum": "58"}',
    3,
    465.00,
    'Triple',
    false,
    'Park view',
    NULL,
    '{"WiFi": true, "Balcony": true}'
  ),
  (
    '{"StreetName": "Castro St", "City": "San Francisco", "PostalCode": "94109", "StreetNum": "58"}',
    4,
    515.00,
    'Suite',
    true,
    'Skyline view',
    NULL,
    '{"WiFi": true, "Kitchen": true}'
  ),
  (
    '{"StreetName": "Castro St", "City": "San Francisco", "PostalCode": "94109", "StreetNum": "58"}',
    5,
    370.00,
    'Double',
    false,
    'Side view',
    NULL,
    '{"WiFi": true, "Safe": true}'
  );

------------------------------------------------------------
-- 2c. DATABASE QUERIES
------------------------------------------------------------
-- Query 1: Simple filtering: Retrieve all hotels for the "SleepyDan" chain.
SELECT
  *
FROM
  Hotel
WHERE
  ChainName = 'SleepyDan';

-- Query 2: Aggregation: Count the number of hotels per chain.
SELECT
  ChainName,
  COUNT(*) AS NumHotels
FROM
  Hotel
GROUP BY
  ChainName;

-- Query 3: Nested Query: Retrieve hotels that have more rooms than the overall average number of rooms.
SELECT
  *
FROM
  Hotel
WHERE
  NumRooms > (
    SELECT
      AVG(NumRooms)
    FROM
      Hotel
  );

-- Query 4: Date-range Query: (Example for Booking – ensure you have Booking data populated)
SELECT
  *
FROM
  Booking
WHERE
  CheckInDate >= '2025-04-01'
  AND CheckOutDate <= '2025-04-10';