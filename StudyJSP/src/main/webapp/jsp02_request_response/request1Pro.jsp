<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>request1Pro.jsp - 요청 파라미터 처리</h1>
	<%
	/*
	requestForm1.jsp 페이지에서 submit 버튼 클릭 시
	form 태그 내의 데이터(= 폼 파라미터)가 request 객체에 모두 저장되고
	action 속성에 지정된 페이지로 이동(= 페이지를 요청)하면서 데이터 전달함
	=> 요청 관련 모든 정보는 request 객체가 관리(= JSP 가 자동으로 생성하는 객체 = 내장 객체)
	   따라서, request.메서드명() 형태로 request 객체의 메서드 호출하여 객체 다루기 가능
	=> 요청받은 request 객체에 저장된 폼 파라미터 데이터를 가져오는 방법
	   1) request.getParameter("파라미터명"); // 단일 파라미터 데이터 가져오기 = String 리턴
	   2) request.getParameterValues("파라미터명"); // 복수 항목 파라미터 가져오기 
	      = String[] 리턴(주로, checkbox 처럼 하나의 이름으로 복수개의 파라미터 전달할 경우 사용)
	=> 주의! 지정된 파라미터가 존재하지 않을 경우(지정한 이름이 없을 경우) null 값이 리턴되고,
	   파라미터는 있으나 데이터가 없는 경우에는 널스트링("") 값이 리턴됨
	*/	
	// -----------------------------------------------------------------------
	// [ POST 방식으로 요청을 수행할 경우 한글 파라미터에 대한 처리 방법 ]
	// - GET 방식일 경우 JSP 문서의 page 디렉티브(또는 meta 태그)에 UTF-8 지정하면 되지만
	//   POST 방식일 경우 request 객체에 대해 한글 인코딩 방식 지정을 별도로 수행해야 한다!
	// - 반드시 응답 데이터 생성하는 페이지(request 객체를 통해 데이터 가져오는 페이지)에서
	//	 인코딩 방식 지정을 위한 메서드를 호출해야한다!
	// => request 객체의 setCharacterEncoding() 메서드를 호출하여 "UTF-8" 전달
	request.setCharacterEncoding("UTF-8");
	// => 단, 반드시 파라미터값을 가져오는 코드(getParameter() 메서드 등) 보다 먼저 수행 필수!
	// -----------------------------------------------------------------------
	// 1. 폼 파라미터 중 파라미터명(name 속성값)이 "name"인 파라미터 값을 가져와서
	//	  String 타입 변수 strName에 저장 후 웹브라우저에 출력
	String strName = request.getParameter("name");
	// 스크립틀릿 내부에서 브라우저에서 데이터 출력 시 out.print() 메서드 사용
// 	out.print("이름 : " + strName + "<br>");
	
	// 2. 폼 파라미터 중 파라미터명(name 속성값)이 "age"인 파라미터 값을 가져와서
	//	  String 타입 변수 strAge에 저장 후 웹브라우저에 출력
	String strAge = request.getParameter("age");
// 	out.print("나이 : " + strAge + "<br>");
	
	
	// 3. 폼 파라미터 중 파라미터명(name 속성값)이 "gender"인 파라미터 값을 가져와서
	//	  String 타입 변수 strGender에 저장 후 웹브라우저에 출력
	// => 라디오버튼은 복수개의 요소 중 하나의 선택된 요소(단일 요소)에 대한 value 값만 전달됨
	String strGender = request.getParameter("gender");
// 	out.print("성별 : " + strGender + "<br>");

	// 4. 파라미터명이 "hobby"인 파라미터 값 가져와서 String 타입 strHobby에 저장
// 	String strHobby = request.getParameter("hobby");
// 	out.print("취미 : " + strHobby + "<br>");
	// => 주의! 복수개의 데이터가 하나의 파라미터명으로 전달되는 경우(e.g. 체크박스)
	// 	  getParameter() 메서드 사용 시 하나의 데이터(첫번째 데이터)만 리턴됨
	//	  따라서, getParameter() 메서드 대신 getParameterValues() 메서드를 호출하여
	//	  복수개의 동일한 이름의 파라미터를 String[] 타입으로 리턴받아 처리해야함
	String[] arrHobby = request.getParameterValues("hobby");
// 	out.print("취미 : " + arrHobby + "<br>");
	// Arrays 클래스의 static 메서드 toString() 메서드를 호출하여 배열 내의 요소 출력 가능  
// 	out.print("취미 : " + Arrays.toString(arrHobby) + "<br>");
	%>
	<table border="1">
		<tr>
			<th>이름</th>
			<td><%=strName %></td>
		</tr>
		<tr>
			<th>나이</th>
			<td><%=strAge %></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><%=strGender %></td>
		</tr>
		<tr>
			<th>취미</th>
			<td>
<%-- 				<%=Arrays.toString(arrHobby) %> --%>
				<%-- arrHobby 배열에 직접 접근하여 최대 3개의 데이터 출력하기 --%>
<%-- 				<%=arrHobby[0] %> <%=arrHobby[1] %> <%=arrHobby[2] %> --%>
				<%--
				주의! 배열 크기(체크박스 체크 항목)가 3개 미만일 경우
				배열 인덱스 직접 지정을 통한 접근 시 오류 발생의 가능성이 있음!
				(java.lang.ArrayIndexOutOfBoundsException: Index 2 out of bounds for length 2)
				(=> 배열 크기가 2인 배열에 인덱스 2가 범위를 벗어남)
				=> 배열 접근 시 for문을 사용하여 배열 크기만큼 반복 접근이 안전하다!
				-------------------------------------------------------
				또는, 체크박스를 하나도 체크하지 않으면 배열이 존재하지 않으므로(null)
				NullPointerException 이라는 오류(예외)가 발생한다!
				--%>
				<%
				// 일반 for문을 활용한 배열 접근 후 out.print() 메서드로 데이터 출력
// 				for(int i = 0; i < arrHobby.length; i++) {
// 					out.print(arrHobby[i] + " ");
					
					// 또는 변수에 배열을 저장해 출력
// 					String hobby = arrHobby[i];
// 					out.print(hobby + " ");
// 				}
				
				// 향상된 for문을 활용한 배열 접근
				// for문 내의 콜론(:) 우변에 배열명을 기술하고, 좌변에 변수 선언 시
				// 배열 내의 요소를 차례대로 반복하면서 좌변의 변수에 배열 데이터 저장 반복됨
// 				for(String hobby : arrHobby) {
// 					out.print(hobby + " ");
					// => 위의 일반 for문의 변수에 배열을 저장해 출력한 방식과 같은 원리!
// 				}
				
				// 주의! for문을 사용하더라도 null 값일 경우 NullPointerException 오류 발생!
				// 따라서, 안전한 처리를 위해서는 배열이 null 값이 아닐 경우에만 반복 수행해야함
				if(arrHobby != null) { // 체크박스 항목을 하나라도 체크했을 경우
					// 배열이 null이 아니므로 안전하게 처리 가능
					for(int i = 0; i < arrHobby.length; i++) {
						out.print(arrHobby[i] + " ");
					}
				} else { // arrHobby == null (체크박스 항목을 하나도 체크하지 않았을 경우)
// 					out.print("없음");
				
					// 자바스크립트를 사용하여 "취미 선택 필수!" 출력 후 이전페이지로 돌아가기
					%>
					<script>
						alert("취미 선택 필수!");
						history.back();				
					</script>
					<%	
				}
				%>
			</td>
		</tr>
	</table>
</body>
</html>