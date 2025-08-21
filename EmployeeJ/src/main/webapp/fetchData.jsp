<%@ page import="java.util.*, mypackage.*" %>
<%
    EmployeeDao dao = new EmployeeDaoImpl();
    List<Employee> list = dao.getAllEmployees();
%>
<html>
<head>
    <title>Employee Records</title>
    <style>
        table {
            border-collapse: collapse;
            width: 60%;
        }
        th, td {
            padding: 8px 12px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        a {
            text-decoration: none;
            color: blue;
        }
        a:hover {
            color: red;
        }
    </style>
</head>
<body>
    <h2>Employee Records</h2>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Salary</th>
            <th>Action</th>
        </tr>
        <%
            if (list != null && !list.isEmpty()) {
                for (Employee e : list) {
        %>
        <tr>
            <td><%= e.getEmpId() %></td>
            <td><%= e.getEmpName() %></td>
            <td><%= e.getEmpSalary() %></td>
            <td>
                <a href="deleteEmployee.jsp?empId=<%= e.getEmpId() %>">Delete</a> |
                <a href="updateEmployee.jsp?empId=<%= e.getEmpId() %>">Update</a>
            </td>
        </tr>
        <% 
                }
            } else { 
        %>
        <tr>
            <td colspan="4">No Employees Found</td>
        </tr>
        <% } %>
    </table>
    <br>
    <a href="index.jsp">Add New Employee</a>
</body>
</html>
