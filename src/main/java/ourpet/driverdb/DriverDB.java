package ourpet.driverdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DriverDB {
	public Connection driverDbcon() throws ClassNotFoundException, SQLException
	{
		System.out.println("01. 드라이버로딩 및 DB연결 driverDBconnection");
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
				"useUnicode=true&characterEncoding=euckr";
		String dbUser = "dev51id";
		String dbPass = "dev51pw";
		Connection conn=null;	
		conn= DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		System.out.println(conn+"<-- conn");
		
		return conn;
	}
}
