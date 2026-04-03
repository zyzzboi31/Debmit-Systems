package com.cemk.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {

    // FIX: Move credentials to environment variables or a config file.
    // For now, constants are used to centralize them — never hardcode in production.
    /*
     * Reads DB config from environment variables.
     * On Railway: set MYSQL_URL, MYSQL_USER, MYSQL_PASSWORD in the Railway dashboard.
     * Railway's MySQL plugin sets these automatically.
     * For local dev: set them in your OS, or the defaults below are used.
     */
    private static final String URL = System.getenv("MYSQL_URL") != null
            ? System.getenv("MYSQL_URL")
            : "jdbc:mysql://localhost:3306/cemk_db?useSSL=false&allowPublicKeyRetrieval=true";

    private static final String USER = System.getenv("MYSQL_USER") != null
            ? System.getenv("MYSQL_USER")
            : "root";

    private static final String PASSWORD = System.getenv("MYSQL_PASSWORD") != null
            ? System.getenv("MYSQL_PASSWORD")
            : "madara031"; // local dev fallback only

    public Connection dbConnect() {
        Connection con = null; // FIX: Local variable — not an instance field (was not thread-safe before)
        try {
            // Step-1: Load the driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Step-2: Establish the connection
            con = DriverManager.getConnection(URL, USER, PASSWORD);

            if (con != null) {
                System.out.println("Connection Found");
            } else {
                System.out.println("Connection Not Found");
            }

        } catch (ClassNotFoundException e) {
            System.out.println("Driver not found: " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("Connection error: " + e.getMessage());
        }
        return con;
    }

    // FIX: Added a helper to safely close a connection
    public static void closeConnection(Connection con) {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println("Error closing connection: " + e.getMessage());
            }
        }
    }

    public static void main(String[] args) {
        DbConnection dbConnection = new DbConnection();
        Connection con = dbConnection.dbConnect();
        closeConnection(con); // FIX: Always close after use
    }
}
