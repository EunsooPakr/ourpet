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
System.out.println(m_level + "<-- m_level /mlcheck/ml_check_action.jsp");

//������ �������� �̵��ϴ� ȭ�� ����
if(m_level.equals("basic"))
{
	response.sendRedirect(request.getContextPath()+"/minsert/m_insert_form.jsp?m_level="+m_level);
}
else if(m_level.equals("company"))
{
	//������ �۾��ϴ� ��ü ���� ȭ������ �̵�
	response.sendRedirect(request.getContextPath()+"/fc_insert/fc_insert_form.jsp?m_level="+m_level);
}
else if(m_level.equals("admin"))
{
	response.sendRedirect(request.getContextPath()+"/mlcheck/al_check_form.jsp?m_level="+m_level);
}

%>





















