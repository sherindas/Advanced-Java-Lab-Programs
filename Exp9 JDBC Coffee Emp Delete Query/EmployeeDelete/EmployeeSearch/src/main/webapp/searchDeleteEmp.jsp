<%@ page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.DriverManager" %>


<!DOCTYPE html>
<html>
<head>
    <title>Search & Delete Employees</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f9f9f9; padding: 30px; }
        .container { max-width: 700px; margin: auto; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px #ccc; }
        h2 { text-align: center; color: #333; }
        label { font-weight: bold; }
        input[type=text] {
            width: 50px; padding: 5px; font-size: 18px; text-align: center; border: 1px solid #aaa; border-radius: 4px;
        }
        input[type=submit], button {
            background: #dc3545; color: white; border: none; padding: 8px 15px; border-radius: 4px; cursor: pointer;
            font-weight: bold;
        }
        input[type=submit]:hover, button:hover {
            background: #c82333;
        }
        table { width: 100%; border-collapse: collapse; margin-top: 20px;}
        th, td { border: 1px solid #ddd; padding: 10px; text-align: center; }
        th { background-color: #007bff; color: white; }
        tr:hover { background-color: #f1f1f1; }
        .nav-links {text-align:center; margin-top: 20px;}
        .nav-links a { text-decoration: none; color: #007bff; }
        .nav-links a:hover { text-decoration: underline; }
    </style>
    <script>
        function confirmDelete(empno) {
            if(confirm("Are you sure you want to delete Employee ID " + empno + "?")) {
                window.location.href = "deleteEmpAction.jsp?empno=" + empno;
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Search Employees by Starting Letter</h2>
        <form method="get" action="searchDeleteEmp.jsp">
            <label for="letter">Enter Starting Letter (Leave empty to show all): </label>
            <input type="text" id="letter" name="letter" maxlength="1" pattern="[a-zA-Z]?" title="Enter one letter" />
            <input type="submit" value="Search" />
        </form>

<%
    String letter = request.getParameter("letter");
    if(letter == null) letter = "";
    letter = letter.trim();

    String url = "jdbc:mysql://localhost:3306/Employee";
    String user = "root";
    String password = ""; // Your password here

    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        String sql;
        if(letter.isEmpty()) {
            sql = "SELECT * FROM Emp ORDER BY Emp_Name";
            pst = conn.prepareStatement(sql);
        } else {
            sql = "SELECT * FROM Emp WHERE Emp_Name LIKE ? ORDER BY Emp_Name";
            pst = conn.prepareStatement(sql);
            pst.setString(1, letter + "%");
        }

        rs = pst.executeQuery();

        boolean hasResults = false;
%>
        <table>
            <thead>
                <tr>
                    <th>Emp_No</th>
                    <th>Emp_Name</th>
                    <th>Basic Salary</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
<%
        while(rs.next()) {
            hasResults = true;
            int empno = rs.getInt("Emp_NO");
            String empname = rs.getString("Emp_Name");
            int basicsalary = rs.getInt("Basicsalary");
%>
                <tr>
                    <td><%= empno %></td>
                    <td><%= empname %></td>
                    <td><%= basicsalary %></td>
                    <td><button onclick="confirmDelete(<%= empno %>)">Delete</button></td>
                </tr>
<%
        }
        if(!hasResults) {
%>
                <tr><td colspan="4" style="color: #dc3545;">No employees found.</td></tr>
<%
        }
%>
            </tbody>
        </table>
<%
    } catch(Exception e) {
%>
        <p style="color:red;">Error: <%= e.getMessage() %></p>
<%
    } finally {
        try { if(rs != null) rs.close(); } catch(Exception e) {}
        try { if(pst != null) pst.close(); } catch(Exception e) {}
        try { if(conn != null) conn.close(); } catch(Exception e) {}
    }
%>

        <div class="nav-links">
            <a href="insertEmp.jsp">Insert Employee</a>
        </div>
    </div>
</body>
</html>
