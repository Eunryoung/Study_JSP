<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<%-- servlet1_top.jsp 페이지를 현재 위치에 포함시키기 --%>
		<jsp:include page="servlet1_top.jsp"></jsp:include>
	</header>
	<hr>
	<main>
		<div align="center">
			<h1>회원 가입</h1>
			<!-- "JoinPro" 서블릿 주소 - JoinProServlet 클래스 매핑 -->
			<form action="JoinPro" method="post" name="joinForm">
				<table border="1">
					<tr>
						<th>이름</th>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>
							<input type="text" name="id" placeholder="4 ~ 8글자 사이 입력">
	<!-- 						<input type="button" value="ID중복확인" onclick="checkId()"> -->
							<input type="button" value="ID중복확인" id="btnCheckId" onclick="checkId()">
							<span id="checkIdResult"></span>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<input type="password" name="passwd" placeholder="8 ~ 16글자 사이 입력">
							<span id="checkPasswdResult"></span>
						</td>
					</tr>
					<tr>
						<th>비밀번호확인</th>
						<td>
							<input type="password" name="passwd2">
							<span id="checkPasswd2Result"></span>
						</td>
					</tr>
					<tr>
						<th>주민번호</th>
						<td>
							<!-- 입력 문자 갯수 제한 시 maxLength 속성 지정 -->
							<input type="text" name="jumin1" size="8" maxlength="6"> -
							<input type="text" name="jumin2" size="8" maxlength="7">
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>
							<input type="text" name="postCode" id="postCode" size="6">
							<input type="button" id="btnSearchAddress" value="주소검색">
							<br>
							<input type="text" name="address1" id="address1" size="25" placeholder="기본주소">
							<br>
							<input type="text" name="address2" id="address2" size="25" placeholder="상세주소">
						</td>
					</tr>
					<tr>
						<th>E-Mail</th>
						<td>
							<input type="text" name="email1" size="8"> @
							<input type="text" name="email2" size="8">
							<select name="emailDomain">
								<option value="">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="nate.com">nate.com</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>직업</th>
						<td>
							<select name="job">
								<option value="">항목을 선택하세요</option>
								<option value="개발자">개발자</option>
								<option value="DB엔지니어">DB엔지니어</option>
								<option value="서버엔지니어">서버엔지니어</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>성별</th>
						<td>
							<input type="radio" name="gender" value="남">남
							<input type="radio" name="gender" value="여">여
						</td>
					</tr>
					<tr>
						<th>취미</th>
						<td>
							<input type="checkbox" name="hobby" value="여행">여행
							<input type="checkbox" name="hobby" value="독서">독서
							<input type="checkbox" name="hobby" value="게임">게임
							<input type="checkbox" id="checkAllHobby" value="전체선택">전체선택
						</td>
					</tr>
					<tr>
						<th>가입동기</th>
						<td>
							<textarea rows="5" cols="40" name="motivation"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="가입">
							<input type="reset" value="초기화">
							<input type="button" value="돌아가기">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</main>
	<hr>
	<footer>
		회사설명......
	</footer>	
</body>
</html>