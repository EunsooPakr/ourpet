</body>
</html><%@ page language="java" contentType="text/html; charset=EUC-KR"
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
<title>예약하신 장례 업체 정보입니다.</title>
<!-- <link rel="stylesheet" type="text/css" href="/layoutMG/css/main.css" /> -->
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>

<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>

예약하신 장례 업체 입니다.  --> <br>
<div style="width:100%; height:300px; overflow:auto">
<table width="100%" border="1">
<tr>
	<td>업체 코드</td><td>주문자 아이디</td><td>주문자 연락처</td><td>예약 일시</td><td>예약 승인</td><td>예약 취소</td>
</tr>
<%
request.setCharacterEncoding("euc-kr");	//post한글처리

String fr_id = (String)session.getAttribute("S_ID");

System.out.println(fr_id + "<- fr_id ");

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
//02단계 :DB연결(Connection)끝

//쿼리실행 준비 단계 : 다양한 조건문을 작성 하면 끝!~~~~~~~~~~~	

	
//쿼리실행 준비 단계 : 다양한 조건문을 작성 하면 끝!~~~~~~~~~~~	
	String selectQuery="SELECT * FROM tb03_funeral_com INNER join tb03_f_reserve on tb03_f_reserve.frc_code = tb03_funeral_com.fc_code WHERE tb03_f_reserve.fr_id = ?";
	pstmt = conn.prepareStatement(selectQuery);
	pstmt.setString(1, fr_id);
	rs = pstmt.executeQuery();
	System.out.println(rs + "<-- rs m_search_form.jsp");
	//System.out.println(rs.next() + "<-- rs.next() m_search_form.jsp");
	while(rs.next()){
		System.out.println("while 반복 횟수");
%>		
		
		<tr>
		<%-- <td><%= rs.getString("fr_code")%></td> --%>
		<td><%= rs.getString("frc_code")%></td>
		<td><%= rs.getString("fr_id")%></td>
		<td><%= rs.getString("fr_phone")%></td>
		<td><%= rs.getString("fr_sDate")%></td>
		<td><%= rs.getString("fr_check")%></td>
		<td>
<a href="<%= request.getContextPath() %>/f_reserve/f_reserve_cancle.jsp?frc_code=<%= rs.getString("frc_code")%>">예약 취소 버튼</a>
		</td>
		
	</tr>			
<%		
	}		
		
} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	// 6. 사용한 Statement 종료
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	
	// 7. 커넥션 종료
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}
%>
</table></div>			 
<%@ include file="/module/hadan.jsp" %>

</body>
</html>
