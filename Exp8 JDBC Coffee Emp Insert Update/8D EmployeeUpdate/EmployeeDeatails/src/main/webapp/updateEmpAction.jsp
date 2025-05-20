<%@ page import="java.sql.*" %>
<%
    String empnoStr = request.getParameter("empno");
    String empname = request.getParameter("empname");
    String basicsalaryStr = request.getParameter("basicsalary");
    
    int empno = Integer.parseInt(empnoStr);
    int basicsalary = Integer.parseInt(basicsalaryStr);
    
    Connection conn = null;
    PreparedStatement pst = null;
    Statement stmt = null;
    ResultSet rs = null;
    
    String url = "jdbc:mysql://localhost:3306/Employee";
    String user = "root";
    String password = "";  // change accordingly
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
        
        // Update employee
        String updateSQL = "UPDATE Emp SET Emp_Name = ?, Basicsalary = ? WHERE Emp_NO = ?";
        pst = conn.prepareStatement(updateSQL);
        pst.setString(1, empname);
        pst.setInt(2, basicsalary);
        pst.setInt(3, empno);
        
        int rowsUpdated = pst.executeUpdate();
        pst.close();
%>
<html>
<head><title>Update Result</title></head>
<body>
<%
        if (rowsUpdated > 0) {
%>
    <p>Employee with Emp_No <%= empno %> updated successfully.</p>
<%
        } else {
%>
    <p>No employee found with Emp_No <%= empno %>.</p>
<%
        }
        
        // Show updated employee list
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT * FROM Emp");
%>
    <h2>Updated Employee List</h2>
    <table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>Emp_No</th>
            <th>Emp_Name</th>
            <th>Basicsalary</th>
        </tr>
<%
        while(rs.next()) {
            int eNo = rs.getInt("Emp_NO");
            String eName = rs.getString("Emp_Name");
            int basic = rs.getInt("Basicsalary");
%>
        <tr>
            <td><%= eNo %></td>
            <td><%= eName %></td>
            <td><%= basic %></td>
        </tr>
<%
        }
%>
    </table>
    <br/>
    <a href="updateEmp.jsp">Update Another Employee</a> | <a href="insertEmp.jsp">Insert New Employee</a>
</body>
</html>

<%
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        try { if(rs != null) rs.close(); } catch(Exception e) {}
        try { if(stmt != null) stmt.close(); } catch(Exception e) {}
        try { if(pst != null) pst.close(); } catch(Exception e) {}
        try { if(conn != null) conn.close(); } catch(Exception e) {}
    }
%>
