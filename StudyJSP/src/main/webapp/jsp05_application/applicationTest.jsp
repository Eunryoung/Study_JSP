<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>applicationTest.jsp</h1>
	<%--
	[ application 객체 ]
	- 웹 어플리케이션 서버 (= WAS = 웹 컨테이너 = 톰캣)에 대한 정보를 관리하는 객체
	- 웹 어플리케이션(= 프로젝트) 하나 당 하나의 application 객체가 생성됨
	  => 어플리케이션 전체 영역에서 하나의 객체를 공유함
	- 서버가 시작되면 application 객체가 생성되고, 서버가 종료(중지)되면 application 객체가 제거됨
	- 전체 방문자 수 카운팅 등의 정보 저장 용도로 활용 가능
	--%>
	<%-- application 객체의 메서드 --%>
	<h3>서버 기본 정보 : <%=application.getServerInfo() %></h3>
	<h3>서버 프로젝트의 루트 경로의 물리적 경로 정보 : <%=application.getRealPath("/") %></h3>
	<h3>서버 컨텍스트 경로(루트) 정보 : <%=application.getContextPath() %></h3>
</body>
</html>