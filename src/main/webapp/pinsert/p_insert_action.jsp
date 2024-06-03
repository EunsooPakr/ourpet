<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "ourpet.dao.Mdao" %>
<%@ page import = "ourpet.member.Member" %>
<%@ page import = "ourpet.pet.Pet" %>
<%@ page import = "ourpet.driverdb.DriverDB" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<% request.setCharacterEncoding("euc-kr"); %>


<%
Mdao mdao = new Mdao();
Member m = new Member();
mdao.pInsert(m);
response.sendRedirect(request.getContextPath()+"/plist/p_list.jsp");
%>