<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 다음 주소검색 API 사용을 위한 라이브러리 추가 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	window.onload = function() {
		let isSamePasswd = false; // 패스워드 일치 여부 저장할 변수
		
		// 1. ID 중복확인 버튼 클릭 시 새 창(check_id.html) 띄우기
		document.querySelector("#btnCheckId").onclick = function() {
			window.open("check_id.html", "id_check", "width=300,height=300");
		};
		
		// 2. 아이디 입력란에서 커서가 빠져나갈 때 아이디 길이 체크하기 => blur
		document.joinForm.id.onblur = function() {
			let id = document.joinForm.id.value; // 입력받은 아이디값 저장
			
			// 입력된 ID 텍스트의 길이가 4 ~ 8글자 사이일 경우 
			// 우측 빈공간(span 태그 영역)에 "사용 가능" 초록색으로 표시
		    // 아니면, "4~8글자만 사용 가능합니다" 빨간색으로 표시
		    if(id.length >= 4 && id.length <= 8) {
		     	document.querySelector("#checkIdResult").innerText = "사용 가능";
		     	document.querySelector("#checkIdResult").style.color = "green";
		    } else {
		     	document.querySelector("#checkIdResult").innerText = "4~8글자만 사용 가능합니다";
		     	document.querySelector("#checkIdResult").style.color = "red";
		    }
		};
		
		// 3. 비밀번호 입력란에 키를 누를때마다 비밀번호 길이 체크하기 = keyup
		document.joinForm.passwd.onkeyup = function() {
			let passwd = document.joinForm.passwd.value;
			
			// 비밀번호 길이 체크를 통해 8 ~ 16글자 사이이면 "사용 가능한 패스워드"(파란색) 표시,
			// 아니면, "사용 불가능한 패스워드"(빨간색) 표시
		    if(passwd.length >= 8 && passwd.length <= 16) {
		     	document.querySelector("#checkPasswdResult").innerText = "사용 가능한 패스워드";
		     	document.querySelector("#checkPasswdResult").style.color = "blue";
		    } else {
		     	document.querySelector("#checkPasswdResult").innerText = "사용 불가능한 패스워드";
		     	document.querySelector("#checkPasswdResult").style.color = "red";
		    }
			
		};
		
		// 4. 비밀번호확인 입력란에 키를 누를때마다 비밀번호와 같은지 체크하기
		document.joinForm.passwd2.onkeyup = function() {
			let passwd = document.joinForm.passwd.value;
			let passwd2 = document.joinForm.passwd2.value;
			
			// 비밀번호와 비밀번호확인 입력 내용이 같으면 "비밀번호 일치"(파란색) 표시,
   			// 아니면, "비밀번호 불일치"(빨간색) 표시
		    if(passwd == passwd2) { // 일치
		     	document.querySelector("#checkPasswd2Result").innerText = "비밀번호 일치";
		     	document.querySelector("#checkPasswd2Result").style.color = "blue";
		     	// 일치 여부를 저장하는 변수 isSamePasswd 값을 true 로 변경
		     	isSamePasswd = true;
		    } else { // 불일치
		     	document.querySelector("#checkPasswd2Result").innerText = "비밀번호 불일치";
		     	document.querySelector("#checkPasswd2Result").style.color = "red";
		     	// 일치 여부를 저장하는 변수 isSamePasswd 값을 true 로 변경
		     	isSamePasswd = false;
		    }
			
		};
		
		// 5. 주민번호 숫자 입력할때마다 길이 체크하기
		// => 주민번호 앞자리 입력란에 입력된 숫자가 6자리이면 뒷자리 입력란으로 커서 이동시키기
		// => 주민번호 뒷자리 입력란에 입력된 숫자가 7자리이면 뒷자리 입력란에서 커서 제거하기
		document.joinForm.jumin1.onkeyup = function() {
		    if(document.joinForm.jumin1.value.length == 6) {
		    	document.joinForm.jumin2.focus();
		    }
		};
		
		document.joinForm.jumin2.onkeyup = function() {
		    if(document.joinForm.jumin2.value.length == 7) {
		    	document.joinForm.jumin2.blur();
		    }
		};
		
		// 6. 이메일 도메인 선택 셀렉트 박스 항목 변경 시 = change
		//    선택된 셀렉트 박스 값을 이메일 두번째 항목(@ 기호 뒤)에 표시하기
		document.joinForm.emailDomain.onchange = function() {
			document.joinForm.email2.value = document.joinForm.emailDomain.value;
			
			// 단, 직접입력 선택 시 표시된 도메인 삭제하기
		    // 또한, "직접입력" 항목 외의 도메인 선택 시 도메인 입력창을 잠금처리 및 회색으로 변경하고,
		    // "직접입력" 항목 선택 시 도메인 입력창에 커서 요청 및 잠금 해제
		    if(document.joinForm.emailDomain.value == "") { // 직접 입력 선택 시
		    	document.joinForm.email2.focus(); // 포커스 요청
		    	document.joinForm.email2.readOnly = false; // 입력창 잠금 해제(readonly 아님!)
		    	document.joinForm.email2.style.background = "";
		    } else { // 도메인 선택 시
		    	document.joinForm.email2.readOnly = true; // 입력창 잠금 해제
		    	document.joinForm.email2.style.background = "lightgray";
		    }
		};
		
		// 7. 취미의 "전체선택" 체크박스 체크 시 취미 항목 모두 체크, 
		//    "전체선택" 해제 시 취미 항목 모두 체크 해제하기
		document.querySelector("#checkAllHobby").onclick = function() {
// 			document.joinForm.hobby[0].checked = document.querySelector("#checkAllHobby").checked;
// 			document.joinForm.hobby[1].checked = document.querySelector("#checkAllHobby").checked;
// 			document.joinForm.hobby[2].checked = document.querySelector("#checkAllHobby").checked;
		
			for(let i = 0; i < document.joinForm.hobby.length; i++) {
				document.joinForm.hobby[i].checked = document.querySelector("#checkAllHobby").checked;
			}
		};
		
		// 8. 가입(submit) 클릭 시 이벤트 처리를 통해
	    // 이름, 아이디, 비밀번호, 비밀번호확인, 주민번호, Email, 직업, 성별, 취미, 가입동기 항목을
	    // 모두 입력했는지 체크하고 모든 항목이 입력되었을 경우에만 submit 동작이 수행되도록 처리
		document.joinForm.onsubmit = function() {
			if(document.joinForm.name.value == "") {
				alert("이름 입력 필수!");
				document.joinForm.name.focus();
				return false; // submit 동작 취소
			} else if(document.joinForm.id.value == "") {
				alert("아이디 입력 필수!");
				document.joinForm.id.focus();
				return false; // submit 동작 취소
			} else if(document.joinForm.passwd.value == "") {
				alert("패스워드 입력 필수!");
				document.joinForm.passwd.focus();
				return false; // submit 동작 취소
			} else if(document.joinForm.passwd2.value == "") {
				alert("패스워드 확인 입력 필수!");
				document.joinForm.passwd2.focus();
				return false; // submit 동작 취소
// 			} else if(document.joinForm.passwd2.value != document.joinForm.passwd.value) {
// 				alert("패스워드 불일치!");
// 				document.joinForm.passwd2.focus();
// 				return false; // submit 동작 취소
			} else if(!isSamePasswd) { // 일치 여부 저장 변수 isSamePasswd 값 활용
				alert("패스워드 불일치!");
				document.joinForm.passwd2.focus();
				return false; // submit 동작 취소
			} else if(document.joinForm.jumin1.value == "") {
				alert("주민번호 입력 필수!");
				document.joinForm.jumin1.focus();
				return false; // submit 동작 취소
			} else if(document.joinForm.jumin2.value == "") {
				alert("주민번호 입력 필수!");
				document.joinForm.jumin2.focus();
				return false; // submit 동작 취소
			} else if(document.joinForm.email1.value == "") {
				alert("이메일 주소 입력 필수!");
				document.joinForm.email1.focus();
				return false; // submit 동작 취소
			} else if(document.joinForm.email2.value == "") {
				alert("이메일 주소 입력 필수!");
				document.joinForm.email2.focus();
				return false; // submit 동작 취소
			} else if(document.joinForm.job.value == "") {
				alert("직업 선택 필수!");
				document.joinForm.job.focus();
				return false; // submit 동작 취소
			} else if(document.joinForm.gender.value == "") {
				alert("성별 선택 필수!");
				return false; // submit 동작 취소
			} else if(!document.joinForm.hobby[0].checked && !document.joinForm.hobby[1].checked && !document.joinForm.hobby[2].checked) {
				// 취미는 모든 체크박스 체크상태가 false 일 때 체크 요청 메세지 출력
				alert("취미 선택 필수!");
				return false; // submit 동작 취소
			} else if(document.joinForm.motivation.value == "") {
				alert("가입동기 입력 필수!");
				document.joinForm.motivation.focus();
				return false; // submit 동작 취소
			}
			
			return true; // submit 동작 수행(생략 가능)
		};
		
		// =====================================================================
		// 주소 검색 API 활용 기능 추가
		// "t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js" 스크립트 파일 로딩 필수!
		document.querySelector("#btnSearchAddress").onclick = function() {
			new daum.Postcode({
				//
				//
		        oncomplete: function(data) {
					// 클릭(선택)된 주소에 대한 정보(객체)가 익명함수 파라미터 data에 전달됨
					// => data.xxx 형식으로 각 주소 정보에 접근
					// 1) 우편번호(zonecode) 가져와서 우편번호(postCode) 항목에 출력
					document.joinForm.postCode.value = data.zonecode;
					// 2) 기본주소(address) 가져와서 기본주소(address1) 항목에 출력
// 					document.joinForm.address1.value = data.address;
					let address = data.address;
					
					// 만약, 건물명(buildingName)이 존재할 경우(널스트링이 아님)
					// 기본주소 뒤에 건물명을 결합
					if(data.buildingName != "") {
						address += "(" + data.buildingName + ")";
					}
					document.joinForm.address1.value = address;
					
					
					// 3) 상세주소 항목(address2)에 포커스(커서) 요청
					document.joinForm.address2.focus();
					
					// 
		        }
		    }).open();
		};
		
	};
</script>
</head>
<body>	
	<div align="center">
		<h1>회원 가입</h1>
		<form action="request3Pro.jsp" method="post" name="joinForm">
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
</body>
</html>















