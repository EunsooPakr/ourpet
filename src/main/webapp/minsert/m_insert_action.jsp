<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import="ourpet.driverdb.DriverDB" %>
<%@page import="ourpet.dao.Mdao"%>
<%
//post��� �ѱ� ó�� ���
request.setCharacterEncoding("euc-kr");%>
<jsp:useBean id="m" class="ourpet.member.Member"/>
<jsp:setProperty name="m" property="*"/>

<%
Mdao mdao=new Mdao();
mdao.mInsert(m);

session.setAttribute("S_ID", m.getM_id());
session.setAttribute("S_LEVEL", m.getM_level());
session.setAttribute("S_NAME", m.getM_name());
//�ݷ����� ���� 1���� �̻��� ���
if(Integer.parseInt(m.getM_pet())>=1)
{
	//�ݷ����� ���� �Է�â���� �̵�
	response.sendRedirect(request.getContextPath()+"/pinsert/p_insert_form.jsp");
}
else
{
	//�� �ݷ����� ����Ʈ�� �̵�(����Ʈ�� �ƹ��͵� ���°� �½��ϴ�.)
	response.sendRedirect(request.getContextPath()+"/plist/p_list.jsp");
}


%>





















