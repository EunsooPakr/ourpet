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
<title>�����Ͻ� ��� ��ü �����Դϴ�.</title>
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

�����Ͻ� ��� ��ü �Դϴ�.  --> <br>
<div style="width:100%; height:300px; overflow:auto">
<table width="100%" border="1">
<tr>
	<td>��û �ڵ�</td><td>��ü �ڵ�</td><td>�ֹ��� ���̵�</td><td>�ֹ��� ����ó</td><td>���� �Ͻ�</td><td>���� ����</td><td>���� ���</td>
</tr>
<%
request.setCharacterEncoding("euc-kr");	//post�ѱ�ó��
String fc_code = request.getParameter("fc_code");
String frc_code = request.getParameter("frc_code");
String fr_id = request.getParameter("fr_id");
String fr_phone = request.getParameter("fc_phone");
String fr_sDate = request.getParameter("fr_sDate");
String fr_check = request.getParameter("fr_check");

System.out.println(frc_code + "<- frc_code ");
System.out.println(fr_id + "<- fr_id ");
System.out.println(fr_phone + "<- fr_phone ");
System.out.println(fr_sDate + "<- fr_sDate ");
System.out.println(fr_check + "<- fr_check ");
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
//02�ܰ� :DB����(Connection)��
	System.out.println(frc_code + "<-- frc_code ");
//�������� �غ� �ܰ� : �پ��� ���ǹ��� �ۼ� �ϸ� ��!~~~~~~~~~~~	

	
//�������� �غ� �ܰ� : �پ��� ���ǹ��� �ۼ� �ϸ� ��!~~~~~~~~~~~	
	String selectQuery="SELECT * FROM tb03_funeral_com INNER join tb03_f_reserve on tb03_f_reserve.frc_code = tb03_funeral_com.fc_code WHERE tb03_f_reserve.fr_id = ?";
	pstmt = conn.prepareStatement(selectQuery);
	pstmt.setString(1, fr_id);
	rs = pstmt.executeQuery();
	System.out.println(rs + "<-- rs m_search_form.jsp");
	//System.out.println(rs.next() + "<-- rs.next() m_search_form.jsp");
	while(rs.next()){
		System.out.println("while �ݺ� Ƚ��");
%>		
		
		<tr>
		<%-- <td><%= rs.getString("fr_code")%></td> --%>
		<td><%= rs.getString("frc_code")%></td>
		<td><%= rs.getString("fr_id")%></td>
		<td><%= rs.getString("fr_phone")%></td>
		<td><%= rs.getString("fr_sDate")%></td>
		<td><%= rs.getString("fr_check")%></td>
		<td>
<a href="<%= request.getContextPath() %>/f_reserve/f_reserve_catego.jsp?frc_code=<%= rs.getString("frc_code")%>">���� ��� ��ư</a>			
		</td>
		
	</tr>			
<%		
	}		
		
} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	// 6. ����� Statement ����
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	
	// 7. Ŀ�ؼ� ����
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}
%>
</table></div>			 
<%@ include file="/module/hadan.jsp" %>

</body>
</html>
