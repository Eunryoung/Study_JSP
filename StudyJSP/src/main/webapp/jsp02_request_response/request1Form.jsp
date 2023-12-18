<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>request1Form.jsp - 입력폼</h1>
	<%--
	[ form 태그 ]
	1) action 속성
	   - submit 동작 시 폼 태그 내의 입력값(= 폼 파라미터)를 모두 request 객체에 저장한 후
	     action 속성에 저장된 페이지(또는 파일)로 포워딩(이동) 작업 수행
	     => 이 때, 이동 시 request 객체도 함께 전송
	2) method 속성
	   - GET 방식(method="get" => 기본값)
	     => URL 에 파라미터가 함께 포함되어 전송되는 요청 방식
	        (POST 방식에 비해 빠르지만, 요청 데이터 길이 제한이 있으며, 데이터가 노출됨)
	   - POST 방식(method="post")
	     => URL 대신 BODY 영역에 파라미터를 포함하여 전송되는 요청 방식
	        (요청 데이터 길이 제한이 없으며, 데이터 노출이 최소화 되나, 상대적으로 느림)
	     => 요청된 페이지에서 파라미터 데이터에 접근 시 한글 처리가 되지 않을 수 있으므로
	        request.setCharacterEncoding("UTF-8"); 코드를 사용하여
	        한글 인코딩 방식을 UTF-8(유니코드) 방식으로 변경해야한다!
	--%>
	<%-- form 태그를 통해 데이터 전송 시 name 속성 필수! --%>
	<%-- 전송 시 name 속성으로 된 파라미터에 value 속성값이 연결되어 전달됨 --%>	
<!-- 	<form action="requestPro1.jsp" method="get"> -->
	<form action="request1Pro.jsp" method="post">
		<table border="1">
			<tr>
				<th>이름</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input type="text" name="age"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="gender" value="male">남
					<input type="radio" name="gender" value="female">여
				</td>
			</tr>
			<tr>
				<th>취미</th>
				<td>
					<input type="checkbox" name="hobby" value="독서">독서
					<input type="checkbox" name="hobby" value="게임">게임
					<input type="checkbox" name="hobby" value="등산">등산
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="전송"></td>
			</tr>
		</table>
	</form>
	
</body>
</html>