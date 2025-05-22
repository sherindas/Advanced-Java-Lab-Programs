<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Coffee Product</title>
</head>
<body>
<%
    String idStr = request.getParameter("id");

    if (idStr != null) {
        int id = Integer.parseInt(idStr);

        Connection con = null;
        PreparedStatement ps = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");

            String deleteSQL = "DELETE FROM coffee WHERE id = ?";
            ps = con.prepareStatement(deleteSQL);
            ps.setInt(1, id);
            int deletedCount = ps.executeUpdate();

            if (deletedCount > 0) {
%>
                <p style="color:green;">Coffee with ID <%= id %> deleted successfully.</p>
<%
            } else {
%>
                <p style="color:red;">No coffee found with ID: <%= id %></p>
<%
            }
            ps.close();

            // Display remaining records
            stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT * FROM coffee");
%>
            <h3>Remaining Coffee Products:</h3>
            <table border="1" cellpadding="5" cellspacing="0">
                <tr><th>ID</th><th>Coffee Name</th><th>Price</th></tr>
<%
            while (rs.next()) {
%>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("coffee_name") %></td>
                    <td><%= rs.getDouble("price") %></td>
                </tr>
<%
            }
%>
            </table>
<%
        } catch (Exception e) {
%>
            <p style="color:red;">Error: <%= e.getMessage() %></p>
<%
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
    } else {
%>
    <p style="color:red;">Please provide a coffee ID to delete.</p>
<%
    }
%>
<br><a href="index.html">Back to Home</a>
</body>
</html>
