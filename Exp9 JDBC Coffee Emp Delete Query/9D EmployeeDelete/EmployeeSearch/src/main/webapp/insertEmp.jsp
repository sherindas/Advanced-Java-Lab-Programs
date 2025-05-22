<!DOCTYPE html>
<html>
<head>
    <title>Insert Employee</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f9f9f9; padding: 30px;}
        .container { max-width: 400px; margin: auto; background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px #ccc;}
        h2 { text-align: center; color: #333;}
        label { display: block; margin: 15px 0 5px; font-weight: bold; }
        input[type=text], input[type=number] {
            width: 100%; padding: 8px; box-sizing: border-box; border: 1px solid #aaa; border-radius: 4px;
        }
        input[type=submit] {
            margin-top: 20px; width: 100%; background: #28a745; border: none; color: white; font-size: 16px; cursor: pointer;
            border-radius: 4px;
        }
        input[type=submit]:hover {
            background: #218838;
        }
        .nav-links {
            text-align: center; margin-top: 20px;
        }
        .nav-links a {
            text-decoration: none; color: #007bff; margin: 0 10px;
        }
        .nav-links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Insert Employee</h2>
        <form action="insertEmpAction.jsp" method="post">
            <label for="empno">Employee Number:</label>
            <input type="number" id="empno" name="empno" required min="1" />

            <label for="empname">Employee Name:</label>
            <input type="text" id="empname" name="empname" required />

            <label for="basicsalary">Basic Salary:</label>
            <input type="number" id="basicsalary" name="basicsalary" required min="0" />

            <input type="submit" value="Insert Employee" />
        </form>
        <div class="nav-links">
            <a href="searchDeleteEmp.jsp">Search/Delete Employees</a>
        </div>
    </div>
</body>
</html>
