package ourpet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import ourpet.driverdb.DriverDB;
import ourpet.member.Member;


public class Mdao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Member m = new Member();
	
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
