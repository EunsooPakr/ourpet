<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%
request.setCharacterEncoding("euc-kr");
String mid = request.getParameter("mid");
String mpw = request.getParameter("mpw");
System.out.println(mid + "<-- mid login_action.jsp");
System.out.println(mpw + "<-- mpw login_action.jsp");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");

String dbid = null;
String dbpw = null;
String dblevel = null;
String dbname = null;
String dbgender = null;
String dbbirth = null;
String dbphone = null;
String dbpet = null;
String dbscheck = null;
String msg = null;
try{
	String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev51id";
	String dbPass = "dev51pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "<-- conn login_action.jsp");
	pstmt = conn.prepareStatement("SELECT * FROM tb03_member WHERE m_id=?");
	pstmt.setString(1, mid);
	System.out.println(pstmt + "<-- pstmt login_action.jsp");
	rs = pstmt.executeQuery();
	System.out.println(rs + "<-- rs login_action.jsp");
	//System.out.println(rs.next() + "<-- rs.next() m_update_form.jsp");
	if(rs.next()){			//<---------- 아이디 일치 조건
		System.out.println("1-1 아이디 일치 조건");
		dbid = rs.getString("m_id");
		dbpw = rs.getString("m_pw");
		dblevel = rs.getString("m_level");
		dbname = rs.getString("m_name");
		dbgender = rs.getString("m_gender");
		dbbirth = rs.getString("m_birth");
		dbphone = rs.getString("m_phone");
		dbpet = rs.getString("m_pet");
		dbscheck = rs.getString("m_sms_check");
		System.out.println(dbid + "<-- dbid login_action.jsp");
		System.out.println(dbpw + "<-- dbpw login_action.jsp");
		System.out.println(dblevel + "<-- dblevel login_action.jsp");
		System.out.println(dbname + "<-- dbname login_action.jsp");
		System.out.println(dbgender + "<-- dbgender login_action.jsp");
		System.out.println(dbbirth + "<-- dbbirth login_action.jsp");
		System.out.println(dbphone + "<-- dbphone login_action.jsp");
		System.out.println(dbpet + "<-- dbpet login_action.jsp");
		System.out.println(dbscheck + "<-- dbscheck login_action.jsp");
		
		if(mpw.equals(dbpw)){
			System.out.println("2-1 로그인 성공 조건");	
			session.setAttribute("S_ID", dbid);
			session.setAttribute("S_LEVEL", dblevel);
			session.setAttribute("S_NAME", dbname);
			msg = "로그인 성공";
		}else{
			System.out.println("2-2 비번 불일치 조건");
			msg = "비번 불일치";
		}
	}else{
		System.out.println("1-2 아이디 불일치 조건");
		msg = "아이디 불일치";
	}
} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}
%>
<script type="text/javascript">
	alert('<%= msg %>');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>







