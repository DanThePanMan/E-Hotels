const Pool = require("pg").Pool;
require("dotenv").config();

const pool = new Pool({
    user: "postgres",
    password: process.env.DB_PASSWORD,
    host: "localhost",
    database: process.env.DB_NAME,
    port: "5432",
});

module.exports = { pool };
