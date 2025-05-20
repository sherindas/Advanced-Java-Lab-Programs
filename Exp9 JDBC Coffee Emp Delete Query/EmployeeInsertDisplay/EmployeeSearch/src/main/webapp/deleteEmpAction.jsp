<%@ page import="java.sql.*" %>
<%
    String empnoStr = request.getParameter("empno");
    if(empnoStr == null || empnoStr.trim().isEmpty()) {
%>
<html><body>
    <h3 style="color:red;">Error: Employee number is required to delete.</h3>
    <a href="searchDeleteEmp.jsp">Back to Search</a>
</body></html>
<%
        return;
    }

    int empno = 0;
    try {
        empno = Integer.parseInt(empnoStr);
    } catch(Exception e) {
%>
<html><body>
    <h3 style="color:red;">Error: Invalid Employee number.</h3>
    <a href="searchDeleteEmp.jsp">Back to Search</a>
</body></html>
<%
        return;
    }

    String url = "jdbc:mysql://localhost:3306/Employee";
    String user = "root";
    String password = ""; // Your password here

    Connection conn = null;
    PreparedStatement pst = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        String sql = "DELETE FROM Emp WHERE Emp_NO = ?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, empno);

        int rowsDeleted = pst.executeUpdate();

%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Employee</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f9f9f9; padding: 30px; text-align: center;}
        .message { margin-top: 50px; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px #ccc; display: inline-block;}
        a { text-decoration: none; color: #007bff; font-weight: bold;}
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="message">
        <h2>
        <% if(rowsDeleted > 0) { %>
            Employee with Emp_No <%= empno %> deleted successfully.
        <% } else { %>
            Employee with Emp_No <%= empno %> not found.
        <% } %>
        </h2>
        <a href="searchDeleteEmp.jsp">Back to Search</a>
    </div>
</body>
</html>
<%
    } catch(Exception e) {
        out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
    } finally {
        try { if(pst != null) pst.close(); } catch(Exception e) {}
        try { if(conn != null) conn.close(); } catch(Exception e) {}
    }
%>
