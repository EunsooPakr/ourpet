<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>>

<%
//post방식 한글 처리 방법
request.setCharacterEncoding("euc-kr");
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

System.out.println(p_name + "<-- m_level /minsert/m_insert_action.jsp");
System.out.println(p_gender + "<-- m_id /minsert/m_insert_action.jsp");
System.out.println(p_birth + "<-- m_pw /minsert/m_insert_action.jsp");
System.out.println(p_species + "<-- m_name /minsert/m_insert_action.jsp");
System.out.println(p_breed + "<-- m_gender /minsert/m_insert_action.jsp");
System.out.println(p_weight + "<-- m_birth /minsert/m_insert_action.jsp");

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
	p_code = tempCode + max;	//예) goods_3
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

//INSERT INTO tb03_member VALUES ('m_id', 'm_pw', 'm_name', 'm_level', 'm_gender', 'm_birth', 'm_phone', 'm_pet', 'm_sms_check')<-- pstmt-2
//여기까지가 3단계 : 쿼리 실행 준비 완료!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
int result = pstmt.executeUpdate(); //4단계 : 쿼리 실행
System.out.println(result + "<-- result");
//1<-- result
pstmt.close();
conn.close();

response.sendRedirect(request.getContextPath()+"/plist/p_list.jsp");
%>