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
<form action="<%= request.getContextPath() %>/fc_insert/fc_insert_action.jsp" method="post">

<%-- <input type="hidden" name="m_id" value="<%= S_ID %>"> --%>

<table border="1">
<tr>
	<td>������̵�</td>
	<td><input type="text" name="fc_id" size="20"></td>
<tr>
<tr>
	<td>��й�ȣ</td>
	<td><input type="text" name="fc_pw" size="20"></td> <!-- �ɹ����̺� -->
<tr>
<tr>
	<td>�����</td>
	<td><input type="text" name="fc_name" size="20"></td>
<tr>
<tr>
	<td>�����ȭ��ȣ</td>
	<td><input type="text" name="fc_phone" size="20"></td>
<tr>
<tr>
	<td>����ּ�</td>
	<td><input type="text" name="fc_addr" size="20"></td>
<tr>
<tr>
	<td>����ڹ�ȣ</td>
	<td><input type="text" name="fc_coNum" size="20"></td>
<tr>
<tr>
	<td>��ǥ��</td>
	<td><input type="text" name="fc_ceo" size="20"></td> <!-- �ɹ����̺� ������̺� ���� -->
<tr>
<tr>
	<td>������¹�ȣ</td>
	<td><input type="text" name="fc_accNum" size="20"></td>
<tr>

<tr>
	<td colspan="4"><input type="submit" value="���ȸ�����Թ�ư"></td>
</tr>
</table>
</form>
<%@ include file="/module/hadan.jsp" %>
</body>
</html>