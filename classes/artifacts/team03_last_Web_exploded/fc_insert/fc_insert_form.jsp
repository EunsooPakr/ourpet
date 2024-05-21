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
	<td>기업아이디</td>
	<td><input type="text" name="fc_id" size="20"></td>
<tr>
<tr>
	<td>비밀번호</td>
	<td><input type="text" name="fc_pw" size="20"></td> <!-- 맴버테이블 -->
<tr>
<tr>
	<td>기업명</td>
	<td><input type="text" name="fc_name" size="20"></td>
<tr>
<tr>
	<td>기업전화번호</td>
	<td><input type="text" name="fc_phone" size="20"></td>
<tr>
<tr>
	<td>기업주소</td>
	<td><input type="text" name="fc_addr" size="20"></td>
<tr>
<tr>
	<td>사업자번호</td>
	<td><input type="text" name="fc_coNum" size="20"></td>
<tr>
<tr>
	<td>대표자</td>
	<td><input type="text" name="fc_ceo" size="20"></td> <!-- 맴버테이블 기업테이블 공용 -->
<tr>
<tr>
	<td>기업계좌번호</td>
	<td><input type="text" name="fc_accNum" size="20"></td>
<tr>

<tr>
	<td colspan="4"><input type="submit" value="기업회원가입버튼"></td>
</tr>
</table>
</form>
<%@ include file="/module/hadan.jsp" %>
</body>
</html>