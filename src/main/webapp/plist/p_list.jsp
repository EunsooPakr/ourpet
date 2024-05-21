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
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
</head>

<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>

반려동물 리스트 <br>
<table width="100%" border="1">
<tr>
	<td>이름</td><td>성별</td><td>생년월일</td><td>종</td><td>품종</td><td>무게</td><td>수정</td><td>삭제</td>
</tr>
<%
request.setCharacterEncoding("euc-kr");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");
String selectQuery = "select * from tb03_pet where p_id=?";
try{
	String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev51id";
	String dbPass = "dev51pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "<-- conn m_search_list.jsp");
	pstmt = conn.prepareStatement(selectQuery);
	pstmt.setString(1,S_ID);
	//System.out.println(pstmt + "<-- pstmt m_search_list.jsp");
	out.println(pstmt + "<-- pstmt m_search_list.jsp");
	
	rs = pstmt.executeQuery();
	System.out.println(rs + "<-- rs m_list.jsp");
//com.mysql.cj.jdbc.result.ResultSetImpl@5043c656<-- rs m_list.jsp
	while(rs.next())
	{
%>
		<tr>
			<td><%= rs.getString("p_name")%></td>
			<td><%= rs.getString("p_gender")%></td>
			<td><%= rs.getString("p_birth")%></td>
			<td><%= rs.getString("p_species")%></td>
			<td><%= rs.getString("p_breed")%></td>
			<td><%= rs.getString("p_weight")%></td>
			<td><a href="<%= request.getContextPath() %>/mupdate/m_update_form.jsp?send_id=<%= m.getM_id()%>">수정버튼</a></td>		
			<td><a href="<%= request.getContextPath() %>/mdelete/m_delete_action.jsp?send_id=<%= m.getM_id()%>">삭제버튼</a></td>	
		</tr>	
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

//m_list.jsp 참고
//1단계 : 
//2단계 : 
//3단계 : 쿼리 실행 준비 단계 ( 조건별로 쿼리 준비 완성 )
//--------------------------------------------
//4단계 : 쿼리 실행
//5단계 : 쿼리 실행 후 결과 사용
//6,7단계 : 객체 종료
%>
</table>
<%@ include file="/module/hadan.jsp" %>

</body>
</html>