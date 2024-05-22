<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>>
<%
//post规侥 茄臂 贸府 规过
request.setCharacterEncoding("euc-kr");%>
<jsp:useBean id="p" class="ourpet.pet.Pet"/>
<jsp:setProperty name="p" property="*"/>
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String p_code = "";
String p_id = request.getParameter("p_id");
String p_name = request.getParameter("p_name");
String p_gender = request.getParameter("p_gender"); 
String p_birth = request.getParameter("p_birth");
String p_species = request.getParameter("p_species");
String p_breed = request.getParameter("p_breed");
String p_weight = request.getParameter("p_weight");


System.out.println(p_id + "<-- p_id/pinsert/p_insert_action.jsp");
System.out.println(p_name + "<-- p_name/pinsert/p_insert_action.jsp");
System.out.println(p_gender + "<-- p_gender/pinsert/p_insert_action.jsp");
System.out.println(p_birth + "<-- p_birth/pinsert/p_insert_action.jsp");
System.out.println(p_species + "<-- p_species/pinsert/p_insert_action.jsp");
System.out.println(p_breed + "<-- p_breed/pinsert/p_insert_action.jsp");
System.out.println(p_weight + "<-- p_weight/pinsert/p_insert_action.jsp");

Class.forName("com.mysql.jdbc.Driver");
String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
"useUnicode=true&characterEncoding=euckr";
String dbUser = "dev51id";
String dbPass = "dev51pw";

conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

pstmt = conn.prepareStatement("select max(CAST(substring(p_code,5) AS DECIMAL)) as maxcol from tb03_pet");
rs = pstmt.executeQuery();


int max = 0;
String tempCode = "pet0";
if(rs.next()){
	max = rs.getInt(1);
	//max = rs.getInt("maxcol");
	System.out.println(max + "<-- max 1");
	max = max + 1;
	System.out.println(max + "<-- max 2");
	p_code = tempCode + max;	
}
System.out.println(conn + "<-- conn");
pstmt = conn.prepareStatement("INSERT INTO tb03_pet VALUES (?, ?, ?, ?, ?, ?, ?, ?)"); 

System.out.println(pstmt + "<-- pstmt-1");
pstmt.setString(1, p_code);
pstmt.setString(2, p_id);
pstmt.setString(3, p_name);
pstmt.setString(4, p_gender);
pstmt.setString(5, p_birth);
pstmt.setString(6, p_species);
pstmt.setString(7, p_breed);
pstmt.setString(8, p_weight);

System.out.println(pstmt + "<-- pstmt-2");

int result = pstmt.executeUpdate(); //4窜拌 : 孽府 角青
System.out.println(result + "<-- result");
//1<-- result
pstmt.close();
conn.close();

response.sendRedirect(request.getContextPath()+"/plist/p_list.jsp");
%>