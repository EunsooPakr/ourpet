<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import="ourpet.driverdb.DriverDB" %>
<%@page import="ourpet.dao.Mdao"%>
<%@page import="ourpet.pet.Pet" %>
<%
String send_id = request.getParameter("send_id");
System.out.println(send_id + "<-- send_id p_update_form.jsp");

Mdao mdao=new Mdao();
Pet p=mdao.pSelectforUpdate(send_id);
System.out.println(p+"<--p");
p.toString();

String dbpcode=p.getP_code();
String dbpid=p.getP_id();
String dbpname=p.getP_name();
String dbpgender=p.getP_gender();
String dbpbirth=p.getP_birth();
String dbpspecies=p.getP_species();
String dbpbreed=p.getP_breed();
String dbpweight=p.getP_weight();

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
<form action="<%= request.getContextPath() %>/pupdate/p_update_action.jsp" method="post">
<table border="1">
<tr>
    <td><input type="hidden" name="p_code" size="20" readonly value="<%= dbpcode %>"></td>
<tr>
<tr>
    <td><input type="hidden" name="p_id" size="20" readonly value="<%= dbpid %>"></td>
<tr>
<tr>
    <td>�̸�</td> 
    <td><input type="text" name="p_name" size="20" readonly value="<%= dbpname %>"></td> 
<tr>
<tr>
	<td>����</td>
	<td><label for="gender"> <!-- ���� -->
	</label> 
	<%
		if(dbpgender.equals("��"))
		{%>
			<label for="male">���� <input type="radio" id="male" name="p_gender" value="male" />
	 		<label for="female">���� <input type="radio"id="female" name="p_gender" value="female" checked /></td>
		<%
		}
		else
		{%>
			<label for="male">���� <input type="radio" id="male" name="p_gender" value="male" checked/>
	 		<label for="female">���� <input type="radio"id="female" name="p_gender" value="female" /></td>
		<%
		}
	%>
<tr>
<tr>
    <td>�������</td>
    <td><input type="date" name="p_birth" size="20" value="<%= dbpbirth %>"></tr>
<tr>
<tr>
    <td>��</td>
    <td><input type="text" name="p_species" size="20" value="<%= dbpspecies %>"></tr>
<tr>
<tr>
    <td>ǰ��</td>
    <td><input type="text" name="p_breed" size="20" value="<%= dbpbreed %>"></tr>
<tr>
<tr>
    <td>����</td>
    <td><input type="number" name="p_weight" size="20" value="<%= dbpweight %>"></tr>
<tr>
<tr>
    <td colspan="4"><input type="submit" value="�ݷ����� ���� ��ư"></tr>
</tr>
</table>
</form>
<%@ include file="/module/hadan.jsp" %>

</body>
</html>
<!-- 1�� ��� : ����ȭ�� �� -->