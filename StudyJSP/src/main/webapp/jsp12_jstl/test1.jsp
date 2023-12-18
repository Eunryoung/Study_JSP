<%@page import="jsp11_jdbc_dao.StudentDTO"%>
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
	// session 객체를 사용하여 "testValue" 라는 속성명으로 "Session Value" 문자열 저장
	session.setAttribute("testValue", "Session Value");
	
	// jsp11_jdbc_dao.StudentDTO 객체 생성 후 
	// session 객체에 "student" 라는 속성명으로 StudentDTO 객체 저장
	StudentDTO student = new StudentDTO();
	student.setIdx(1);
	student.setName("홍길동");
	session.setAttribute("student", student);
	
	%>
	<div align="center">
		<h1>test1.jsp</h1>
		<form action="test1_result.jsp">
			<input type="text" placeholder="이름" name="name"><br>
			<input type="text" placeholder="나이" name="age"><br>
			<input type="text" placeholder="주민번호" name="jumin"><br>
			<input type="submit" value="확인">
		</form>
	</div>
</body>
</html>
















