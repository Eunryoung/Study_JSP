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
	<header>
		<jsp:include page="test2_top.jsp"></jsp:include>
	</header>
	<hr>
	<main>
		<div align="center">
			<h1>로그인</h1>
			<!-- 로그인 버튼 클릭 시 "LoginPro" 서블릿 요청 -->
			<!-- jsp13_cookie/LoginProServlet 클래스 매핑 -->
<%-- 			쿠키 아이디 : ${cookie.cookieId.value } --%>
			<form action="LoginPro" method="post">
				<input type="text" placeholder="아이디" name="id" value="${cookie.cookieId.value }"><br>
				<input type="password" placeholder="패스워드" name="passwd"><br>
				
				<%-- 만약, 쿠키의 아이디가 존재할 경우 아이디 저장 체크박스 체크 --%>
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${not empty cookie.cookieId.value }"> --%>
<!-- 						<input type="checkbox" name="rememberId" checked>아이디 저장<br> -->
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
<!-- 						<input type="checkbox" name="rememberId">아이디 저장<br> -->
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose> --%>
					<%-- checked 속성 추가 여부만 결정하여 문장을 간결하게 작성 가능 --%>
					<%-- input 태그 내에서 c:if 태그로 쿠키 존재할 경우 checked 속성 추가 --%>
					<input type="checkbox" name="rememberId" 
						<c:if test="${not empty cookie.cookieId.value }">checked</c:if>
					>아이디 저장<br>
				<input type="submit" value="로그인">
			</form>
		</div>
	</main>
	<hr>
	<footer>
		회사설명......
	</footer>
</body>
</html>











