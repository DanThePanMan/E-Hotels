const express = require("express");
const cors = require("cors");
const { pool } = require("./db");

const app = express();

app.use(cors());
app.use(express.json());

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
