<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h1>정보 입력</h1>
		<form action="forwardPro.jsp" method="post">
			<%--
			폼에서 직접 입력받는 데이터 외의 별도의 데이터를 함께 포함시켜 전달할 경우 
			<input type="hidden" name="파라미터명" value="파라미터값"> 태그 사용
			--%>
			<%-- 주민번호를 입력받지 않고 hidden 타입 파라미터로 전달 --%>
			<input type="hidden" name="jumin" value="991010-1234567">
			
			<%-- 아이디, 패스워드, 이름을 직접 받아 전달 --%>
			<input type="text" placeholder="아이디" name="id"><br>
			<input type="password" placeholder="패스워드" name="passwd"><br>
			<input type="text" placeholder="이름" name="name"><br>
			<input type="submit" value="전송">
		</form>
	</div>
</body>
</html>