<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test1.jsp</h1>
<!-- 	<h3>2023-09-27 12:26:13</h3> --> <!-- 항상 같은 값이 표시됨 -->
	
	<%
	// java.util.Calendar 클래스의 static 메서드 getInstance() 메서드를 호출하여
	// Calendar 타입 인스턴스 리턴받아 변수에 저장
	Calendar c = Calendar.getInstance();
	int hour = c.get(Calendar.HOUR);
	int min = c.get(Calendar.MINUTE);
	int sec = c.get(Calendar.SECOND);
	%>
	<h3>현재 시각은 <%=hour %>시 <%=min %>분 <%=sec %>초 입니다.</h3><!-- 매번 다른 시각 출력 -->
	<!-- 
	[ JSP 페이지 동작(처리) 순서 ]
	1. 클라이언트가 웹브라우저를 통해 http://localhost:8080/StudyJSP/jsp01/test1.jsp 주소 요청
	2. 요청받은 웹서버가 컨테이너로 JSP 부분에 대한 처리(= 자바 코드 해석 및 실행) 요청
	3. 컨테이너에서 자바(JSP) 코드 실행 후 결과를 웹서버로 전송(응답)
	4. 웹서버가 응답을 받아 클라이언트(웹브라우저)에게 전달할 응답 메세지를 생성 및 전송
	5. 웹서버로부터 응답을 전달받은 클라이언트가 응답 메세지의 HTML 태그 실행하여 화면 표시
	=> 따라서, 클라이언트 측에서 JSP 코드를 확인할 수 없다! (소스코드 보기에서 표시 X)
	=> 또한, 서버에서 처리되는 시점에서 데이터(결과값)가 달라질 수 있다!
	-->
	
</body>
</html>