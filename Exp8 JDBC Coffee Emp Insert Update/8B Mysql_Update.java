/*
 * 8b. Read all the existing records from the table coffee which is from the database test and update
an existing coffee product in the table with its id.
 */

package com.mysql;

import java.sql.*;
import java.util.Properties;

public class Mysql_Update {
    public static void main(String[] args) {
        try {
            Connection dbConnection = null;
            try {
                String url = "jdbc:mysql://localhost/test";
                Properties info = new Properties();
                info.put("user", "root");
                info.put("password", "");
                dbConnection = DriverManager.getConnection(url, info);

                if (dbConnection != null) {
                    System.out.println("Successfully connected to MySQL database 'test'");
                }
            } catch (SQLException ex) {
                System.out.println("An error occurred while connecting to the MySQL database");
                ex.printStackTrace();
            }

            // SQL SELECT query
            String query = "SELECT * FROM coffee";
            Statement st = dbConnection.createStatement();
            ResultSet rs = st.executeQuery(query);

            // Iterate through the result set
            while (rs.next()) {
                int id = rs.getInt("id");
                String coffee_name = rs.getString("coffee_name");
                int priced = rs.getInt("priced"); // Correct column name
                System.out.format("\n%d %s %d", id, coffee_name, priced);
            }

            rs.close();

            // Updating records (use correct column name: priced)
            String query2 = "UPDATE coffee SET priced = 950 WHERE id = 102";
            PreparedStatement preparedStmt1 = dbConnection.prepareStatement(query2);
            int rowsUpdated = preparedStmt1.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("\nCoffee record updated successfully.");
            } else {
                System.out.println("\nNo record found with ID = 102.");
            }
            preparedStmt1.close();

            dbConnection.close();

        } catch (Exception e) {
            System.err.println("Got an exception!");
            System.err.println(e.getMessage());
        }
    }
}
