<%@ page import="java.sql.*" %>
<%
    String empnoStr = request.getParameter("empno");
    String empname = request.getParameter("empname");
    String basicsalaryStr = request.getParameter("basicsalary");

    if(empnoStr == null || empname == null || basicsalaryStr == null ||
       empnoStr.trim().isEmpty() || empname.trim().isEmpty() || basicsalaryStr.trim().isEmpty()) {
%>
<html><body>
    <h3 style="color:red;">Error: All fields are required.</h3>
    <a href="insertEmp.jsp">Back to Insert Form</a>
</body></html>
<%
        return;
    }

    int empno = 0;
    int basicsalary = 0;
    try {
        empno = Integer.parseInt(empnoStr);
        basicsalary = Integer.parseInt(basicsalaryStr);
    } catch(Exception e) {
%>
<html><body>
    <h3 style="color:red;">Error: Employee Number and Basic Salary must be numbers.</h3>
    <a href="insertEmp.jsp">Back to Insert Form</a>
</body></html>
<%
        return;
    }

    String url = "jdbc:mysql://localhost:3306/Employee";
    String user = "root";
    String password = ""; // Your DB password here

    Connection conn = null;
    PreparedStatement pst = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        String insertSQL = "INSERT INTO Emp (Emp_NO, Emp_Name, Basicsalary) VALUES (?, ?, ?)";
        pst = conn.prepareStatement(insertSQL);
        pst.setInt(1, empno);
        pst.setString(2, empname);
        pst.setInt(3, basicsalary);
        pst.executeUpdate();
        pst.close();

        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT * FROM Emp");

        int grandTotal = 0;
%>
<!DOCTYPE html>
<html>
<head>
    <title>Salary Report</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f9f9f9; padding: 30px;}
        table { width: 60%; margin: auto; border-collapse: collapse; background: white; box-shadow: 0 0 10px #ccc;}
        th, td { border: 1px solid #ddd; padding: 12px; text-align: center; }
        th { background-color: #007bff; color: white; }
        caption { font-size: 24px; margin-bottom: 15px; font-weight: bold;}
        tfoot td { font-weight: bold; }
        a { text-decoration: none; color: #007bff; }
        a:hover { text-decoration: underline; }
        .nav-links {text-align:center; margin-top: 20px;}
    </style>
</head>
<body>
    <table>
        <caption>Salary Report</caption>
        <thead>
            <tr>
                <th>Emp_No</th>
                <th>Emp_Name</th>
                <th>Basic Salary</th>
            </tr>
        </thead>
        <tbody>
        <%
            while(rs.next()) {
                int eNo = rs.getInt("Emp_NO");
                String eName = rs.getString("Emp_Name");
                int basic = rs.getInt("Basicsalary");
                grandTotal += basic;
        %>
            <tr>
                <td><%= eNo %></td>
                <td><%= eName %></td>
                <td><%= basic %></td>
            </tr>
        <%
            }
        %>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="2" style="text-align:right;">Grand Salary :</td>
                <td><%= grandTotal %></td>
            </tr>
        </tfoot>
    </table>
    <div class="nav-links">
        <a href="insertEmp.jsp">Insert Another Employee</a> | 
        <a href="searchDeleteEmp.jsp">Search/Delete Employees</a>
    </div>
</body>
</html>
<%
    } catch(Exception e) {
        out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
    } finally {
        try { if(rs != null) rs.close(); } catch(Exception e) {}
        try { if(stmt != null) stmt.close(); } catch(Exception e) {}
        try { if(pst != null) pst.close(); } catch(Exception e) {}
        try { if(conn != null) conn.close(); } catch(Exception e) {}
    }
%>
