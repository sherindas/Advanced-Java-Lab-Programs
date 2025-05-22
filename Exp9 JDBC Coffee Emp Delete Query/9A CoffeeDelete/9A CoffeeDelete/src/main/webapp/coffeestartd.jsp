<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Coffees Starting with D</title>
</head>
<body>
    <h2>Coffee Products Starting with 'D'</h2>
    <table border="1" cellpadding="5" cellspacing="0">
        <tr><th>ID</th><th>Coffee Name</th><th>Price</th></tr>
<%
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
        stmt = con.createStatement();

        rs = stmt.executeQuery("SELECT * FROM coffee WHERE coffee_name LIKE 'D%'");

        boolean hasResults = false;
        while (rs.next()) {
            hasResults = true;
%>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("coffee_name") %></td>
                <td><%= rs.getDouble("price") %></td>
            </tr>
<%
        }
        if (!hasResults) {
%>
            <tr><td colspan="3">No coffee products found starting with 'D'</td></tr>
<%
        }
    } catch (Exception e) {
%>
        <tr><td colspan="3" style="color:red;">Error: <%= e.getMessage() %></td></tr>
<%
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (con != null) con.close();
    }
%>
    </table>
    <br>
    <a href="index.html">Back to Home</a>
</body>
</html>
