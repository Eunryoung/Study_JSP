<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<%-- sessionTest3_top.jsp 페이지를 현재 위치에 포함시키기 --%>
		<%-- pageContext 객체의 include() 메서드 호출 --%>
		<% pageContext.include("sessionTest3_top.jsp");%>
	</header>
	<hr>
	<main>
		<div align="center">
			<h1>로그인</h1>
			<form action="sessionTest3_loginPro.jsp" method="post">
				<input type="text" placeholder="아이디" name="id"><br>
				<input type="password" placeholder="패스워드" name="passwd"><br>
				<input type="checkbox" name="rememberLogin">로그인 상태 유지<br>
				<input type="submit" value="로그인">
			</form>
		</div>
	</main>
	<footer>
	... 회사 설명
	</footer>
</body>
</html>











