<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%
request.setCharacterEncoding("euc-kr");
String fc_id = request.getParameter("fc_id"); // 맴버 공용
String fc_pw = request.getParameter("fc_pw"); //맴버이동
String fc_name = request.getParameter("fc_name");
String fc_phone = request.getParameter("fc_phone");//맴버 공용
String fc_addr = request.getParameter("fc_addr");
String fc_coNum = request.getParameter("fc_coNum");
String fc_ceo = request.getParameter("fc_ceo"); //맴버 이름 공용
String fc_accNum = request.getParameter("fc_accNum");
//콘솔창에 출력한다
System.out.println(fc_id + "<-- fc_id fc_insert_action.jsp");
System.out.println(fc_pw + "<-- fc_pw fc_insert_action.jsp");
System.out.println(fc_name + "<-- fc_name fc_insert_action.jsp");
System.out.println(fc_phone + "<-- fc_phone fc_insert_action.jsp");
System.out.println(fc_addr + "<-- fc_addr fc_insert_action.jsp");
System.out.println(fc_coNum + "<-- fc_coNum fc_insert_action.jsp");
System.out.println(fc_ceo + "<-- fc_ceo fc_insert_action.jsp");
System.out.println(fc_accNum + "<-- fc_accNum fc_insert_action.jsp");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
PreparedStatement pstmt_insert = null;
ResultSet rs_insert = null;

Class.forName("com.mysql.jdbc.Driver");
try{
String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
"useUnicode=true&characterEncoding=euckr";
String dbUser = "dev51id";
String dbPass = "dev51pw";
conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
System.out.println(conn + "<-- conn");
//pstmt = conn.prepareStatement("select max(CAST(substring(fc_code,4) AS DECIMAL)) as maxcol from tb03_funeral_com");


//맴버테이블로 전송
pstmt_insert = conn.prepareStatement(
"INSERT INTO tb03_member VALUES (?, ?, ?, '장례업체', null, null, ?, null, null)");
pstmt_insert.setString(1, fc_id);
pstmt_insert.setString(2, fc_pw);
pstmt_insert.setString(3, fc_ceo);
pstmt_insert.setString(4, fc_phone);
int insertResult = pstmt_insert.executeUpdate();
System.out.println(insertResult + "<-- insertResult 기업가입결과");








pstmt = conn.prepareStatement("select max(CAST(substring(fc_code,4) AS DECIMAL)) as maxcol from tb03_funeral_com");

rs = pstmt.executeQuery();

int max = 0;
String tempCode = "fc_";
String fc_code = "fc_1";
if(rs.next()){
max = rs.getInt(1);
//max = rs.getInt("maxcol");
System.out.println(max + "<-- max 1");
max = max + 1;
System.out.println(max + "<-- max 2");
fc_code = tempCode + max;//예) goods_3
}
System.out.println(fc_code + "<-- fc_code");
/*  1단계 최대값을 구해서 상품코드 생성 End*/





//기업 테이블로 전송
pstmt_insert = conn.prepareStatement(
"INSERT INTO tb03_funeral_com VALUES (?, ?, ?, ?, ?, curdate(),?, ?, ?)");



pstmt_insert.setString(1, fc_code);
pstmt_insert.setString(2, fc_id);
pstmt_insert.setString(3, fc_name);
pstmt_insert.setString(4, fc_phone);
pstmt_insert.setString(5, fc_addr);
pstmt_insert.setString(6, fc_coNum);
pstmt_insert.setString(7, fc_ceo);
pstmt_insert.setString(8, fc_accNum);

int insertResult2 = pstmt_insert.executeUpdate();
System.out.println(insertResult2 + "<-- insertResult 기업가입결과");


//rs_insert.close();
//pstmt_insert.close();
} catch(SQLException ex) {
out.println(ex.getMessage());
ex.printStackTrace();
} finally {
if (rs != null) try { rs.close();  } catch(SQLException ex) {}
if (pstmt != null) try { pstmt.close();  } catch(SQLException ex) {}
if (conn != null) try { conn.close(); } catch(SQLException ex) {}
response.sendRedirect(request.getContextPath()+"/fc_list/fc_list.jsp");
}



%>