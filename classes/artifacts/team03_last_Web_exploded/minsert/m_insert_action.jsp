<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<%
//post��� �ѱ� ó�� ���
request.setCharacterEncoding("euc-kr");
Connection conn = null;
PreparedStatement pstmt = null;

String m_level = request.getParameter("m_level");
String m_id = request.getParameter("m_id"); 
String m_pw = request.getParameter("m_pw");
String m_name = request.getParameter("m_name");
String m_gender = request.getParameter("m_gender");
String m_birth = request.getParameter("m_birth");
String m_phone = request.getParameter("m_phone");
String m_pet = request.getParameter("m_pet");
String m_sms_check = request.getParameter("m_sms_check");


System.out.println(m_level + "<-- m_level /minsert/m_insert_action.jsp");
System.out.println(m_id + "<-- m_id /minsert/m_insert_action.jsp");
System.out.println(m_pw + "<-- m_pw /minsert/m_insert_action.jsp");
System.out.println(m_name + "<-- m_name /minsert/m_insert_action.jsp");
System.out.println(m_gender + "<-- m_gender /minsert/m_insert_action.jsp");
System.out.println(m_birth + "<-- m_birth /minsert/m_insert_action.jsp");
System.out.println(m_phone + "<-- m_phone /minsert/m_insert_action.jsp");
System.out.println(m_pet + "<-- m_pet /minsert/m_insert_action.jsp");
System.out.println(m_sms_check + "<-- m_sms_check /minsert/m_insert_action.jsp");



Class.forName("com.mysql.jdbc.Driver");
String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
		"useUnicode=true&characterEncoding=euckr";
String dbUser = "dev51id";
String dbPass = "dev51pw";

conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
System.out.println(conn + "<-- conn");
pstmt = conn.prepareStatement("INSERT INTO tb03_member VALUES (?, ?, ?, ?, ?,?,?,?,?)"); 

System.out.println(pstmt + "<-- pstmt-1");
pstmt.setString(1, m_id);
pstmt.setString(2, m_pw);
pstmt.setString(3, m_name);
pstmt.setString(4, m_level);
if(m_gender.equals("female"))
{
	pstmt.setString(5, "��");
}else
{
	pstmt.setString(5, "��");
}
pstmt.setString(6, m_birth);
pstmt.setString(7, m_phone);
pstmt.setString(8, m_pet);
if(m_sms_check.equals("true"))
{
	pstmt.setBoolean(9, true);
}
else
{
	pstmt.setBoolean(9, false);
}

System.out.println(pstmt + "<-- pstmt-2");

//	INSERT INTO tb03_member VALUES ('m_id', 'm_pw', 'm_name', 'm_level', 'm_gender', 'm_birth', 'm_phone', 'm_pet', 'm_sms_check')<-- pstmt-2
//��������� 3�ܰ� : ���� ���� �غ� �Ϸ�!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
int result = pstmt.executeUpdate(); //4�ܰ� : ���� ����
System.out.println(result + "<-- result");
//1<-- result
pstmt.close();
conn.close();

//�ݷ����� ���� 1���� �̻��� ���
if(Integer.parseInt(m_pet)>=1)
{
	//�ݷ����� ���� �Է�â���� �̵�
	response.sendRedirect(request.getContextPath()+"/pet/pet_reg_form.jsp");
}
else
{
	//�� �ݷ����� ����Ʈ�� �̵�(����Ʈ�� �ƹ��͵� ���°� �½��ϴ�.)
	response.sendRedirect(request.getContextPath()+"/pet/pet_reg_list.jsp");
}


%>





















