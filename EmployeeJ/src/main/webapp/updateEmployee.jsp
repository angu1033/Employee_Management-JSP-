<%@ page import="mypackage.*" %>
<%
    int empId = Integer.parseInt(request.getParameter("empId"));
    EmployeeDao dao = new EmployeeDaoImpl();
    Employee emp = dao.getEmployeeById(empId);
%>
<form action="updateProcess.jsp" method="post">
    <input type="hidden" name="empId" value="<%= emp.getEmpId() %>">
    Name: <input type="text" name="empName" value="<%= emp.getEmpName() %>"><br><br>
    Salary: <input type="text" name="empSalary" value="<%= emp.getEmpSalary() %>"><br><br>
    <input type="submit" value="Update">
</form>
