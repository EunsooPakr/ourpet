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
String send_id = request.getParameter("send_id");	//¿¹)String send_id="id004"
System.out.println(send_id + "<-- send_id p_delete_action.jsp");

Mdao mdao=new Mdao();
mdao.pDelete(send_id);

response.sendRedirect(request.getContextPath()+"/plist/p_list.jsp");
%>
