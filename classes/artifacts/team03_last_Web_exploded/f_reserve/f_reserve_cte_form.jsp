<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<form action="<%=request.getContextPath()%>/f_reserve/f_reserve.jsp" method="post">
<select id="categorySelect" name="sk">
    <option value="fc_name">업체별</option>
    <option value="fc_ceo">대표자</option>
    <option value="fc_id">업체 아이디</option>
</select>
<input type="text" name="sv">
<input type="submit" value="검색버튼">
</form>