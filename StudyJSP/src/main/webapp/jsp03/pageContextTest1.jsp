<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 내장객체 response를 활용하여 pageContextTest2.jsp 페이지로 이동(= 리다이렉트)
// response.sendRedirect("pageContextTest2.jsp");
// => pageContextTest1.jsp 페이지를 서버에 요청시 
// 	  서버가 클라이언트에게 pageContextTest2.jsp 페이지로 리다이렉트 하도록 응답을 전송하면
//	  클라이언트가 다시 pageContextTest2.jsp 페이지로 새로운 요청을 수행한다.
// 	  최종적으로 서버가 클라이언트에게 pageContextTest2.jsp 페이지를 응답한다.
// => 이 때, 최종 클라이언트(웹브라우저)의 주소표시줄의 리다이렉트 주소는 다음과 같다.
// 	  http://localhost:8080/StudyJSP/jsp03/pageContextTest2.jsp(새 주소로 변경됨)
// => 이처럼, 새로운 요청에 의해 새 페이지로 이동 시 주소표시줄의 URL(주소)이 변경되는 방식을
//	  리다이렉트(Redirect)라고 한다!
// ------------------------------------------------------------------------------------------
// 또 다른 내장객체 pageContext 객체의 forward() 메서드를 호출하여 동일한 페이지로 이동(= 포워딩)
pageContext.forward("pageContextTest2.jsp");
// => pageContextTest1.jsp 페이지를 서버에 요청 시
//	  서버가 forward() 메서드의 파라미터에 있는 대상 페이지를 직접 처리하여
//	  클라이언트에게 처리 결과를 응답으로 전송한다.
//	  따라서, 클라이언트는 서버로부터 pageContextTest1.jsp 페이지가 아닌
//	  pageContextTest2.jsp 페이지를 응답 데이터로 전달받게 된다.
// => 이 때, 최종 클라이언트(웹브라우저)의 주소표시줄의 포워딩 된 주소는 다음과 같다.
//    http://localhost:8080/StudyJSP/jsp03/pageContextTest1.jsp(이전 주소가 유지됨)
// => 이처럼, 새로운 주소 요청 시 기존 요청 주소가 그대로 유지(변경되지 않음)되고
//	  새로운 주소에 대한 내용만 응답 데이터로 전달받는 방식을 포워딩(Forwarding)이라고 함
//	  (=> 디스패치 방식의 포워딩이라고 함)
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 자바 코드로 인해 이동되어(제어권이 넘어가서) 실행되지 못하는 코드들 --%>
	<h1>pageContextTest1.jsp</h1>
	<script type="text/javascript">
		alert("확인!");
	</script>
</body>
</html>