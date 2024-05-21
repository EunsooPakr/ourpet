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

String admin_pw = request.getParameter("admin_pw");
System.out.println(admin_pw + "<-- admin_pw /mlcheck/al_check_action.jsp");
String msg="";
String url="";
//관리자코드를 맞게 입력하면 회원가입 창으로 이동
if(admin_pw.equals("333"))
{
	msg="관리자 코드가 확인되었습니다.";
	url="/minsert/m_insert_form.jsp?m_level="+"admin";
}
else
{
	//관리자가 아닌경우 처음화면으로 이동
	msg="관리자 코드가 일치하지 않습니다.";
	url="/index.jsp";
}
%>
<script type="text/javascript">
	alert('<%= msg %>');
	location.href='<%= request.getContextPath()+url%>';
</script>






















