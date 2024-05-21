<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%
request.setCharacterEncoding("euc-kr");
String mid = request.getParameter("send_id");
System.out.println(mid + "<-- mid");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");

String msg = "½Â³« ¿Ï·á";

	String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
            "useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev51id";
	String dbPass = "dev51pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	
	pstmt = conn.prepareStatement("UPDATE tb03_f_reserve SET fr_check = '½Â³«' WHERE fr_id = ?");
	pstmt.setString(1, mid);
	System.out.println(pstmt + "<-- pstmt login_action.jsp");
	pstmt.executeUpdate();
	System.out.println(rs + "<-- rs login_action.jsp");
	//System.out.println(rs.next() + "<-- rs.next() m_update_form.jsp");
	
	
%>
<script type="text/javascript">
	alert('<%= msg %>');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>
<%
response.sendRedirect(request.getContextPath()+"/f_r/f_r_m.jsp");
%>






