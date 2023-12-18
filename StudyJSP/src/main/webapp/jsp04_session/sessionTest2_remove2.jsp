<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionTest2_remove2.jsp</h1>
	<%
	// session 객체에 저장된 특정 속성(속성값 포함)을 제거(삭제)하는 방법
	// => session.removeAttribute("속성명");
	// 세션 객체에 저장된 "sessionValue2" 속성 제거	
	session.removeAttribute("sessionValue2");
	%>	
	<h3>세션값 2 삭제 완료!</h3>
	<h3><a href="sessionTest2_get.jsp">세션값 확인</a></h3>	
</body>
</html>