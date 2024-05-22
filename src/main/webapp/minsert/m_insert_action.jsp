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
//post방식 한글 처리 방법
request.setCharacterEncoding("euc-kr");%>
<jsp:useBean id="m" class="ourpet.member.Member"/>
<jsp:setProperty name="m" property="*"/>

<%
Mdao mdao=new Mdao();
mdao.mInsert(m);

session.setAttribute("S_ID", m.getM_id());
session.setAttribute("S_LEVEL", m.getM_level());
session.setAttribute("S_NAME", m.getM_name());
//반려동물 수가 1마리 이상인 경우
if(Integer.parseInt(m.getM_pet())>=1)
{
	//반려동물 정보 입력창으로 이동
	response.sendRedirect(request.getContextPath()+"/pinsert/p_insert_form.jsp");
}
else
{
	//내 반려동물 리스트로 이동(리스트에 아무것도 없는게 맞습니다.)
	response.sendRedirect(request.getContextPath()+"/plist/p_list.jsp");
}


%>





















