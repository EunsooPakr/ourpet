package ourpet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import ourpet.driverdb.DriverDB;


public class Mdao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void pDelete(String mid) throws ClassNotFoundException, SQLException
	{
		DriverDB db=new DriverDB();
		conn=db.driverDbcon();
		System.out.println(conn + "<-- conn/m_delete_action.jsp");

		pstmt = conn.prepareStatement("DELETE FROM tb_member WHERE m_id=?"); 
		pstmt.setString(1, mid);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	
	
}
