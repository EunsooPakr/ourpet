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

String admin_pw = request.getParameter("admin_pw");
System.out.println(admin_pw + "<-- admin_pw /mlcheck/al_check_action.jsp");
String msg="";
String url="";
//�������ڵ带 �°� �Է��ϸ� ȸ������ â���� �̵�
if(admin_pw.equals("333"))
{
	msg="������ �ڵ尡 Ȯ�εǾ����ϴ�.";
	url="/minsert/m_insert_form.jsp?m_level="+"admin";
}
else
{
	//�����ڰ� �ƴѰ�� ó��ȭ������ �̵�
	msg="������ �ڵ尡 ��ġ���� �ʽ��ϴ�.";
	url="/index.jsp";
}
%>
<script type="text/javascript">
	alert('<%= msg %>');
	location.href='<%= request.getContextPath()+url%>';
</script>






















