<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "ourpet.driverdb.DriverDB" %>
<%
String send_id = request.getParameter("send_id");	//¿¹)String send_id="id004"
System.out.println(send_id + "<-- send_id m_delete_action.jsp");
Connection conn = null;
PreparedStatement pstmt = null;
DriverDB db = new DriverDB();
conn = db.driverDbcon();
System.out.println(conn + "<-- conn");

pstmt = conn.prepareStatement("DELETE FROM tb03_member WHERE m_id=?"); 
pstmt.setString(1, send_id);
pstmt.executeUpdate();
pstmt.close();
conn.close();
response.sendRedirect(request.getContextPath()+"/msearch/m_search_list.jsp");
%>
