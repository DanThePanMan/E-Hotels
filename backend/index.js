const express = require("express");
const cors = require("cors");
const { pool } = require("./db");

const app = express();

app.use(cors());
app.use(express.json());

//Retrieve all hotels
app.get("/hotels/", async (req, res) => {
    try {
        const hotels = await pool.query("SELECT * FROM hotel");

        res.json(hotels.rows);
    } catch (error) {
        console.error("Error fetching hotels:", error);
        res.status(500).send("Internal Server Error");
    }
});

//Retrieve all hotels from a branch
app.get("/hotels/:chainname", async (req, res) => {
    try {
        const { chainname } = req.params;
        const hotels = await pool.query(
            "SELECT * FROM hotel WHERE chainname = $1",
            [chainname]
        );

        res.json(hotels.rows);
    } catch (error) {
        console.error("Error fetching hotels:", error);
        res.status(500).send("Internal Server Error");
    }
});

//retrieve count of hotels from a branch
app.get("/hotels/:chainname/count", async (req, res) => {
    try {
        const { chainname } = req.params;
        const hotels = await pool.query(
            "SELECT $1, COUNT(*) AS TotalHotels FROM hotel GROUP BY $1",
            [chainname]
        );

        res.json(hotels.rows[0].totalhotels);
    } catch (error) {
        console.error("Error fetching hotels:", error);
        res.status(500).send("Internal Server Error");
    }
});

//retrieve hotesl with more rooms than overall average
app.get("/hotels/moreThanAverage", async (req, res) => {
    try {
        const hotels = await pool.query(
            "SELECT * FROM hotel WHERE numrooms > (SELECT AVG(numrooms) FROM hotel);"
        );

        res.json(hotels.rows);
    } catch (error) {
        console.error("Error fetching hotels:", error);
        res.status(500).send("Internal Server Error");
    }
});

//get all bookings
app.get("/bookings", async (req, res) => {
    try {
        const bookings = await pool.query(
            "SELECT b.*, c.Name as CustomerName, c.RegistrationDate, c.Address FROM booking b JOIN customer c ON b.CustomerID = c.CustomerID"
        );

        res.json(bookings.rows);
    } catch (error) {
        console.error("Error fetching bookings:", error);
        res.status(500).send("Internal Server Error");
    }
});

app.delete("/bookings/:id", async (req, res) => {
    try {
        const { id } = req.params;
        const deletedBooking = await pool.query(
            "DELETE FROM booking WHERE bookingid = $1",
            [id]
        );
        res.json(deletedBooking.rows[0]);
    } catch (error) {
        console.error("Error deleting booking:", error);
        res.status(500).send("Internal Server Error");
    }
});

//get all rentings
app.get("/rentings", async (req, res) => {
    try {
        const rentings = await pool.query(
            "SELECT r.*, c.Name as CustomerName, c.RegistrationDate, c.Address FROM renting r JOIN customer c ON r.CustomerID = c.CustomerID"
        );
        res.json(rentings.rows);
    } catch (error) {
        console.error("Error fetching bookings:", error);
        res.status(500).send("Internal Server Error");
    }
});

///this might not work
app.delete("/rentings/:id", async (req, res) => {
    try {
        const { id } = req.params;
        const deletedRenting = await pool.query(
            "DELETE FROM renting WHERE rentingid = $1",
            [id]
        );
        res.json(deletedRenting.rows[0]);
    } catch (error) {
        console.error("Error deleting booking:", error);
        res.status(500).send("Internal Server Error");
    }
});

//delete a renting
app.delete("/rentings/:id", async (req, res) => {
    try {
        const { id } = req.params;
        const deletedRenting = await pool.query(
            "DELETE FROM renting WHERE RentingID = $1",
            [id]
        );
        if (deletedRenting.rows.length === 0) {
            return res.status(404).send("Renting not found");
        }
        res.json(deletedRenting.rows[0]);
    } catch (error) {
        console.error("Error deleting renting:", error);
        res.status(500).send("Internal Server Error");
    }
});

