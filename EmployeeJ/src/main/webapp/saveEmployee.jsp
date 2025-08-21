<%@ page import="mypackage.*" %>
<%
    int empId = Integer.parseInt(request.getParameter("empId"));
    String empName = request.getParameter("empName");
    double empSalary = Double.parseDouble(request.getParameter("empSalary"));

    Employee e = new Employee(empId, empName, empSalary);
    EmployeeDao dao = new EmployeeDaoImpl();
    int status = dao.save(e);

    if(status > 0){
        response.sendRedirect("fetchData.jsp");
    } else {
        out.println("Error saving employee.");
    }
%>