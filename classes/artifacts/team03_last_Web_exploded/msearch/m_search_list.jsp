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
<%@ include file="/msearch/m_search_form.jsp" %>

회원리스트 <br>
<div style="width:100%; height:300px; overflow:auto">
<table width="100%" border="1">
<tr>
	<td>아이디</td><td>비밀번호</td><td>이름</td><td>권한</td><td>성별</td><td>생년월일</td><td>연락처</td><td>반려동물 수</td><td>알림 체크</td><td>수정</td><td>삭제</td>
</tr>
<%
request.setCharacterEncoding("euc-kr");
String sk = request.getParameter("sk");
String sv = request.getParameter("sv");
System.out.println(sk + "<-- sk fc_list");
System.out.println(sv + "<-- sv fc_list");

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
	System.out.println(conn + "<-- conn m_search_list.jsp");
	if(sk == null && sv == null){
		System.out.println("1. sk,sv 변수에 담긴 값 null 조건");	
		pstmt = conn.prepareStatement("select * from tb03_member");
	}else if(sk != null && sv.equals("")){
		System.out.println("2. sk는null아니고 sv는 공백 조건");
		pstmt = conn.prepareStatement("select * from tb03_member");
	}else if(sk != null && sv != null){
		if(sk.equals("m_id")){
			System.out.println("3-1. m_id 조건");
			pstmt = conn.prepareStatement("SELECT * FROM tb03_member WHERE m_id=?");
			pstmt.setString(1, sv);
		}else if(sk.equals("m_level")){
			pstmt = conn.prepareStatement("SELECT * FROM tb03_member WHERE m_level=?");
			pstmt.setString(1, sv);
		}else if(sk.equals("m_name")){
			pstmt = conn.prepareStatement("SELECT * FROM tb03_member WHERE m_name=?");
			pstmt.setString(1, sv);
		}
	}
	//System.out.println(pstmt + "<-- pstmt m_search_list.jsp");
	out.println(pstmt + "<-- pstmt m_search_list.jsp");
	
	rs = pstmt.executeQuery();
	System.out.println(rs + "<-- rs m_list.jsp");
//com.mysql.cj.jdbc.result.ResultSetImpl@5043c656<-- rs m_list.jsp
	while(rs.next()){
		//System.out.println("select 쿼리 실행 결과 몇 줄 나올까?");
%>
<!-- 화면 위치 시작 -->
		<tr>
			<td><%= rs.getString("m_id")%></td>
			<td><%= rs.getString("m_pw")%></td>
			<td><%= rs.getString("m_name")%></td>
			<td><%= rs.getString("m_level")%></td>
			<td><%= rs.getString("m_gender")%></td>
			<td><%= rs.getString("m_birth")%></td>
			<td><%= rs.getString("m_phone")%></td>
			<td><%= rs.getString("m_pet")%></td>
			<td><%= rs.getString("m_sms_check")%></td>
			<td>
			<!-- 수정과 삭제 수정필요!!!!!!!!!!!!!!!! -->
<a href="<%= request.getContextPath() %>/mupdate/m_update_form.jsp?send_id=<%= rs.getString("m_id")%>">수정버튼</a>			
			</td>
			<td>
			<!-- 수정과 삭제 수정필요!!!!!!!!!!!!!!!! -->
<a href="<%= request.getContextPath() %>/mdelete/m_delete_action.jsp?send_id=<%= rs.getString("m_id")%>">삭제버튼</a>			
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

//m_list.jsp 참고
//1단계 : 
//2단계 : 
//3단계 : 쿼리 실행 준비 단계 ( 조건별로 쿼리 준비 완성 )
//--------------------------------------------
//4단계 : 쿼리 실행
//5단계 : 쿼리 실행 후 결과 사용
//6,7단계 : 객체 종료
%>
</table></div>
<%@ include file="/module/hadan.jsp" %>

</body>
</html>





