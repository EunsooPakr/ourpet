<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
</head>
<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
장례 예약 회원 & 반려동물 리스트 <br>
<table width="100%" border="1">
<tr>
	<td>예약자이름</td><td>예약자아이디</td><td>반려동물이름</td><td>예약상태</td><td>예약승낙</td><td>예약취소</td>
</tr>
<%

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");
try{
	String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev51id";
	String dbPass = "dev51pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

	String selectQuery=("SELECT "+
			"m.m_id, m.m_name, p.p_name, fr.fr_check "+
			"FROM tb03_member AS m "+
			"JOIN tb03_f_reserve AS fr "+
			"ON m.m_id = fr.fr_id "+
			"JOIN tb03_pet AS p "+
			"ON m.m_id = p.p_id "+
			"WHERE fr.frc_code = (SELECT fc_code "+
			"FROM tb03_funeral_com "+
			"WHERE fc_ceo = ?)");
	pstmt = conn.prepareStatement(selectQuery);
	pstmt.setString(1, S_NAME);
	rs = pstmt.executeQuery();
	
	System.out.println(selectQuery + "<- selectQuery ");
	System.out.println(rs + "<-- rs m_list.jsp");
//com.mysql.cj.jdbc.result.ResultSetImpl@5043c656<-- rs m_list.jsp
	while(rs.next()){
		//System.out.println("select 쿼리 실행 결과 몇 줄 나올까?");
%>
<!-- 화면 위치 시작 -->
		<tr>
			<td><%= rs.getString("m_name")%></td>
			<td><%= rs.getString("m_id")%></td>
			<td><%= rs.getString("p_name")%></td>
			<td><%= rs.getString("fr_check")%></td>
			<td>
<a href="<%= request.getContextPath() %>/f_r/f_r_accep_action.jsp?send_id=<%= rs.getString("m_id")%>">승낙</a>			
			</td>
			<td>
<a href="<%= request.getContextPath() %>/f_r/f_r_cancle_action.jsp?send_id=<%= rs.getString("m_id")%>">취소</a>			
			</td>
			
		</tr>
<!-- 화면 위치 끝 -->		
<%
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
</table>
<%@ include file="/module/hadan.jsp" %>
</body>
</html>