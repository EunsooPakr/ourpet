package ourpet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import ourpet.funeral_com.Funeral_com;
import ourpet.funeral_reserve.Funeral_reserve;
import ourpet.member.Member;
import ourpet.pet.Pet;
import ourpet.driverdb.DriverDB;


public class Mdao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Member m=null;
	Pet p=null;
	
	//회원 등록 <--m_insert_action
	public void mInsert(Member m) throws ClassNotFoundException, SQLException
	{
		System.out.println("mInsert Mdao.java");

		DriverDB db=new DriverDB();
		conn=db.driverDbcon();	
		System.out.println(conn+"<--conn /mInsert Mdao.java");

		pstmt = conn.prepareStatement("INSERT INTO tb03_member VALUES (?, ?, ?, ?, ?,?,?,?,?)"); 

		System.out.println(pstmt + "<-- pstmt1/mInsert Mdao.java");

		pstmt.setString(1, m.getM_id());
		pstmt.setString(2, m.getM_pw());
		pstmt.setString(3, m.getM_name());
		pstmt.setString(4, m.getM_level());
		if(m.getM_level().equals("female"))
		{
			pstmt.setString(5, "여");
		}else
		{
			pstmt.setString(5, "남");
		}
		pstmt.setString(6, m.getM_birth());
		pstmt.setString(7, m.getM_phone());
		pstmt.setString(8, m.getM_pet());
		if(m.getM_sms_check().equals("true"))
		{
			pstmt.setBoolean(9, true);
		}
		else
		{
			pstmt.setBoolean(9, false);
		}

		System.out.println(pstmt + "<-- pstmt2/mInsert Mdao.java");

		int result = pstmt.executeUpdate(); //4단계 : 쿼리 실행
		System.out.println(result + "<-- result/mInsert Mdao.java");

		pstmt.close();
		conn.close(); 
	}
	
	
	//회원 등록 <--p_insert_action
	public void pInsert(Pet p) throws ClassNotFoundException, SQLException
	{
		System.out.println("pInsert Mdao.java");

		DriverDB db=new DriverDB();
		conn=db.driverDbcon();	
		System.out.println(conn+"<--conn /pInsert Mdao.java");

		pstmt = conn.prepareStatement("select max(CAST(substring(p_code,5) AS DECIMAL)) as maxcol from tb03_pet");
		rs = pstmt.executeQuery();
		
		String tempCode = "pet0";
		if(rs.next()){
			int max = rs.getInt(1);
			System.out.println(max + "<-- max 1");
			max = max + 1;
			System.out.println(max + "<-- max 2");
			p.setP_code(tempCode + max);	
		}
		System.out.println(conn + "<-- conn");
		pstmt = conn.prepareStatement("INSERT INTO tb03_pet VALUES (?, ?, ?, ?, ?, ?, ?, ?)"); 

		
		pstmt = conn.prepareStatement("INSERT INTO tb03_member VALUES (?, ?, ?, ?, ?,?,?,?,?)"); 

		System.out.println(pstmt + "<-- pstmt1/mInsert Mdao.java");

		pstmt.setString(1, m.getM_id());
		pstmt.setString(2, m.getM_pw());
		pstmt.setString(3, m.getM_name());
		pstmt.setString(4, m.getM_level());
		if(m.getM_level().equals("female"))
		{
			pstmt.setString(5, "여");
		}else
		{
			pstmt.setString(5, "남");
		}
		pstmt.setString(6, m.getM_birth());
		pstmt.setString(7, m.getM_phone());
		pstmt.setString(8, m.getM_pet());
		if(m.getM_sms_check().equals("true"))
		{
			pstmt.setBoolean(9, true);
		}
		else
		{
			pstmt.setBoolean(9, false);
		}

		System.out.println(pstmt + "<-- pstmt2/mInsert Mdao.java");

		int result = pstmt.executeUpdate(); //4단계 : 쿼리 실행
		System.out.println(result + "<-- result/mInsert Mdao.java");

		pstmt.close();
		conn.close(); 
	}
	

	Funeral_reserve fr = null;
	Funeral_com fc = null;


	public void pDelete(String pcode) throws ClassNotFoundException, SQLException
	{
		DriverDB db=new DriverDB();
		conn=db.driverDbcon();
		System.out.println(conn + "<-- conn/pDelete/Mdao.java");

		pstmt = conn.prepareStatement("DELETE FROM tb03_pet WHERE p_code=?"); 
		pstmt.setString(1, pcode);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	
	public void pUpdate(Pet p) throws ClassNotFoundException, SQLException
	{
		DriverDB db=new DriverDB();
		conn=db.driverDbcon();
		System.out.println(conn + "<-- conn/pUpdate/Mdao.java");
		pstmt = conn.prepareStatement("UPDATE tb03_pet SET p_name=?,p_gender=?,p_birth=?,p_species=?,p_breed=?,p_weight=? WHERE p_code=?"); 
		pstmt.setString(1, p.getP_name());
		pstmt.setString(2, p.getP_gender());
		pstmt.setString(3, p.getP_birth());
		pstmt.setString(4, p.getP_species());
		pstmt.setString(5, p.getP_breed());
		pstmt.setString(6, p.getP_weight());
		pstmt.setString(7, p.getP_code());
		System.out.println(pstmt + "<-- pstmt");
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	
	//동물 한마리의 정보를 조회<--p_update_form
	public Pet pSelectforUpdate(String pcode) throws ClassNotFoundException, SQLException
	{
		System.out.println("4 mSelectforupdate Mdao.java");
		DriverDB db=new DriverDB();
		conn=db.driverDbcon();
		pstmt = conn.prepareStatement("SELECT * FROM tb03_pet WHERE p_code=?");
		pstmt.setString(1, pcode);
		System.out.println(pstmt+"<-- pstmt mSelectforUpdate");
		rs = pstmt.executeQuery();
		if(rs.next()){
			System.out.println("if조건문 조건식 true일 경우 실행 p_update_form.jsp");
			p=new Pet();
			p.setP_id(rs.getString("p_id"));
			p.setP_name(rs.getString("p_name"));
			p.setP_gender(rs.getString("p_gender"));
			p.setP_birth(rs.getString("p_birth"));
			p.setP_species(rs.getString("p_species"));
			p.setP_breed(rs.getString("p_breed"));
			p.setP_weight(rs.getString("p_weight"));
			p.setP_code(rs.getString("p_code"));
		}
		pstmt.close();
		rs.close();
		conn.close();
		
		return p;
	}


}
