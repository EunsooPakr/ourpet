<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%
String send_id = request.getParameter("send_id");	//��)String send_id="id004"
System.out.println(send_id + "<-- send_id m_update_form.jsp");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");
//�Ѹ��� ȸ�� ������ ���� �� ���� ����
//�Ѹ��� ȸ�� ������ ���� �� �ִ� �ٸ� �����?
String dbid = null;
String dbpw = null;
String dblevel = null;
String dbname = null;
String dbgender = null;
String dbbirth = null;
String dbphone = null;
String dbpet = null;
String dbscheck = null;

try{
	String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev51id";
	String dbPass = "dev51pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "<-- conn m_update_form.jsp");
	pstmt = conn.prepareStatement("SELECT * FROM tb03_member WHERE m_id=?");
	pstmt.setString(1, send_id);
	System.out.println(pstmt + "<-- pstmt m_update_form.jsp");
	rs = pstmt.executeQuery();
	System.out.println(rs + "<-- rs m_update_form.jsp");
	//System.out.println(rs.next() + "<-- rs.next() m_update_form.jsp");
	if(rs.next()){
		System.out.println("if���ǹ� ���ǽ� true�� ��� ���� m_update_form.jsp");
		dbid = rs.getString("m_id");
		dbpw = rs.getString("m_pw");
		dblevel = rs.getString("m_level");
		dbname = rs.getString("m_name");
		dbgender = rs.getString("m_gender");
		dbbirth = rs.getString("m_birth");
		dbphone = rs.getString("m_phone");
		dbpet = rs.getString("m_pet");
		dbscheck = rs.getString("m_sms_check");
		System.out.println(dbid + "<-- dbid m_update_form.jsp");
		System.out.println(dbpw + "<-- dbpw m_update_form.jsp");
		System.out.println(dblevel + "<-- dblevel m_update_form.jsp");
		System.out.println(dbname + "<-- dbname m_update_form.jsp");
		System.out.println(dbgender + "<-- dbgender m_update_form.jsp");
		System.out.println(dbbirth + "<-- dbbirth m_update_form.jsp");
		System.out.println(dbphone + "<-- dbphone m_update_form.jsp");
		System.out.println(dbpet + "<-- dbpet m_update_form.jsp");
		System.out.println(dbscheck + "<-- dbscheck m_update_form.jsp");
		
	}
} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}

//���� ���� : m_list.jsp / m_insert_form.jsp / m_insert_action.jsp
//1�ܰ� : ����̹��ε� 2�ܰ� : DB����
//3�ܰ� : ���� ���� �غ� SELECT * FROM tb_member WHERE m_id='id005'
//			SELECT * FROM tb_member WHERE m_id=?
//4�ܰ� : ���� ���� 
//5�ܰ� : ���� ���� �� ��� ��� : ����ȭ�鿡 �ѷ��ش�.
//6,7�ܰ� : ��ü ����
%>
<!-- 1�� ��� : ����ȭ�� ����  m_insert_form.jsp : ����ȭ��� ��� -->
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
</head>
<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
<form action="<%= request.getContextPath() %>/mupdate/m_update_action.jsp" method="post">
<table border="1">
<tr>
	<td>���̵�</td>
	<td><input type="text" name="m_id" size="20" readonly value="<%= dbid %>"></td>
<tr>
<tr>
	<td>��й�ȣ</td>
	<td><input type="text" name="m_pw" size="20" value="<%= dbpw %>"></td>
<tr>
<tr>
	<td>����</td>
	<td><input type="text" name="m_level" size="20" readonly value="<%= dblevel %>"></td>
<tr>
<tr>
	<td>�̸�</td>
	<td><input type="text" name="m_name" size="20" value="<%= dbname %>"></td>
<tr>
<tr>
	<td>����</td>
	<td><label for="gender"> <!-- ���� -->
	</label> 
	<%
		if(dbgender.equals("��"))
		{%>
			<label for="male">���� <input type="radio" id="male" name="m_gender" value="male" />
	 		<label for="female">���� <input type="radio"id="female" name="m_gender" value="female" checked /></td>
		<%
		}
		else
		{%>
			<label for="male">���� <input type="radio" id="male" name="m_gender" value="male" checked/>
	 		<label for="female">���� <input type="radio"id="female" name="m_gender" value="female" /></td>
		<%
		}
	%>
	
<tr>
	<td>�������</td>
	<td><input type="date" name="m_birth" size="20"
	 value="<%=dbbirth %>"/>></td>
<tr>
<tr>
	<td>��ȭ��ȣ</td>
	<td><input type="tel" name="m_phone" size="20" value="<%=dbphone %>"></td>
<tr>
<tr>
	<td>�ݷ����� ��</td>
	<td><input type="text" name="m_pet" size="20" value="<%=dbpet %>"></td>
<tr>
<tr>
	<td>SMS���ŵ���</td>
	<td><label for="sms_check">
	</label> 
	<%
		if(dbscheck.equals("1"))
		{%>
			<label for="agree">���� <input type="radio" id="agree" name="m_sms_check" value="true" checked/>
	 		<label for="dissent">����</label> <input type="radio"id="dissent" name="m_sms_check" value="false" /></td>
		<%
		}
		else
		{%>
			<label for="agree">���� <input type="radio" id="agree" name="m_sms_check" value="true" />
	 		<label for="dissent">����</label> <input type="radio"id="dissent" name="m_sms_check" value="false" checked /></td>
		<%
		}
	%>
	
<tr>
<tr>
	<td colspan="4"><input type="submit" value="ȸ��������ư"></td>
</tr>
</table>
</form>
<%@ include file="/module/hadan.jsp" %>

</body>
</html>
<!-- 1�� ��� : ����ȭ�� �� -->