<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionTest2_set.jsp</h1>
	<%
	/*
	[ session 객체에 속성값(데이터)을 저장하는 방법 ]
	=> session 객체의 setAttribute("속성명", "속성값")
	=> 첫번째 파라미터(속성명 = 키)
	   - 저장할 데이터를 지정할 때 사용할 이름
	   - 객체의 변수명과 동일한 역할 수행
	=> 두번째 파라미터(속성값 = 데이터)
	   - 세션 객체에 저장할 데이터(데이터의 타입은 무관 = Object)
	   - 세션 객체에 저장 후에는 속성명을 통해 접근 가능함
	=> 4대 영역 객체(pageContext, request, session, application) 모두 동일한 방법 사용
	*/
	session.setAttribute("sessionValue1", "첫번째 세션값");
	session.setAttribute("sessionValue2", "두번째 세션값");
	%>
	
	<h3>세션값 생성 완료!</h3>
	<h3><a href="sessionTest2_get.jsp">세션값 확인</a></h3>
	<hr>
	<%-- 
	임시) session 객체에 저장된 데이터 꺼내서 확인
	=> session 객체의 getAttribute("속성명")
	=> 파라미터 : 저장된 데이터를 가리키는 속성명(=키)
	=> 지정된 속성명에 해당하는 데이터(속성값)를 리턴(리턴타입 : Object) // 저장시 Object 타입이면 리턴도 Object
	--%>
	<h3>세션값 1 : <%=session.getAttribute("sessionValue1") %></h3>		
	<h3>세션값 2 : <%=session.getAttribute("sessionValue2") %></h3>		
	<%-- 주의! 존재하지 않는 속성명 지정 시 null 값 리턴됨 --%>
	<h3>세션값 3(속성명 없음) : <%=session.getAttribute("sessionValue3") %></h3>		
</body>
</html>