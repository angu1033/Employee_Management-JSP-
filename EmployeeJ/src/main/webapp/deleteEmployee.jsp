<%@ page import="mypackage.*" %>
<%
    int empId = Integer.parseInt(request.getParameter("empId"));
    EmployeeDao dao = new EmployeeDaoImpl();
    dao.delete(empId);
    response.sendRedirect("fetchData.jsp");
%>