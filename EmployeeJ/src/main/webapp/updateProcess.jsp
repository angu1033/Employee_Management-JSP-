<%@ page import="mypackage.*" %>
<%
    // Get parameters from form
    String empIdParam = request.getParameter("empId");
    String empName = request.getParameter("empName");
    String salaryParam = request.getParameter("empSalary");

    // Basic null/empty checks to avoid errors
    if(empIdParam == null || empIdParam.trim().isEmpty() ||
       salaryParam == null || salaryParam.trim().isEmpty() ||
       empName == null || empName.trim().isEmpty()) {
        out.println("Error: All fields are required!");
        return;
    }

    // Parse values
    int empId = Integer.parseInt(empIdParam);
    double empSalary = Double.parseDouble(salaryParam);

    // Create Employee object
    Employee emp = new Employee(empId, empName, empSalary);

    // Call DAO update method
    EmployeeDao dao = new EmployeeDaoImpl();
    int status = dao.update(emp); 

    
    if(status > 0){
        response.sendRedirect("fetchData.jsp");
    } else {
        out.println("Error updating employee in database.");
    }
%>
