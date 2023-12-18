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
	// request3From.jsp 페이지로부터 전달받은 폼 파라미터 가져오기
	// 단, POST 방식 요청이므로 한글 인코딩 방식 UTF-8로 지정
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");

// 	String jumin1 = request.getParameter("jumin1");
// 	String jumin2 = request.getParameter("jumin2");
	// 주민번호  앞, 뒷자리를 하나의 변수에 결합 => DB 등에 저장 시 필요
	String jumin = request.getParameter("jumin1") + "-" + request.getParameter("jumin2");
	
// 	String email1 = request.getParameter("email1");
// 	String email2 = request.getParameter("email2");
	// 이메일 계정명, 도메인을 하나의 변수에 결합 => DB 등에 저장 시 필요
	String email = request.getParameter("email1") + "@" + request.getParameter("email2");

	String job = request.getParameter("job");
	String gender = request.getParameter("gender");
	
	// 취미는 동일한 name 속성으로 복수개의 항목이 전달되므로 String[] 타입 사용
	String[] arrHobby = request.getParameterValues("hobby");
	
	String motivation = request.getParameter("motivation");
	%>
	<h1>request3Pro.jsp - 회원가입 데이터</h1>
	<table border="1">
		<tr>
			<th>이름</th>
			<td><%=name %></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><%=id %></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><%=passwd %></td>
		</tr>
		<tr>
			<th>주민번호</th>
<%-- 			<td><%=jumin1 %>-<%=jumin2 %></td>			 --%>
			<td><%=jumin %></td>
		</tr>
		<tr>
			<th>E-Mail</th>
<%-- 			<td><%=email1 %>@<%=email2 %></td> --%>			
			<td><%=email %></td>
		</tr>
		<tr>
			<th>직업</th>
			<td><%=job %></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><%=gender %></td>
		</tr>
		<tr>
			<th>취미</th>
			<td>
				<%
				// 일반 for
// 				for(int i = 0; i < arrHobby.length; i++) {
// 					out.print(arrHobby[i] + " ");
// 				}
				
				// 향상된 for문
				for(String hobby : arrHobby) {
					out.print(hobby + " ");
				}
				%>
			</td>
		</tr>
		<tr>
			<th>가입동기</th>
			<td><%=motivation %></td>
		</tr>
	</table>
</body>
</html>