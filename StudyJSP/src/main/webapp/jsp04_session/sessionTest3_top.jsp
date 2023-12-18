<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 세션 객체에 저장된 세션 아이디(속성명 "sId")를 String 타입 변수 id에 저장
String id = (String)session.getAttribute("sId");
%>
<script>
	// 확인창(confirm 다이얼로그)을 통해 로그아웃 여부를 확인할 confirmLogout() 함수 정의
	function confirmLogout() {
		let isLogout = confirm("로그아웃 하시겠습니까?"); // true/false 리턴
		
		// isLogout 변수값이 true일 경우 로그아웃("sessionTest3_logout.jsp") 페이지로 이동
		if(isLogout) {
			location.href = "sessionTest3_logout.jsp";
		}
	}
</script>   
<div align="right">
	<h4>
		<a href="sessionTest3_main.jsp">HOME</a> |
		<%--
		로그인 성공/실패에 따른 작업 수행(= 서로 다른 하이퍼링크 표시)
		- 세션 아이디(sId 속성값)가 없을 경우(= null) 로그인 수행하지 않은 상태이므로
		  로그인, 회원가입 링크 표시
		- 세션 아이디(sId 속성값)가 있을 경우 로그인 수행한 상태이므로
		  세션 아이디, 로그아웃 링크 표시
		--%>
		<%if(id == null) { // 세션 아이디 없을 경우 %>
			<a href="sessionTest3_loginForm.jsp">로그인</a> |
			<a href="sessionTest3_joinForm.jsp">회원가입</a>
		<%} else { // 세션 아이디 있을 경우 %>
			<%=id %> 님 |
			<%-- 단, 로그아웃 링크 클릭 시 자바스크립트로 확인 기능 추가 --%>
			<%-- 하이퍼링크에서 자바스크립트 함수 호출 시 "javascript:함수명()" 형태로 지정 --%>
			<a href="javascript:confirmLogout()">로그아웃</a>
			
			<%-- 단, 세션 아이디가 "admin"이면 [ 관리자 페이지 ] 링크 추가로 표시 --%>
			<%if(id.equals("admin")) { %>
				| <a href="sessionTest3_admin.jsp">관리자 페이지</a>
			<%} %>
		<%}%>
	</h4>
</div>