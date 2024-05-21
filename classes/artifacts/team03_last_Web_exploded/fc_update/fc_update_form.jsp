<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%
String send_id = request.getParameter("send_id");	//예)String send_id="id004"
System.out.println(send_id + "<-- send_id g_update_form.jsp");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");
//한명의 회원 정보를 저장 할 변수 선언
//한명의 회원 정보를 담을 수 있는 다른 방법은?
String dbfccode = null;
String dbfcid = null;
String dbfcname = null;
String dbfcphone = null;
String dbfcaddr = null;
String dbfccoNum = null;
String dbfcceo = null;
String dbfcaccNum = null;

try{
	String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev51id";
	String dbPass = "dev51pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "<-- conn g_update_form.jsp");
	pstmt = conn.prepareStatement("SELECT * FROM tb03_funeral_com WHERE fc_id=?");
	pstmt.setString(1, send_id);
	System.out.println(pstmt + "<-- pstmt g_update_form.jsp");
	rs = pstmt.executeQuery();
	System.out.println(rs + "<-- rs g_update_form.jsp");
	//System.out.println(rs.next() + "<-- rs.next() mg_update_form.jsp");
	if(rs.next()){
		System.out.println("if조건문 조건식 true일 경우 실행 g_update_form.jsp");
		
		dbfccode = rs.getString("fc_code");
		dbfcid = rs.getString("fc_id");
		dbfcname= rs.getString("fc_name");
		dbfcphone = rs.getString("fc_phone");
		dbfcaddr = rs.getString("fc_addr");	
		dbfccoNum = rs.getString("fc_coNum");	
		dbfcceo = rs.getString("fc_ceo");	
		dbfcaccNum = rs.getString("fc_accNum");	

		System.out.println(dbfccode + "<-- dbfccode fc_update_form.jsp");
		System.out.println(dbfcid + "<-- dbfcid fc_update_form.jsp");
		System.out.println(dbfcname + "<-- dbfcname fc_update_form.jsp");
		System.out.println(dbfcphone + "<-- dbfcphone fc_update_form.jsp");
		System.out.println(dbfcaddr + "<-- dbfcaddr fc_update_form.jsp");
		System.out.println(dbfccoNum + "<-- dbfccoNum fc_update_form.jsp");
		System.out.println(dbfcceo + "<-- dbfcceo fc_update_form.jsp");
		System.out.println(dbfcaccNum + "<-- dbfcaccNum fc_update_form.jsp");
	}
} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}

//참고 파일 : m_list.jsp / m_insert_form.jsp / m_insert_action.jsp
//1단계 : 드라이버로딩 2단계 : DB연결
//3단계 : 쿼리 실행 준비 SELECT * FROM tb_member WHERE m_id='id005'
//			SELECT * FROM tb_member WHERE m_id=?
//4단계 : 쿼리 실행 
//5단계 : 쿼리 실행 후 결과 사용 : 수정화면에 뿌려준다.
//6,7단계 : 객체 종료
%>
<!-- 1번 방법 : 수정화면 시작  m_insert_form.jsp : 수정화면과 비슷 -->
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
</head>
<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
<form action="<%= request.getContextPath() %>/fc_update/fc_update_action.jsp" method="post">
<table border="1">
<tr>
	<td>기업코드</td>
	<td><input type="text" name="fc_code" size="20" readonly value="<%= dbfccode %>"></td>
<tr>
<tr>
	<td>기업아이디</td>
	<td><input type="text" name="fc_id" size="20" readonly value="<%= dbfcid %>"></td>
<tr>
<tr>
	<td>기업명</td>
	<td><input type="text" name="fc_name" size="20" value="<%= dbfcname %>"></td>
<tr>
<tr>
	<td>기업전화번호</td>
	<td><input type="text" name="fc_phone" size="20" value="<%= dbfcphone %>"></td>
<tr>
<tr>
	<td>기업주소</td>
	<td><input type="text" name="fc_addr" size="20" value="<%= dbfcaddr %>"></td>
<tr>
<tr>
	<td>사업자번호</td>
	<td><input type="text" name="fc_coNum" size="20" value="<%= dbfccoNum %>"></td>
<tr>
<tr>
	<td>대표자</td>
	<td><input type="text" name="fc_ceo" size="20" value="<%= dbfcceo %>"></td>
<tr>
<tr>
	<td>기업계좌번호</td>
	<td><input type="text" name="fc_accNum" size="20" value="<%= dbfcaccNum %>"></td>
<tr>
<tr>
	<td colspan="4"><input type="submit" value="기업정보수정버튼"></td>
</tr>
</table>
</form>
<%@ include file="/module/hadan.jsp" %>

</body>
</html>
<!-- 1번 방법 : 수정화면 끝 -->