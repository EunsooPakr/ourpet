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


�������Ʈ <br>
<div style="width:100%; height:300px; overflow:auto">
<table width="100%" border="1">
<tr>
	<td>����ڵ�</td><td>������̵�</td><td>�����</td><td>�����ȭ��ȣ</td><td>����ּ�</td><td>�����</td><td>����ڹ�ȣ</td><td>��ǥ��</td><td>������¹�ȣ</td><td>����</td>
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
String selectQuery = "select * from tb03_funeral_com";
try{
	String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev51id";
	String dbPass = "dev51pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "<-- conn goods_list.jsp");
	if(sk == null && sv == null){
		System.out.println("1. sk,sv ������ ��� �� null ����");	
		pstmt = conn.prepareStatement(selectQuery);
	}else if(sk != null && sv.equals("")){
		System.out.println("2. sk��null�ƴϰ� sv�� ���� ����");
		pstmt = conn.prepareStatement(selectQuery);
	}else if(sk != null && sv != null){
		System.out.println("3-1. g_id ����");
		pstmt = conn.prepareStatement(selectQuery+" WHERE "+ sk + "=?");
		pstmt.setString(1, sv);
	}
	//System.out.println(pstmt + "<-- pstmt m_search_list.jsp");
	out.println(pstmt + "<-- pstmt goods_list.jsp");
	
	rs = pstmt.executeQuery();
	System.out.println(rs + "<-- rs goods_list.jsp");
//com.mysql.cj.jdbc.result.ResultSetImpl@5043c656<-- rs m_list.jsp
	while(rs.next()){
		//System.out.println("select ���� ���� ��� �� �� ���ñ�?");
%>
<!-- ȭ�� ��ġ ���� -->
		<tr>
			<td><%= rs.getString("fc_code")%></td>
			<td><%= rs.getString("fc_id")%></td>
			<td><%= rs.getString("fc_name")%></td>
			<td><%= rs.getString("fc_phone")%></td>
			<td><%= rs.getString("fc_addr")%></td>
			<td><%= rs.getString("fc_udate")%></td>
			<td><%= rs.getString("fc_coNum")%></td>
			<td><%= rs.getString("fc_ceo")%></td>
			<td><%= rs.getString("fc_accNum")%></td>
			<td>
			<!-- ������ ���� �����ʿ�!!!!!!!!!!!!!!!! -->
<a href="<%= request.getContextPath() %>/fc_update/fc_update_form.jsp?send_id=<%= rs.getString("fc_id")%>">������ư</a>			
			</td>

			
		</tr>
<!-- ȭ�� ��ġ �� -->		
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

//m_list.jsp ����
//1�ܰ� : 
//2�ܰ� : 
//3�ܰ� : ���� ���� �غ� �ܰ� ( ���Ǻ��� ���� �غ� �ϼ� )
//--------------------------------------------
//4�ܰ� : ���� ����
//5�ܰ� : ���� ���� �� ��� ���
//6,7�ܰ� : ��ü ����
%>
</table></div>
<%@ include file="/module/hadan.jsp" %>

</body>
</html>





