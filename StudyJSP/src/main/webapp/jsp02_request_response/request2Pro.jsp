<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>request2Pro.jsp - 로그인 처리</h1>
	<%-- 폼 파라미터(아이디, 패스워드, 로그인 상태 유지) 값 가져와서 변수에 저장 및 출력 --%>
	<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String rememberLogin = request.getParameter("rememberLogin");
	
// 	out.print("<h3>아이디 : " + id + "</h3>");
// 	out.print("<h3>패스워드 : " + passwd + "</h3>");
// 	out.print("<h3>로그인 상태 유지 : " + rememberLogin + "</h3>");
	%>
	
	<h3>아이디 : <%=id %></h3>
	<h3>패스워드 : <%=passwd %></h3>
	<h3>로그인 상태 유지 : <%=rememberLogin %></h3>
	
	<%
	/*
	[ 자바 코드를 사용하여 아이디, 패스워드 판별 ]
	- 데이터베이스에 저장된 아이디를 "admin"이라고 가정하고, 패스워드를 "1234"라고 가정
	- 폼을 통해 입력받은 아이디와 패스워드를 각각 데이터베이스 데이터와 비교하여
	  둘 다 일치할 경우 "로그인 성공!", 아니면 "로그인 실패!" 출력
	-------------------------------------------------------------------------------  
	주의! 자바 코드 내에서 문자열 데이터 비교할 때
	동등비교연산자(==) 대신 String 객체의 equals() 메서드를 호출하여 문자열 비교 필수!
	=> 동등비교연산자는 문자열 내용이 아닌 문자열이 저장된 위치의 주소값을 비교하므로
	   동일한 문자열이라도 비교 결과가 false 값이 출력될 수 있다!
	   
	< 기본 문법 >
	if(문자열.equals(비교할 문자열)) {
		// 문자열이 일치할 경우 수행할 작업...
	} else {
		// 문자열이 일치하지 않을 경우 수행할 작업...
	}
	*/
	
	// 임시로 데이터베이스에 저장된 아이디, 패스워드를 가져왔다고 가정하고 변수에 저장
	String dbId = "admin";
	String dbPasswd = "1234";
	if(id.equals(dbId) && passwd.equals(dbPasswd)) { // 둘 다 일치할 경우(AND 연산 활용)
		// 브라우저에 로그인 성공 출력
		out.print("<h3>로그인 성공!</h3>");
	} else { // 둘 중 하나라도 일치하지 않을 경우
// 		out.print("<h3>로그인 실패!</h3>");
		// 자바스크립트를 활용하여 "로그인 실패!" 출력 후 이전페이지로 돌아가기
// 		out.print("<script>");
// 		out.print("alert('로그인 실패!');");
// 		out.print("history.back();"); 
// 		out.print("</script>"); 
		%>
		<script type="text/javascript">
			alert('로그인 실패!');
			history.back();
		</script>
		<%
	}
	%>
</body>
</html>