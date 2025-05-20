//9a. Read all the existing records from the table coffee which is from the database test and delete
//an existing coffee product from the table with its id.

package com.mysql;

import java.sql.*;
import java.util.Properties;

public class Mysql_Delete {
    public static void main(String[] args) {
        try {
            Connection dbConnection = null;

            // Connect to the MySQL database
            String url = "jdbc:mysql://localhost/test";
            Properties info = new Properties();
            info.put("user", "root");
            info.put("password", "");
            dbConnection = DriverManager.getConnection(url, info);

            if (dbConnection != null) {
                System.out.println("Successfully connected to MySQL database 'test'");
            }

            // SELECT all records from the coffee table
            String query = "SELECT * FROM coffee";
            Statement st = dbConnection.createStatement();
            ResultSet rs = st.executeQuery(query);

            // Display the results
            while (rs.next()) {
                int id = rs.getInt("id");
                String coffee_name = rs.getString("coffee_name");
                int priced = rs.getInt("priced");  // Corrected column name
                System.out.format("\n%d, %s, %d", id, coffee_name, priced);
            }

            rs.close();
            st.close();

            // DELETE a specific record by ID
            String query3 = "DELETE FROM coffee WHERE id = 103";
            PreparedStatement preparedStmt2 = dbConnection.prepareStatement(query3);
            int rowsDeleted = preparedStmt2.executeUpdate();
            if (rowsDeleted > 0) {
                System.out.println("\nRecord with ID 264 deleted successfully.");
            } else {
                System.out.println("\nNo record found with ID 264.");
            }

            preparedStmt2.close();
            dbConnection.close();

        } catch (Exception e) {
            System.err.println("Got an exception!");
            System.err.println(e.getMessage());
        }
    }
}
