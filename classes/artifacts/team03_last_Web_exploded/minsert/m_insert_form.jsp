<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
</head>
<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
<%
String m_level = request.getParameter("m_level");
if(m_level.equals("basic"))
{
	m_level="�Ϲ�ȸ��";
}
else if(m_level.equals("company"))
{
	m_level="��ʾ�ü";
}
else if(m_level.equals("admin"))
{
	m_level="������";
}

%>
<form action="<%= request.getContextPath() %>/minsert/m_insert_action.jsp" method="post">
<table border="1">
<tr>
	<td>����</td>
	<td><input type="text" name="m_level" size="20" value=<%=m_level%> readonly></td>
<tr>
<tr>
	<td>���̵�</td>
	<td><input type="text" name="m_id" size="20"></td>
<tr>
<tr>
	<td>��й�ȣ</td>
	<td><input type="text" name="m_pw" size="20"></td>
<tr>
<tr>
	<td>�̸�</td>
	<td><input type="text" name="m_name" size="20"></td>
<tr>
<tr>
	<td>����</td>
	<td><label for="gender"> <!-- ���� -->
	</label> <label for="male">���� <input type="radio" id="male" name="m_gender" value="male" />
	 		<label for="female">���� <input type="radio"id="female" name="m_gender" value="female" /></td>
<tr>
	<td>�������</td>
	<td><input type="date" name="m_birth" size="20"
	required value="2024-02-23"/>></td>
<tr>
<tr>
	<td>��ȭ��ȣ</td>
	<td><input type="tel" name="m_phone" size="20"></td>
<tr>
<tr>
	<td>�ݷ����� ��</td>
	<td><input type="text" name="m_pet" size="20" value=0></td>
<tr>
<tr>
	<td>SMS���ŵ���</td>
	<td><label for="sms_check">
	</label> <label for="agree">���� <input type="radio" id="agree" name="m_sms_check" value="true" />
	 		<label for="dissent">����</label> <input type="radio"id="dissent" name="m_sms_check" value="false" /></td>
<tr>
<tr>
	<td colspan="4"><input type="submit" value="ȸ�����Թ�ư"></td>
</tr>
</table>
</form>
<%@ include file="/module/hadan.jsp" %>
</body>
</html>