<%--
  Created by IntelliJ IDEA.
  User: ECS
  Date: 24. 5. 22.
  Time: 오후 4:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>

<%
    request.setCharacterEncoding("euc-kr");	//post한글처리

    String frc_code = request.getParameter("frc_code");  // 업체코드 받아오기
    String msg = "예약 취소실패";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Class.forName("com.mysql.jdbc.Driver");
    String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
            "useUnicode=true&characterEncoding=euckr";
    String dbUser = "dev51id";
    String dbPass = "dev51pw";

    conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

    pstmt = conn.prepareStatement("DELETE FROM tb03_f_reserve WHERE frc_code = ?");
    pstmt.setString(1, frc_code);

    int result = pstmt.executeUpdate();
    if(result == 1){
        msg = "예약 취소";
    }


%>
<script>
    alert('<%=msg%>');
    location.href='<%= request.getContextPath()%>/index.jsp';
</script>