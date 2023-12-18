<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>쿠키 확인하기</h1>
	<%-- ShowCookieServlet 클래스의 쿠키 사용 문법을 JSP 파일에서도 사용 가능 --%>
	<%-- 또한, EL 에서도 내장객체(cookie)가 제공되므로 쉽게 접근 가능 --%>
	<%-- => 쿠키명 : ${cookie.쿠키명.name}, 쿠키값 : ${cookie.쿠키명.value} --%>
	<h3>cookieName 쿠키의 값 : ${cookie.cookieName.value }</h3>
</body>
</html>











