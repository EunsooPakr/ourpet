</html><%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%
request.setCharacterEncoding("euc-kr");	//post한글처리

String frc_code = request.getParameter("fc_code");
String fr_id = (String)session.getAttribute("S_ID");
String fr_phone = null;
String msg = "예약 실패";

System.out.println(frc_code + "<- frc_code ");
System.out.println(fr_id + "<- fr_id ");


Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");
String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
		"useUnicode=true&characterEncoding=euckr";
String dbUser = "dev51id";
String dbPass = "dev51pw";

conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
int max = 0;
String tempCode = "fr_";
String fr_code = "fr_1";

pstmt = conn.prepareStatement("SELECT m_phone FROM tb03_member WHERE m_id = ?");
pstmt.setString(1, fr_id);
rs = pstmt.executeQuery();
if(rs.next()) {
	fr_phone = rs.getString("m_phone");
}
System.out.println(fr_phone + "<- fr_phone ");

pstmt = conn.prepareStatement("select max(CAST(substring(fr_code,4) AS DECIMAL)) as maxcol FROM tb03_f_reserve");
rs = pstmt.executeQuery();

if(rs.next()){
	max = rs.getInt(1);
	//max = rs.getInt("maxcol");
	System.out.println(max + "<-- max 1");
	max = max + 1;
	System.out.println(max + "<-- max 2");
	fr_code = tempCode + max;	//예) goods_3
}
	pstmt = conn.prepareStatement("INSERT INTO tb03_f_reserve (`fr_code`, `frc_code`, `fr_id`, `fr_phone`, `fr_sDate`, `fr_check`)"+
			"VALUES (?, ?, ?, ?, NOW(), '예약대기');");
	pstmt.setString(1, fr_code);
	pstmt.setString(2, frc_code);
	pstmt.setString(3, fr_id);
	pstmt.setString(4, fr_phone);
	int result = pstmt.executeUpdate();
	if(result == 1){
		msg = "예약 성공";
	}


%>
<script>
	alert('<%=msg%>');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>