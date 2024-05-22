<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>전체 장례 업체 리스트 입니다</title>
<!-- <link rel="stylesheet" type="text/css" href="/layoutMG/css/main.css" /> -->
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>

<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
<%@ include file="/f_reserve/f_reserve_cte_form.jsp" %>
<script>
        // 페이지가 로드될 때 실행되는 함수
        window.onload = function() {
            // 로컬 스토리지에서 저장된 카테고리 값을 가져옴
            var savedCategory = localStorage.getItem('selectedCategory');

            // 만약 저장된 카테고리 값이 있다면 해당 카테고리를 설정
            if (savedCategory) {
                document.getElementById('categorySelect').value = savedCategory;
            }
        };

        // 카테고리가 변경될 때 실행되는 함수
        document.getElementById('categorySelect').addEventListener('change', function() {
            // 선택된 카테고리 값을 가져옴
            var selectedCategory = this.value;

            // 로컬 스토리지에 선택된 카테고리를 저장
            localStorage.setItem('selectedCategory', selectedCategory);
        });
    </script>

전체 장례 업체 리스트 입니다.  --> <br>
<div style="width:100%; height:300px; overflow:auto">
<table width="100%" border="1">
<tr>
	<td>업체코드</td><td>장례업체 아이디</td><td>장례 업체명</td><td>업체 전화번호</td><td>업체 주소</td><td>업체 등록일자</td><td>사업자 번호</td><td>대표자 성함</td><td>계좌 정보</td><td>예약</td>
</tr>
<%
request.setCharacterEncoding("euc-kr");	//post한글처리
String fc_code = request.getParameter("fc_code");
String fc_id = request.getParameter("fc_id");
String fc_name = request.getParameter("fc_name");
String fc_phone = request.getParameter("fc_phone");
String fc_addr = request.getParameter("fc_addr");
String fc_udate = request.getParameter("fc_udate");
String fc_coNum = request.getParameter("fc_coNum");
String fc_ceo = request.getParameter("fc_ceo");
String fc_accNum = request.getParameter("fc_accNum");
System.out.println(fc_code + "<- fc_code ");
System.out.println(fc_id + "<- fc_id ");
System.out.println(fc_name + "<- fc_name ");
System.out.println(fc_phone + "<- fc_phone ");
System.out.println(fc_addr + "<- fc_addr ");
System.out.println(fc_udate + "<- fc_udate ");
System.out.println(fc_coNum + "<- fc_coNum ");
System.out.println(fc_ceo + "<- fc_ceo ");
System.out.println(fc_accNum + "<- fc_accNum ");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");
String selectQuery1 ="SELECT * FROM tb03_funeral_com";
System.out.println(selectQuery1 + "<- selectQuery1 ");

String selectQuery2 = "SELECT * FROM tb03_funeral_com";

 

try{
	String jdbcDriver = "jdbc:mysql://192.168.10.7:3306/dev51db?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev51id";
	String dbPass = "dev51pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
//02단계 :DB연결(Connection)끝
	System.out.println(conn + "<-- conn ");
//쿼리실행 준비 단계 : 다양한 조건문을 작성 하면 끝!~~~~~~~~~~~	
	if((fc_code ==null && fc_id==null)||
			(fc_code=="" && fc_id=="")){
		pstmt = conn.prepareStatement(selectQuery1);
	}else{
		pstmt = conn.prepareStatement(selectQuery1);
		pstmt.setString(1, fc_code);
		pstmt.setString(2, fc_id);	
		pstmt.setString(3, fc_name);	
		pstmt.setString(4, fc_phone);	
		pstmt.setString(5, fc_addr);	
		pstmt.setString(6, fc_udate);	
		pstmt.setString(7, fc_coNum);	
		pstmt.setString(8, fc_ceo);	
		pstmt.setString(9, fc_accNum);	
	}
	
//쿼리실행 준비 단계 : 다양한 조건문을 작성 하면 끝!~~~~~~~~~~~	

	rs = pstmt.executeQuery();
	System.out.println(rs + "<-- rs m_search_form.jsp");
	//System.out.println(rs.next() + "<-- rs.next() m_search_form.jsp");
	while(rs.next()){
		System.out.println("while 반복 횟수");
%>		
		
		<tr>
		<td><%= rs.getString("fc_code")%></td>
		<td><%= rs.getString("fc_id")%></td>
		<td><%= rs.getString("fc_name")%></td>
		<td><%= rs.getString("fc_phone")%></td>
		<td><%= rs.getString("fc_addr")%></td>
		<td><%= rs.getString("fc_udate")%></td>
		<td><%= rs.getString("fc_coNum")%></td>
		<td><%= rs.getString("fc_ceo")%></td>
		<td><%= rs.getString("fc_accNum")%></td>
		<td>
<a href="<%= request.getContextPath() %>/f_reserve/f_reverse_insert.jsp?fc_code=<%= rs.getString("fc_code")%>">예약 버튼</a>
		</td>
		
	</tr>			
<%		
	}		
		
} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	// 6. 사용한 Statement 종료
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	
	// 7. 커넥션 종료
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}
%>
</table></div>			 
<%@ include file="/module/hadan.jsp" %>

</body>
</html>
