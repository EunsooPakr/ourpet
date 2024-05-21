<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>01메인화면</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
</head>

<body>

<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>

반려동물 정보 등록 화면 <br><br>

<form action="<%= request.getContextPath() %>/pinsert/p_insert_action.jsp" method="post">
<!--     <input type="hidden" name="g_code"> -->
<table border="1">
<tr>
    <td><input type="hidden" name="p_id" value="<%= S_ID %>" size="20"></td>
<tr>
<tr>
    <td>이름</td> 
    <td><input type="text" name="p_name" size="20"></td> 
<tr>
<tr>
	<td>성별</td>
	<td><label for="gender"> <!-- 성별 -->
	</label> <label for="male">남자 <input type="radio" id="male" name="p_gender" value="male" />
	 		<label for="female">여자 <input type="radio"id="female" name="p_gender" value="female" /></td>
<tr>
<tr>
	<td>생년월일</td>
	<td><input type="date" name="p_birth" size="20"
	required value="2024-02-23"/>></td>
<tr>
<tr>
    <td>종</td>
    <td><input type="text" name="p_species" size="20"></tr>
<tr>
<tr>
    <td>품종</td>
    <td><input type="text" name="p_breed" size="20"></tr>
<tr>
<tr>
    <td>무게</td>
    <td><input type="number" name="p_weight" size="20"></tr>
<tr>
<tr>
    <td colspan="4"><input type="submit" value="반려동물 등록 버튼"></tr>
</tr>
</table>
</form>

<%@ include file="/module/hadan.jsp" %>


</body>
</html>