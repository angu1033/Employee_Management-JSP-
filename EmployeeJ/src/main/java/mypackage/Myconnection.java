package mypackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Myconnection {
	private static Connection connection;
	private Myconnection() {}
	
	public static Connection getConnection() throws ClassNotFoundException,SQLException
	{
		String driverClassName="com.mysql.cj.jdbc.Driver";
		String url="jdbc:mysql://@localhost:3306/employeeDB";
		String uname="root";
		String upass="Engineer1033@";
		if(connection==null)
		{
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url,uname,upass);
		}
		return connection;
	}
}
