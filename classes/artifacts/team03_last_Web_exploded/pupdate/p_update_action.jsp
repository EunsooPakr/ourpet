<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import="ourpet.driverdb.DriverDB" %>
<%@page import="ourpet.dao.Mdao"%>
<% request.setCharacterEncoding("euc-kr");%>
<jsp:useBean id="p" class="ourpet.pet.Pet"/>
<jsp:setProperty name="p" property="*"/>

<% 

Mdao mdao=new Mdao();
mdao.pUpdate(p);
response.sendRedirect(request.getContextPath()+"/plist/p_list.jsp");
%>