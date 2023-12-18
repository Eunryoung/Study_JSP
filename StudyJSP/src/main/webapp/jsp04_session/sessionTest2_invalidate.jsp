<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionTest2_invalidate.jsp</h1>
	<%
	// session 객체 초기화
	// => session.invalidate();
	// => 특정 속성 1개가 아닌 모든 속성 제거하는 역할
	// 	  다만, 속성만 제거되는 것이 아니라 세션 객체 자체를 무효화
	session.invalidate();
	
	out.print(session.getId());
	// 세션 초기화 후 getId() 메서드를 통한 세션 아이디 확인은 가능하지만
	// 그 외의 메서드로 세션에 접근 시 오류 발생
	// => xxx() : 세션이 이미 무효화 되었습니다.
// 	out.print(session.isNew()); // 오류
// 	out.print(session.getLastAccessedTime()); // 오류
// 	out.print(session.getAttribute("sessionValue1")); // 오류
	// => 새로운 페이지를 요청하여 새로운 접속 시 새로운 세션 아이디를 부여받으면 사용 가능
	%>
	<h3>세션 초기화 완료</h3>
	<h3><a href="sessionTest2_get.jsp">세션값 확인</a></h3> <%-- 새로운 요청 수행 --%>
</body>
</html>