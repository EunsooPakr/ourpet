<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<%
//post방식 한글 처리 방법
request.setCharacterEncoding("euc-kr");
Connection conn = null;
PreparedStatement pstmt = null;

String fc_code = request.getParameter("fc_code"); 
String fc_id = request.getParameter("fc_id");
String fc_name = request.getParameter("fc_name");
String fc_phone = request.getParameter("fc_phone");
String fc_addr = request.getParameter("fc_addr");
String fc_coNum = request.getParameter("fc_coNum");
String fc_ceo = request.getParameter("fc_ceo");
String fc_accNum = request.getParameter("fc_accNum");

System.out.println(fc_code + "<-- fc_code /fc_list/fc_list.jsp");
System.out.println(fc_id + "<-- fc_id /fc_list/fc_list.jsp");
System.out.println(fc_name + "<-- fc_name /fc_list/fc_list.jsp");
System.out.println(fc_phone + "<-- fc_phone /fc_list/fc_list.jsp");
System.out.println(fc_addr + "<-- fc_addr /fc_list/fc_list.jsp");
System.out.println(fc_coNum + "<-- fc_coNum /fc_list/fc_list.jsp");
System.out.println(fc_ceo + "<-- fc_ceo /fc_list/fc_list.jsp");
System.out.println(fc_accNum + "<-- fc_accNum /fc_list/fc_list.jsp");

Class.forName("com.mysql.jdbc.Driver");
String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
		"useUnicode=true&characterEncoding=euckr";
String dbUser = "dev51id";
String dbPass = "dev51pw";

conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
System.out.println(conn + "<-- conn");
//com.mysql.cj.jdbc.ConnectionImpl@568e730b<-- conn
pstmt = conn.prepareStatement("UPDATE tb03_funeral_com SET fc_code=?,fc_id=?,fc_name=?,fc_phone=?,fc_addr=?,fc_coNum=?,fc_ceo=?,fc_accNum=? WHERE fc_code=?"); 
//DB에서 insert쿼리 테스트 후 붙여넣기
//INSERT INTO tb_member VALUES ('id007', 'pw007', '구매자', '칠길동', 'email7')
System.out.println(pstmt + "<-- pstmt-1");
//com.mysql.cj.jdbc.ClientPreparedStatement: 
//INSERT INTO tb_member VALUES (** NOT SPECIFIED **, ** NOT SPECIFIED **, ** NOT SPECIFIED **, ** NOT SPECIFIED **, ** NOT SPECIFIED **)<-- pstmt-1
pstmt.setString(1, fc_code);
pstmt.setString(2, fc_id);
pstmt.setString(3, fc_name);
pstmt.setString(4, fc_phone);
pstmt.setString(5, fc_addr);
pstmt.setString(6, fc_coNum);
pstmt.setString(7, fc_ceo);
pstmt.setString(8, fc_accNum);
pstmt.setString(9, fc_code);
System.out.println(pstmt + "<-- pstmt-2");
//com.mysql.cj.jdbc.ClientPreparedStatement: 
//	INSERT INTO tb_member VALUES ('1', '2', '구매자', '4', '5')<-- pstmt-2
//여기까지가 3단계 : 쿼리 실행 준비 완료!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
int result = pstmt.executeUpdate(); //4단계 : 쿼리 실행
System.out.println(result + "<-- result");
//1<-- result
pstmt.close();
conn.close();

response.sendRedirect(request.getContextPath()+"/fc_list/fc_list.jsp");

%>

