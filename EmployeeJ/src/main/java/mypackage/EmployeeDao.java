package mypackage;

import java.sql.SQLException;
import java.util.List;

public interface EmployeeDao {
	
	    int save(Employee e) throws SQLException;
	    List<Employee> getAllEmployees() throws SQLException;
	    int delete(int empId) throws SQLException;
	    Employee getEmployeeById(int empId) throws SQLException;
	    int update(Employee e) throws SQLException;

}
