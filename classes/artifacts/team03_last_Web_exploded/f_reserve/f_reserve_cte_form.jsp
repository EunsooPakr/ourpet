<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<form action="<%=request.getContextPath()%>/f_reserve/f_reserve.jsp" method="post">
<select id="categorySelect" name="sk">
    <option value="fc_name">��ü��</option>
    <option value="fc_ceo">��ǥ��</option>
    <option value="fc_id">��ü ���̵�</option>
</select>
<input type="text" name="sv">
<input type="submit" value="�˻���ư">
</form>