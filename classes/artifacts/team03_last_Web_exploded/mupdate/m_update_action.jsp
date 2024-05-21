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
String m_level = request.getParameter("m_level");
String m_id = request.getParameter("m_id"); 
String m_pw = request.getParameter("m_pw");
String m_name = request.getParameter("m_name");
String m_gender = request.getParameter("m_gender");
String m_birth = request.getParameter("m_birth");
String m_phone = request.getParameter("m_phone");
String m_pet = request.getParameter("m_pet");
String m_sms_check = request.getParameter("m_sms_check");


System.out.println(m_level + "<-- m_level /mupdate/m_update_action.jsp");
System.out.println(m_id + "<-- m_id /mupdate/m_update_action.jsp");
System.out.println(m_pw + "<-- m_pw /mupdate/m_update_action.jsp");
System.out.println(m_name + "<-- m_name /mupdate/m_update_action.jsp");
System.out.println(m_gender + "<-- m_gender /mupdate/m_update_action.jsp");
System.out.println(m_birth + "<-- m_birth /mupdate/m_update_action.jsp");
System.out.println(m_phone + "<-- m_phone /mupdate/m_update_action.jsp");
System.out.println(m_pet + "<-- m_pet /mupdate/m_update_action.jsp");
System.out.println(m_sms_check + "<-- m_sms_check /mupdate/m_update_action.jsp");

Connection conn = null;
PreparedStatement pstmt = null;
Class.forName("com.mysql.jdbc.Driver");
String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
		"useUnicode=true&characterEncoding=euckr";
String dbUser = "dev51id";
String dbPass = "dev51pw";

conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
System.out.println(conn + "<-- conn");
pstmt = conn.prepareStatement(
		"UPDATE tb03_member SET m_pw=?,m_name=?,m_gender=?,m_birth=?,m_phone=?,m_pet=?,m_sms_check=? WHERE m_id=?"); 

pstmt.setString(1, m_pw);
pstmt.setString(2, m_name);

if(m_gender.equals("female"))
{
	pstmt.setString(3, "여");
}else
{
	pstmt.setString(3, "남");
}
pstmt.setString(4, m_birth);
pstmt.setString(5, m_phone);
pstmt.setString(6, m_pet);
if(m_sms_check.equals("true"))
{
	pstmt.setBoolean(7, true);
}
else
{
	pstmt.setBoolean(7, false);
}
pstmt.setString(8, m_id);


System.out.println(pstmt + "<-- pstmt");
int result = pstmt.executeUpdate(); //4단계 : 쿼리 실행
System.out.println(result + "<-- result");
pstmt.close();
conn.close();

//본인 반려동물리스트 화면
response.sendRedirect(request.getContextPath()+"/msearch/m_search_list.jsp");
%>






