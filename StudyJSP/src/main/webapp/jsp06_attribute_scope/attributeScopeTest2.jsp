<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>attributeScopeTest2.jsp</h1>
	<%-- 각 영역 객체에 저장된 속성값을 현재 페이지에서 확인하기 - getAttribute() --%>
	<h3>pageContext 객체 값 : <%=pageContext.getAttribute("pageScope") %></h3>
	<h3>request 객체 값 : <%=request.getAttribute("requestScope") %></h3>
	<h3>session 객체 값 : <%=session.getAttribute("sessionScope") %></h3>
	<h3>application 객체 값 : <%=application.getAttribute("applicationScope") %></h3>
	<%--
	웹브라우저에 직접 attributeScopeTest2.jsp 페이지 주소를 입력했을 경우
	(http://localhost:8080/StudyJSP/jsp06_attribute_scope/attributeScopeTest2.jsp)
	// => pageContext 객체의 속성값은 현재 페이지를 벗어났으므로 null 값이 출력됨
	// => request 객체의 속성값은 새로운 요청이 발생했으므로 null 값이 출력됨
	// => session 객체의 속성값은 세션이 유지되므로 저장된 속성값이 유지(출력)됨
	// => application 객체의 속성값은 서버가 동작중이므로 저장된 속성값이 유지(출력)됨
	====================================================================================
	웹브라우저 완전히 종료 후 새로 실행하여 직접 attributeScopeTest2.jsp 페이지 주소를 입력했을 경우
	(http://localhost:8080/StudyJSP/jsp06_attribute_scope/attributeScopeTest2.jsp)
	// => session 객체의 속성값은 웹브라우저 종료로 인해 세션 객체가 제거되었으므로 null 값이 출력됨
	// => application 객체의 속성값은 서버가 동작중이므로 저장된 속성값이 유지(출력)됨
	====================================================================================
	서버 종료 후 새로 실행(재시작)하여 attributeScopeTest2.jsp 페이지 접근 시
	(http://localhost:8080/StudyJSP/jsp06_attribute_scope/attributeScopeTest2.jsp)
	// => session 객체의 속성값은 웹브라우저 종료로 인해 세션 객체가 제거되었으므로 null 값 출력됨
	//	  만약, 서버 재시작 시 웹브라우저를 종료하지 않았을 경우 세션 객체는 유지됨
	// => application 객체의 속성값은 서버 종료로 인해 제거되었으므로 null 값 출력됨
	--%>
</body>
</html>