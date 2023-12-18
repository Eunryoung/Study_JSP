<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 폼 파라미터(아이디, 패스워드) 가져와서 변수에 저장 및 출력
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
out.print("아이디 : "+ id + ", 패스워드 : " + passwd + "<br>");

// 아이디, 패스워드 판별에 사용할 임시 데이터
String dbId = "admin";
String dbPasswd = "1234";
String dbId2 = "hong";
String dbPasswd2 = "hong123";

// 아이디가 "admin"이고, 패스워드가 "1234"이면 로그인 성공, 아니면 로그인 실패
// => 로그인 성공 시 "로그인 성공!" 출력, 로그인 실패 시 "로그인 실패!" 출력
// => 임시로 추가 아이디 "hong", 패스워드 "hong123" 비교도 함께 수행(OR 연산)
if((dbId.equals(id) && dbPasswd.equals(passwd)) || (id.equals(dbId2) && passwd.equals(dbPasswd2))) { // 로그인 성공
// 	out.print("<h3>로그인 성공!</h3>");
	
	// 세션 객체에 로그인 성공한 아이디를 "sId"라는 속성명으로 저장하기
	session.setAttribute("sId", id);
	
	// 메인페이지(sessionTest3_main.jsp) 페이지로 리다이렉트
	response.sendRedirect("sessionTest3_main.jsp");
} else { // 로그인 실패
// 	out.print("<h3>로그인 실패!</h3>");
	// 자바스크립트로 "로그인 실패" 출력 후 이전페이지로 돌아가기
	%>
	<script>
		alert("로그인 실패");
		history.back();
	</script>
	<%	
}
%>