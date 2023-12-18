<%@page import="jsp11_jdbc_dao.StudentDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<%
				// request 객체에 저장된 학생 목록 객체(List<StudentDTO> 타입) 꺼내서 변수에 저장
				// => request 객체의 getAttribute() 메서드 활용(속성명 "studentList")
				// => 리턴타입이 Object 타입이므로 다시 List<StudentDTO> 타입으로 다운캐스팅
				List<StudentDTO> studentList = (List<StudentDTO>)request.getAttribute("studentList");
				
				// List 객체를 반복문을 통해 반복 접근하면서 저장된 StudentDTO 객체 꺼내기
				// 1) 일반 for문 사용(배열 크기 대신 List 객체의 size() 활용)
// 				for(int i = 0; i < studentList.size(); i++) {
					// List 객체의 get() 메서드를 호출하여 1개의 StudentDTO 객체 꺼내기
					// => 파라미터 : 인덱스 번호		리턴타입 : StudentDTO(student)
// 					StudentDTO student = studentList.get(i);
					
					// 테이블 각 행 반복하면서 StudentDTO 객체의 Getter 호출하여 데이터 출력
					%>
<!-- 					<tr> -->
<%-- 						<td><%=student.getIdx() %></td> --%>
<%-- 						<td><%=student.getName() %></td> --%>
<!-- 					</tr> -->
					<%
// 				}
				
				// ----------------------------------------------------------------------
				// 2) 향상된 for문 활용
				for(StudentDTO student : studentList) {
					%>
					<tr>
						<td><%=student.getIdx() %></td>
						<td><%=student.getName() %></td>
					</tr>
					<%	
				}
				%>
			</table>
		</div>
	</main>
</body>
</html>











