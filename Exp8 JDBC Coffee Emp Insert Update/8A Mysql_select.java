package com.mysql;

import java.sql.*;
import java.util.Properties;

public class Mysql_select {
    public static void main(String[] args) {
        Connection dbConnection = null;

        try {
            // Set up database connection
            String url = "jdbc:mysql://localhost/test";
            Properties info = new Properties();
            info.put("user", "root");
            info.put("password", "");
            dbConnection = DriverManager.getConnection(url, info);

            if (dbConnection != null) {
                System.out.println("Successfully connected to MySQL database 'test'");
            }

            // SELECT query
            String query = "SELECT * FROM coffee";
            Statement st = dbConnection.createStatement();
            ResultSet rs = st.executeQuery(query);

            // Iterate through the result set
            while (rs.next()) {
                int id = rs.getInt("id");
                String coffee_name = rs.getString("coffee_name");
                int priced = rs.getInt("priced"); // Changed from "price" to "priced"
                System.out.format("\n%d, %s, %d", id, coffee_name, priced);
            }

            rs.close();
            st.close();

            // INSERT query using PreparedStatement (use column "priced")
            String query1 = "INSERT INTO coffee (coffee_name, priced) VALUES (?, ?)";
            PreparedStatement stmt = dbConnection.prepareStatement(query1);
            stmt.setString(1, "Tajmahal");
            stmt.setInt(2, 950);
            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("\nA new coffee record inserted successfully.");
            }

            stmt.close();
            dbConnection.close();

        } catch (SQLException ex) {
            System.out.println("An error occurred while connecting to MySQL database");
            ex.printStackTrace();
        } catch (Exception e) {
            System.err.println("Got an exception!");
            System.err.println(e.getMessage());
        }
    }
}
