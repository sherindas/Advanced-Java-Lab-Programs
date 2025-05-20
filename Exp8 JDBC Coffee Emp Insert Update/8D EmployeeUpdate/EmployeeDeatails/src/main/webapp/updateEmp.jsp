<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head><title>Update Employee</title></head>
<body>
<h2>Update Employee Details</h2>
<form action="updateEmpAction.jsp" method="post">
    Emp No (to update): <input type="number" name="empno" required /><br/><br/>
    New Emp Name: <input type="text" name="empname" required /><br/><br/>
    New Basic Salary: <input type="number" name="basicsalary" required /><br/><br/>
    <input type="submit" value="Update Employee" />
</form>
</body>
</html>
