<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h1>test3.jsp</h1>
		<%-- 
		쿠키에 저장된 lang 값이 "ko-kr" 일 경우 한국어로 텍스트 출력하고
		"en-us" 일 경우 영어로 텍스트 출력
		--%>
		<c:choose>
			<c:when test="${cookie.lang.value eq 'ko-kr' }">
				<h3>안녕하세요. 쿠키 예제 사이트입니다.</h3>
			</c:when>
			<c:when test="${cookie.lang.value eq 'en-us' }">
				<h3>Hello, This is Cookie example web site.</h3>
			</c:when>
			<c:otherwise>
				<h3>안녕하세요. 쿠키 예제 사이트입니다.</h3>
			</c:otherwise>
		</c:choose>
		<hr>
		<%-- 셀렉트박스 언어 선택 시 Test3Cookie 서블릿 요청(파라미터로 셀렉트박스 값 전달) --%>
		<select name="lang" onchange="location.href='Test3Cookie?lang=' + this.value">
			<option value=""></option>
			<option value="ko-kr">한국어</option>
			<option value="en-us">영어</option>
		</select>
	</div>
</body>
</html>











