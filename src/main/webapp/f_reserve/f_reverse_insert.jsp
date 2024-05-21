</html><%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%
request.setCharacterEncoding("euc-kr");	//post한글처리

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

int max = 0;
String tempCode = "fr_";
String fr_code = "fr_1";

Class.forName("com.mysql.jdbc.Driver");
String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
		"useUnicode=true&characterEncoding=euckr";
String dbUser = "dev51id";
String dbPass = "dev51pw";

conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
System.out.println(conn + "<-- conn");
if(rs.next()){
	max = rs.getInt(1);
	//max = rs.getInt("maxcol");
	System.out.println(max + "<-- max 1");
	max = max + 1;
	System.out.println(max + "<-- max 2");
	fr_code = tempCode + max;	//예) goods_3
}
pstmt = conn.prepareStatement("INSERT INTO tb03_member VALUES (?, ?, ?, ?, ?,?,?,?,?)"); 



%>