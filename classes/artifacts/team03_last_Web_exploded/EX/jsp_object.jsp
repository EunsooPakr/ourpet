<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
//jsp 내장 객체
//자바코드 위치 : 콘솔창 출력
//예) request 객체참조변수에는 어떤 값이 할당 되어 있을까? 
//	00인터페이스로 부터 구현 명령 받은 RequestFacade 클래스 통해 생성된 객체의 주소값
// 내가 구현 하지 않았지만 미리
System.out.println(request + "<-- request");
System.out.println(response + "<-- response");
System.out.println(out + "<-- out");
System.out.println(session + "<-- session");
System.out.println(pageContext + "<-- pageContext");
System.out.println(application + "<-- application");
System.out.println(config  + "<-- config ");
System.out.println(page + "<-- page");
/* 
org.apache.catalina.connector.RequestFacade@2b493a3a<-- request
org.apache.catalina.connector.ResponseFacade@76a41249<-- response
org.apache.jasper.runtime.JspWriterImpl@4f5116bb<-- out
org.apache.catalina.session.StandardSessionFacade@5dc0849<-- session
org.apache.jasper.runtime.PageContextImpl@4196e121<-- pageContext
org.apache.catalina.core.ApplicationContextFacade@66162998<-- application
org.apache.catalina.core.StandardWrapperFacade@30764949<-- config 
org.apache.jsp.EX.jsp_005fobject_jsp@2f0dde81<-- page
*/
 
%>