//get allrooms with an email
app.get("/rooms/:postalCode", async (req, res) => {
    try {
        const { postalCode } = req.params;
        const rooms = await pool.query(
            "SELECT R.*, H.Address AS HotelAddress FROM room R JOIN hotel H ON R.HotelAddress = H.Address WHERE H.Address->>'PostalCode' = $1",
            [postalCode]
        );

        res.json(rooms.rows);
    } catch (error) {
        console.error("Error fetching rooms:", error);
        res.status(500).send("Internal Server Error");
    }
});

//dynamic query
//Parameters: :capacity, :chain, :rating, :area, :max_price,
app.get(
    "/rooms/:capacity/:chain/:rating/:area/:max_price",
    async (req, res) => {
        try {
            const { capacity, chain, rating, area, max_price } = req.params;

            const result = await pool.query(
                `SELECT R.*, H.ChainName, H.Rating, H.NumRooms, H.Address->>'City' AS City
FROM room R
JOIN hotel H ON R.HotelAddress = H.Address
WHERE R.Capacity = $1
  AND H.ChainName = $2
  AND H.Rating = $3
  AND H.Address->>'City' = $4
  AND R.Price <= $5
  AND NOT EXISTS (
      SELECT 1 FROM booking B
      WHERE B.HotelAddress = R.HotelAddress
        AND B.RoomID = R.RoomID
  )
  AND NOT EXISTS (
      SELECT 1 FROM renting Ren
      WHERE Ren.HotelAddress = R.HotelAddress
        AND Ren.RoomID = R.RoomID
  );`,
                [capacity, chain, rating, area, max_price]
            );
            res.json(result.rows);
        } catch (error) {
            console.error("Error fetching rooms:", error);
            res.status(500).send("Internal Server Error");
        }
    }
);

//Retrieve all rooms with minibar
app.get("/rooms/withMinibar", async (req, res) => {
    try {
        const rooms = await pool.query(
            "SELECT * FROM room WHERE amenities ? 'MiniBar';"
        );

        res.json(rooms.rows);
    } catch (error) {
        console.error("Error fetching rooms:", error);
        res.status(500).send("Internal Server Error");
    }
});

//insert a new customer
app.post("/customers", async (req, res) => {
    /* 
    format for the address:
    '{"City": "TestCity", "StreetName": "Test St", "StreetNum": "100", "PostalCode": "00000"}'
    */
    try {
        const { name, registrationDate, address } = req.body;
        const newCustomer = await pool.query(
            "INSERT INTO customer (Name, RegistrationDate, Address) VALUES ($1, $2, $3) RETURNING *",
            [name, registrationDate, address]
        );
        res.status(201).json(newCustomer.rows[0]);
    } catch (error) {
        console.error("Error inserting customer:", error);
        res.status(500).send("Internal Server Error");
    }
});

//updating a customer's name
app.put("/customers/:id", async (req, res) => {
    try {
        const { id } = req.params;
        const { name } = req.body;
        const updatedCustomer = await pool.query(
            "UPDATE customer SET Name = $1 WHERE CustomerID = $2;",
            [name, id]
        );
        if (updatedCustomer.rows.length === 0) {
            return res.status(404).send("Customer not found");
        }
        res.json(updatedCustomer.rows[0]);
    } catch (error) {
        console.error("Error updating customer:", error);
        res.status(500).send("Internal Server Error");
    }
});

//deleting a customer
app.delete("/customers/:id", async (req, res) => {
    try {
        const { id } = req.params;
        const deletedCustomer = await pool.query(
            "DELETE FROM customer WHERE CustomerID = $1",
            [id]
        );
        if (deletedCustomer.rows.length === 0) {
            return res.status(404).send("Customer not found");
        }
        res.json(deletedCustomer.rows[0]);
    } catch (error) {
        console.error("Error deleting customer:", error);
        res.status(500).send("Internal Server Error");
    }
});

//inserting a new employee
app.post("/employees", async (req, res) => {
    try {
        const { SSN, name, role } = req.body;
        const newEmployee = await pool.query(
            "INSERT INTO employee (SSN, Name, Role) VALUES ($1, $2, $3);",
            [SSN, name, role]
        );
        res.status(201).json(newEmployee.rows[0]);
    } catch (error) {
        console.error("Error inserting employee:", error);
        res.status(500).send("Internal Server Error");
    }
});

