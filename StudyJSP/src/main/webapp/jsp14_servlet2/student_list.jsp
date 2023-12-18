<%@page import="jsp14_servlet2.StudentDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<main>
		<div align="center">
			<h1>학생 목록 조회</h1>
			<table border="1">
				<tr>
					<th>번호</th>
					<th>이름</th>
				</tr>
				<%--
				JSTL 과 EL 을 조합하여 List<StudentDTO> 타입 객체(studentList) 가져와서
				저장된 StudentDTO 객체에 차례대로 접근하여 idx, name 값 출력하기
				- 반복문은 <c:forEach> 태그 사용, 향상된 for문처럼 활용하기 위해
				  var="변수명" items="${객체속성명}" 속성을 조합하여 사용
				  => 객체속성명은 page, request, session, application 영역에 저장된 객체명
				- StudentDTO 객체에 저장된 멤버변수 접근은 꺼낸 속성을 통해 변수에 접근
				  => ${객체변수명.멤버변수명}
				  => StudentDTO 객체에 Getter 메서드 정의 필수!
				--%>
				<c:forEach var="student" items="${studentList }">
					<tr>
						<td>${student.idx }</td>
						<td>${student.name }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</main>
</body>
</html>











