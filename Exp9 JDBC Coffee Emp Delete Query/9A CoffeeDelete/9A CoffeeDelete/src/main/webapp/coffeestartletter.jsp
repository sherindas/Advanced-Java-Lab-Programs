<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Coffees Starting With Letter</title>
</head>
<body>
<%
    String startLetter = request.getParameter("startLetter");
    if (startLetter == null || startLetter.trim().isEmpty()) {
%>
    <p style="color:red;">Please provide a starting letter.</p>
<%
    } else {
        startLetter = startLetter.trim().toUpperCase();  // normalize to uppercase

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");

            // Use prepared statement with LIKE and parameter
            String sql = "SELECT * FROM coffee WHERE coffee_name LIKE ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, startLetter + "%");

            rs = ps.executeQuery();

%>
            <h2>Coffees starting with '<%= startLetter %>'</h2>
            <table border="1" cellpadding="5" cellspacing="0">
                <tr><th>ID</th><th>Coffee Name</th><th>Price</th></tr>
<%
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
                <tr><td colspan="3">No coffee products found starting with '<%= startLetter %>'</td></tr>
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
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
    }
%>
<br><a href="index.html">Back to Home</a>
</body>
</html>
