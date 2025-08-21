package mypackage;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDaoImpl implements EmployeeDao {
    private Connection con;

    public EmployeeDaoImpl() throws ClassNotFoundException, SQLException {
        con = Myconnection.getConnection();  // must return valid connection
        if (con == null) {
            throw new SQLException("Connection is NULL in EmployeeDaoImpl constructor");
        }
    }

    @Override
    public int save(Employee e) throws SQLException {
        String sql = "INSERT INTO employee (empId, empName, empSalary) VALUES (?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, e.getEmpId());
        ps.setString(2, e.getEmpName());
        ps.setDouble(3, e.getEmpSalary());
        return ps.executeUpdate();
    }

    @Override
    public List<Employee> getAllEmployees() throws SQLException {
        List<Employee> list = new ArrayList<>();
        String sql = "SELECT * FROM employee";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Employee(
                rs.getInt("empId"),
                rs.getString("empName"),
                rs.getDouble("empSalary"))); 
        }
        return list;
    }

    @Override
    public int delete(int empId) throws SQLException {
        String sql = "DELETE FROM employee WHERE empId=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, empId);
        return ps.executeUpdate();
    }

    @Override
    public Employee getEmployeeById(int empId) throws SQLException {
        String sql = "SELECT * FROM employee WHERE empId=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, empId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return new Employee(
                rs.getInt("empId"),
                rs.getString("empName"),
                rs.getDouble("empSalary"));  
        }
        return null;
    }

    @Override
    public int update(Employee e) throws SQLException {
        String sql = "UPDATE employee SET empName=?, empSalary=? WHERE empId=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, e.getEmpName());
        ps.setDouble(2, e.getEmpSalary());
        ps.setInt(3, e.getEmpId());
        return ps.executeUpdate();
    }


	
}
