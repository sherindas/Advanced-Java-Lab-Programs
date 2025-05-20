<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%
    String empnoStr = request.getParameter("empno");
    String empname = request.getParameter("empname");
    String basicsalaryStr = request.getParameter("basicsalary");

    if (empnoStr == null || empname == null || basicsalaryStr == null ||
        empnoStr.trim().isEmpty() || empname.trim().isEmpty() || basicsalaryStr.trim().isEmpty()) {
%>
<html>
<head>
    <title>Error</title>
    <style>
        body { font-family: Arial; margin: 30px; }
        .btn { padding: 10px 20px; text-decoration: none; background-color: #007bff; color: white; border-radius: 5px; }
    </style>
</head>
<body>
    <h3>Error: All fields are required. Please fill the form properly.</h3>
    <a href="insertEmp.jsp" class="btn">Go Back to Insert Form</a>
</body>
</html>
<%
        return;
    }

    int empno = 0;
    int basicsalary = 0;

    try {
        empno = Integer.parseInt(empnoStr);
        basicsalary = Integer.parseInt(basicsalaryStr);
    } catch(NumberFormatException nfe) {
%>
<html>
<head>
    <title>Error</title>
    <style>
        body { font-family: Arial; margin: 30px; }
        .btn { padding: 10px 20px; text-decoration: none; background-color: #007bff; color: white; border-radius: 5px; }
    </style>
</head>
<body>
    <h3>Error: EmpNo and BasicSalary must be valid numbers.</h3>
    <a href="insertEmp.jsp" class="btn">Go Back to Insert Form</a>
</body>
</html>
<%
        return;
    }

    Connection conn = null;
    PreparedStatement pst = null;
    Statement stmt = null;
    ResultSet rs = null;

    String url = "jdbc:mysql://localhost:3306/Employee";
    String user = "root";
    String password = ""; // Replace with your actual MySQL password

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
<html>
<head>
    <title>Salary Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 30px;
        }
        h2 {
            color: #28a745;
        }
        table {
            width: 60%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #555;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        .grand-box {
            background-color: #f2f2f2;
            padding: 15px;
            border: 2px solid #28a745;
            width: fit-content;
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .buttons {
            margin-top: 20px;
        }
        .btn {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-right: 15px;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h2>Salary Report</h2>
    <table>
        <tr>
            <th>Emp No</th>
            <th>Emp Name</th>
            <th>Basic Salary</th>
        </tr>
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
    </table>
    <div class="grand-box">Grand Salary: <%= grandTotal %></div>
    <div class="buttons">
        <a href="insertEmp.jsp" class="btn">Insert Another Employee</a>
        <a href="updateEmp.jsp" class="btn">Update Employee</a>
    </div>
</body>
</html>
<%
    } catch(Exception e) {
%>
<html>
<head><title>Error</title></head>
<body>
    <h3>Error: <%= e.getMessage() %></h3>
    <a href="insertEmp.jsp" class="btn">Go Back</a>
</body>
</html>
<%
    } finally {
        try { if(rs != null) rs.close(); } catch(Exception e) {}
        try { if(stmt != null) stmt.close(); } catch(Exception e) {}
        try { if(pst != null) pst.close(); } catch(Exception e) {}
        try { if(conn != null) conn.close(); } catch(Exception e) {}
    }
%>
