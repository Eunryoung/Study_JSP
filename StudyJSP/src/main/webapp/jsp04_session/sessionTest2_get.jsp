<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionTest2_get.jsp</h1>
	<h3>세션 아이디 : <%=session.getId() %></h3>
	<h3>세션값 1 : <%=session.getAttribute("sessionValue1") %></h3>		
	<h3>세션값 2 : <%=session.getAttribute("sessionValue2") %></h3>
	<hr>
	<%
	// 세션값 가져와서 변수에 저장하기
	// => 속성명이 "sessionValue1"인 세션의 속성값을 String 타입 변수 str1에 저장
// 	String str1 = session.getAttribute("sessionValue1");
	// => 오류 발생!(Type mismatch: cannot convert from Object to String)
	// => session.getAttribute() 메서드 리턴타입이 Object이므로
	//	  String 타입 등의 변수에 저장 시 해당 타입에 맞는 형변환 연산자 필수! (= 다운캐스팅)
	String str1 = (String)session.getAttribute("sessionValue1");
	String str2 = (String)session.getAttribute("sessionValue2");
	%>
	<h3>세션값 1 : <%=str1 %></h3>
	<h3>세션값 2 : <%=str2 %></h3>
	<hr>
	<%-- "돌아가기" 버튼 클릭 시 이전페이지로 돌아가기 --%>
<!-- 	<input type="button" value="돌아가기" onclick="history.back()">		 -->
	<%-- "처음으로" 버튼 클릭 시 "sessionTest2.jsp" 페이지로 이동 --%>
	<input type="button" value="처음으로" onclick="location.href='sessionTest2.jsp'">
</body>
</html>