//promoting an employee
app.put("/employees/:ssn", async (req, res) => {
    try {
        const { ssn } = req.params;
        const updatedEmployee = await pool.query(
            "UPDATE employee SET Role = 'Manager' WHERE SSN = '$1",
            [ssn]
        );
        if (updatedEmployee.rows.length === 0) {
            return res.status(404).send("Employee not found");
        }
        res.json(updatedEmployee.rows[0]);
    } catch (error) {
        console.error("Error updating employee:", error);
        res.status(500).send("Internal Server Error");
    }
});

//deleting an employee
app.delete("/employees/:ssn", async (req, res) => {
    try {
        const { ssn } = req.params;
        const deletedEmployee = await pool.query(
            "DELETE FROM employee WHERE SSN = $1",
            [ssn]
        );
        if (deletedEmployee.rows.length === 0) {
            return res.status(404).send("Employee not found");
        }
        res.json(deletedEmployee.rows[0]);
    } catch (error) {
        console.error("Error deleting employee:", error);
        res.status(500).send("Internal Server Error");
    }
});

//convert booking to renting
app.put("/bookings/:id", async (req, res) => {
    try {
        const { id } = req.params;
        const updatedBooking = await pool.query(
            `INSERT INTO renting (HotelAddress, RoomID, CustomerID, EmployeeSSN, CheckInDate, CheckOutDate)
        SELECT HotelAddress, RoomID, CustomerID, '123-45-6789', CheckInDate, CheckOutDate
        FROM booking
        WHERE BookingID = $1;`,
            [id]
        );
        const q2 = await pool.query(
            `
        DELETE FROM booking WHERE BookingID = $1;
    `,
            [id]
        );
        if (updatedBooking.rows.length === 0) {
            return res.status(404).send("Booking not found");
        }
        res.json(updatedBooking.rows[0]);
    } catch (error) {
        console.error("Error updating booking:", error);
        res.status(500).send("Internal Server Error");
    }
});

//recording customer payment for renting (Does not work)
app.put("/rentings/:id", async (req, res) => {
    try {
        const { id } = req.params;
        const updatedRenting = await pool.query(
            "UPDATE renting SET PaymentStatus = 'Paid' WHERE RentingID = $1;",
            [id]
        );
        if (updatedRenting.rows.length === 0) {
            return res.status(404).send("Renting not found");
        }
        res.json(updatedRenting.rows[0]);
    } catch (error) {
        console.error("Error updating renting:", error);
        res.status(500).send("Internal Server Error");
    }
});

//available rooms per area
app.get("/per_area", async (req, res) => {
    try {
        const rooms = await pool.query(
            "SELECT * FROM available_rooms_per_area;"
        );
        res.json(rooms.rows);
    } catch (error) {
        console.error("Error fetching rooms:", error);
        res.status(500).send("Internal Server Error");
    }
});

//aggregated capacity per hotel
app.get("/agg", async (_, res) => {
    try {
        const hotels = await pool.query(
            "SELECT * FROM aggregated_capacity_per_hotel;"
        );
        res.json(hotels.rows);
    } catch (error) {
        console.error("Error fetching hotels:", error);
        res.status(500).send("Internal Server Error");
    }
});

app.post("/bookings", async (req, res) => {
    try {
        const { HotelAddress, RoomID, CustomerID, CheckInDate, CheckOutDate } =
            req.body;
        const newEmployee = await pool.query(
            "INSERT INTO booking (HotelAddress, RoomID, CustomerID, CheckInDate, CheckOutDate)VALUES (  $1,  $2,  $3,  $4,  $5);",
            [HotelAddress, RoomID, CustomerID, CheckInDate, CheckOutDate]
        );
        res.status(201).json(newEmployee.rows[0]);
    } catch (error) {
        console.error("Error inserting employee:", error);
        res.status(500).send("Internal Server Error");
    }
});

app.listen(3000, () => {
    console.log("Server is running on port 3000 and listening for requests...");
    pool.query("SELECT 1", (err, res) => {
        if (err) {
            console.error("Database connection failed:", err);
        } else {
            console.log("Database is connected and operational.");
        }
    });
});
