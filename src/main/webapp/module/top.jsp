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
	<!-- 1-1 �α��� ��ȭ�� ���� -->
	<a href="<%= request.getContextPath() %>/mlcheck/ml_check_form.jsp">01ȸ������</a><br/><br/>
	<form action="<%= request.getContextPath() %>/login/login_action.jsp" method="post">
		���̵� : <input type="text" name="mid">
		��� : <input type="password" name="mpw">
		<input type="submit" value="�α��ι�ư">
	</form>
	<!-- 1-1 �α��� ��ȭ�� �� -->
<%
}else{
	if(S_LEVEL.equals("�Ϲ�ȸ��")){
%>
<a href="<%= request.getContextPath() %>/mupdate/m_update_form.jsp?send_id=<%=S_ID%>">01������������</a>
<a href="<%= request.getContextPath() %>/pet/pet_reg_form.jsp">02�ݷ������������</a>
<a href="<%= request.getContextPath() %>/pet/pet_reg_list.jsp">03�ݷ���������Ʈ</a>
<a href="<%= request.getContextPath() %>/f_reserve/f_reserve.jsp">04��ʿ���</a>
<a href="<%= request.getContextPath() %>/f_reserve/f_reserve_check.jsp">05����Ȯ��(������)</a>

<%
	}else if(S_LEVEL.equals("��ʾ�ü")){
%>
<a href="<%= request.getContextPath() %>/fc_update/fc_update_form.jsp?send_id=<%=S_ID%>">01��ü��������</a>			 
<a href="<%= request.getContextPath() %>/fc_list/fc_list.jsp">02��ü���</a>
<a href="<%= request.getContextPath() %>/f_r/f_r_m.jsp">03��ʿ��ฮ��Ʈ</a>
<a href="<%= request.getContextPath() %>/f_r/f_r_cancle_list.jsp">04��ʿ�����Ҹ���Ʈ</a>
<a href="<%= request.getContextPath() %>/f_r/f_r_accep_list.jsp">05��ʿ���Ȯ������Ʈ</a>   
<%
	}else if(S_LEVEL.equals("������")){
%>
<a href="<%= request.getContextPath() %>/msearch/m_search_list.jsp">01ȸ���˻�(������)</a>			
<a href="<%= request.getContextPath() %>/fc_list/fc_list.jsp">02��ü���</a>
<%
	}
%>
	<!-- 1-2 �α��� �� ȭ�� ���� -->
	<%= S_NAME %> �� <%= S_LEVEL %> �������� �α��� ��
	<a href="<%= request.getContextPath() %>/login/logout.jsp">�α׾ƿ�</a>
	<!-- 1-2 �α��� �� ȭ�� �� -->
<%} %>
		 
			   
		 </div>
		 <!-- End Header -->
		 
		 
		 
		 