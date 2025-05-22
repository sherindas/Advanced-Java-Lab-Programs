<%@ page import="java.sql.*" %>
<html>
<head><title>View Coffee Products</title></head>
<body>
    <h2>All Coffee Products</h2>
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
        rs = stmt.executeQuery("SELECT * FROM coffee");

        while(rs.next()) {
%>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("coffee_name") %></td>
            <td><%= rs.getDouble("price") %></td>
        </tr>
<%
        }
    } catch(Exception e) {
%>
        <tr><td colspan="3" style="color:red;">Error: <%= e.getMessage() %></td></tr>
<%
    } finally {
        if(rs != null) rs.close();
        if(stmt != null) stmt.close();
        if(con != null) con.close();
    }
%>
    </table>
    <br>
    <a href="index.html">Back to Form</a>
</body>
</html>
