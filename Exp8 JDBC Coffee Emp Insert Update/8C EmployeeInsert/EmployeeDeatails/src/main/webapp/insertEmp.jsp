<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head><title>Insert Employee</title></head>
<body>
<h2>Insert New Employee</h2>
<form action="insertEmpAction.jsp" method="post">
    Emp No: <input type="number" name="empno" required /><br/><br/>
    Emp Name: <input type="text" name="empname" required /><br/><br/>
    Basic Salary: <input type="number" name="basicsalary" required /><br/><br/>
    <input type="submit" value="Insert Employee" />
</form>
</body>
</html>
