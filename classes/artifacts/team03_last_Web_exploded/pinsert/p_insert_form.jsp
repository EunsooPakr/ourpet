<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>01����ȭ��</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
</head>

<body>

<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>

�ݷ����� ���� ��� ȭ�� <br><br>

<form action="<%= request.getContextPath() %>/pinsert/p_insert_action.jsp" method="post">
<!--     <input type="hidden" name="g_code"> -->
<table border="1">
<tr>
    <td><input type="hidden" name="p_id" value="<%= S_ID %>" size="20"></td>
<tr>
<tr>
    <td>�̸�</td> 
    <td><input type="text" name="p_name" size="20"></td> 
<tr>
<tr>
	<td>����</td>
	<td><label for="gender"> <!-- ���� -->
	</label> <label for="male">���� <input type="radio" id="male" name="p_gender" value="male" />
	 		<label for="female">���� <input type="radio"id="female" name="p_gender" value="female" /></td>
<tr>
<tr>
	<td>�������</td>
	<td><input type="date" name="p_birth" size="20"
	required value="2024-02-23"/>></td>
<tr>
<tr>
    <td>��</td>
    <td><input type="text" name="p_species" size="20"></tr>
<tr>
<tr>
    <td>ǰ��</td>
    <td><input type="text" name="p_breed" size="20"></tr>
<tr>
<tr>
    <td>����</td>
    <td><input type="number" name="p_weight" size="20"></tr>
<tr>
<tr>
    <td colspan="4"><input type="submit" value="�ݷ����� ��� ��ư"></tr>
</tr>
</table>
</form>

<%@ include file="/module/hadan.jsp" %>


</body>
</html>