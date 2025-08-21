<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<h2>Add New Employee</h2>
<form method="post" action="saveEmployee.jsp">
    <input type="text" name="empId" placeholder="Enter ID"><br>
    <input type="text" name="empName" placeholder="Enter Name"><br>
    <input type="text" name="empSalary" placeholder="Enter Salary"><br>
    <input type="submit" value="Save Data"><br><br>
</form>

<a href="fetchData.jsp">Fetch Data</a>
</body>
</html>
