<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
String S_ID = (String)session.getAttribute("S_ID");
String S_LEVEL = (String)session.getAttribute("S_LEVEL");
String S_NAME = (String)session.getAttribute("S_NAME");
System.out.println(S_ID + "<-- S_ID top.jsp");
System.out.println(S_LEVEL + "<-- S_LEVEL top.jsp");
System.out.println(S_NAME + "<-- S_NAME top.jsp");
%>
   <!-- Begin Wrapper -->
   <div id="wrapper">
   
         <!-- Begin Header -->
         <div id="header">
/module/top.jsp	<br>         

<%
if(S_LEVEL == null){
%>
	<!-- 1-1 로그인 전화면 시작 -->
	<a href="<%= request.getContextPath() %>/mlcheck/ml_check_form.jsp">01회원가입</a><br/><br/>
	<form action="<%= request.getContextPath() %>/login/login_action.jsp" method="post">
		아이디 : <input type="text" name="mid">
		비번 : <input type="password" name="mpw">
		<input type="submit" value="로그인버튼">
	</form>
	<!-- 1-1 로그인 전화면 끝 -->
<%
}else{
	if(S_LEVEL.equals("일반회원")){
%>
<a href="<%= request.getContextPath() %>/mupdate/m_update_form.jsp?send_id=<%=S_ID%>">01개인정보수정</a>
<a href="<%= request.getContextPath() %>/pet/pet_reg_form.jsp">02반려동물정보등록</a>
<a href="<%= request.getContextPath() %>/pet/pet_reg_list.jsp">03반려동물리스트</a>
<a href="<%= request.getContextPath() %>/f_reserve/f_reserve.jsp">04장례예약</a>
<a href="<%= request.getContextPath() %>/f_reserve/f_reserve_check.jsp">05예약확인(수정중)</a>

<%
	}else if(S_LEVEL.equals("장례업체")){
%>
<a href="<%= request.getContextPath() %>/fc_update/fc_update_form.jsp?send_id=<%=S_ID%>">01업체정보수정</a>			 
<a href="<%= request.getContextPath() %>/fc_list/fc_list.jsp">02업체목록</a>
<a href="<%= request.getContextPath() %>/f_r/f_r_m.jsp">03장례예약리스트</a>
<a href="<%= request.getContextPath() %>/f_r/f_r_cancle_list.jsp">04장례예약취소리스트</a>
<a href="<%= request.getContextPath() %>/f_r/f_r_accep_list.jsp">05장례예약확정리스트</a>   
<%
	}else if(S_LEVEL.equals("관리자")){
%>
<a href="<%= request.getContextPath() %>/msearch/m_search_list.jsp">01회원검색(수정중)</a>			
<a href="<%= request.getContextPath() %>/fc_list/fc_list.jsp">02업체목록</a>
<%
	}
%>
	<!-- 1-2 로그인 후 화면 시작 -->
	<%= S_NAME %> 님 <%= S_LEVEL %> 권한으로 로그인 중
	<a href="<%= request.getContextPath() %>/login/logout.jsp">로그아웃</a>
	<!-- 1-2 로그인 후 화면 끝 -->
<%} %>
		 
			   
		 </div>
		 <!-- End Header -->
		 
		 
		 
		 