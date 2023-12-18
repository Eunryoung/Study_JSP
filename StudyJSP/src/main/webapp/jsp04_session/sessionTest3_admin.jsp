<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	// 관리자 페이지는 보안상의 이유로 관리자 외에는 접근이 불가능해야 한다!
	// 다만, 일반 사용자에게 접속 주소가 노출될 경우 일반 사용자도 접근이 가능하기 때문에
	// 반드시, 세션 아이디 체크 또는 별도의 비밀번호 확인 기능을 추가해야함
	// -------------------------------------------
	// 세션 아이디가 관리자가 아닐 경우 "접근 권한이 없습니다!" 출력 후 이전페이지로 돌아가기
	// => 단, "admin" 판별 전 null 값  판별이 먼저 수행되어야 한다! (NullPointerException 때문)
	// 	  즉, 세션 아이디가 null이거나 "admin"이 아닐 경우로 수정
	String id = (String)session.getAttribute("sId");
	if(id == null || !id.equals("admin")) { 
		// id 값이 null인지부터 판별한 후, null이 아닌 경우 "admin"인지도 판별
		// => !id.equals("admin")부터 판별할 경우, id 값이 null인 경우 오류 발생!(500)
		%>
		<script>
			alert("접근 권한이 없습니다!");
			history.back();
		</script>
		<%
	}
	%>
	<header>
		<%-- sessionTest3_top.jsp 페이지를 현재 위치에 포함시키기 --%>
		<%-- pageContext 객체의 include() 메서드 호출 --%>
		<% pageContext.include("sessionTest3_top.jsp");%>
	</header>
	<hr>
	<main>
		<div align="center">
			<h1>관리자 페이지</h1>
		</div>
	</main>
	<footer>
	... 회사 설명
	</footer>
</body>
</html>