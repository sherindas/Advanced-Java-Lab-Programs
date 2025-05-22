<%@ page import="java.sql.*" %>
<%
    String coffeeName = request.getParameter("coffee_name");
    String priceStr = request.getParameter("price");

    if(coffeeName != null && priceStr != null) {
        double price = Double.parseDouble(priceStr);

        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
            String sql = "INSERT INTO coffee (coffee_name, price) VALUES (?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, coffeeName);
            ps.setDouble(2, price);

            int result = ps.executeUpdate();
%>
            <p style="color:green;">Coffee inserted successfully! Rows affected: <%= result %></p>
<%
        } catch(Exception e) {
%>
            <p style="color:red;">Error: <%= e.getMessage() %></p>
<%
        } finally {
            if(ps != null) ps.close();
            if(con != null) con.close();
        }
    } else {
%>
    <p style="color:red;">Please provide coffee name and price.</p>
<%
    }
%>
<a href="index.html">Back to Form</a> | <a href="view.jsp">View Coffees</a>
