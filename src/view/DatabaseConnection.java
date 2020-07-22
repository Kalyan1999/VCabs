package view;

import java.sql.*;
import com.mysql.jdbc.Driver;

public class DatabaseConnection {
	public static Connection initializeDatabase() 
	        throws SQLException, ClassNotFoundException 
	        {
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection(  
		"jdbc:mysql://localhost:3306/sys","root","kalyan");
		System.out.println("Loaded");
		return con;
	        }

}
