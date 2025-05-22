<%@ page import="java.sql.*" %>
<%
    String idStr = request.getParameter("id");
    String coffeeName = request.getParameter("coffee_name");
    String priceStr = request.getParameter("price");

    if(idStr != null && coffeeName != null && priceStr != null) {
        int id = Integer.parseInt(idStr);
        double price = Double.parseDouble(priceStr);

        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
            String sql = "UPDATE coffee SET coffee_name = ?, price = ? WHERE id = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, coffeeName);
            ps.setDouble(2, price);
            ps.setInt(3, id);

            int result = ps.executeUpdate();
            if(result > 0) {
%>
                <p style="color:green;">Coffee updated successfully! Rows affected: <%= result %></p>
<%
            } else {
%>
                <p style="color:red;">No coffee found with ID: <%= id %></p>
<%
            }
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
    <p style="color:red;">Please provide ID, coffee name, and price.</p>
<%
    }
%>
<a href="index.html">Back to Form</a> | <a href="view.jsp">View Coffees</a>
