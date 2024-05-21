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
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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
회원유형선택단계 <br>
<form action="<%= request.getContextPath() %>/mlcheck/ml_check_action.jsp" method="post">
<table width="100%" border="1">
<p>
<label for="gender"> <!-- 성별 -->
</label> <label for="basic">개인회원 <input type="radio" id="m_level" name="m_level" value="basic" /> 
<label for="company">업체회원 <input type="radio"id="m_level" name="m_level" value="company" />
<label for="admin">관리자 <input type="radio"id="m_level" name="m_level" value="admin" />
</p>
<br>
<input type="submit" id="enter" value="확인">		
</table></form>		 
<%@ include file="/module/hadan.jsp" %>

</body>
</html>
