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
	<h1>test3_result.jsp - JSTL</h1>
	<%-- EL 문법을 활용하여 파라미터 name, age 값 출력 --%>
	<h3>
		파라미터 name 값 = ${param.name }<br>
		파라미터 age 값 = ${param.age }<br>
	</h3>
	<%-- 변수 num 선언 및 10 으로 초기화 후 EL 문법 활용하여 변수 num 값 출력 --%>
	<c:set var="num" value="10" />
	<h3>변수 num 값 = ${num }</h3>
	<hr>
	
	<%--
	[ 자바에서 가장 많이 사용하는 문장(조건문, 반복문)을 표현하는 JSTL 문법 ]
	----------------------------------------------------------------------------
	[ 조건문 - if(단일 if문) ]
	- <c:if></c:if> 태그 : if 문에 해당하는 커스텀 태그(단일 if문과 동일 = else 문 없음)
	- if 문의 조건식에 해당하는 문장을 test="" 속성 내에 EL 을 사용하여 표기
	< 기본 문법 >
	<c:if test="${조건식}">
		// 조건식 판별 결과가 true 일 때 실행할 문장들...
	</c:if>
	--%>
	<%-- 변수 num 의 값이 0 보다 클 경우 "0보다 크다!" 문장 출력하는 if 문 --%>
	<%
// 	if(num > 0) {
// 		out.println("0보다 크다!");
// 	}
	%>
	<c:if test="${num > 0 }">
		\${num } 값(${num }) 이 0보다 크다!<br>
	</c:if>
	
	<%-- 파라미터 age 값이 20보다 작을 경우 "20세 미만!" 출력 --%>
	<c:if test="${param.age < 20 }">
		나이(${param.age }) : 20세 미만!<br>
	</c:if>
	
	<%-- 파라미터 name 값이 비어있을 경우 "이름 입력 필수!" 출력 --%>
	<c:if test="${empty param.name }">
		<script type="text/javascript">
// 			alert("이름 입력 필수!");
// 			history.back();
		</script>
	</c:if>
	<hr>
	<%--
	[ <c:choose><c:when><c:otherwise> 태그 ]
	- 단일 if문 대신 if ~ else 또는 다중 else if 문에 해당하는 커스텀 태그
	- <c:choose> 태그를 사용하여 조건문이라는 표시를 하고
	  <c:when> 태그에서 test="" 속성을 통해 조건식을 지정(복수개의 조건은 c:when 태그 복수개 사용)
	  또한, <c:otherwise> 태그에서 조건식의 판별 결과가 모두 false 일 때 수행할 문장 기술
	  (= else 문과 동일한 기능을 수행하며, 생략 가능) 
	
	< 기본 문법 >
	<c:choose>
		<c:when test="${조건식1 }">
			// 조건식1 이 true 일 때 실행할 문장들...
		</c:when>
		<c:when test="${조건식n }">
			// 조건식n 이 true 일 때 실행할 문장들...
		</c:when>
		<c:otherwise>
			// 조건식이 모두 false 일 때 실행할 문장들... => 생략 가능
		</c:otherwise>
	</c:choose>
	--%>
	<%-- 변수 num 값에 대해 양수, 음수, 0 판별 --%>
	<c:set var="num" value="0" />
	<c:choose>
		<c:when test="${num > 0 }"> <%-- 양수 --%>
			<h3>\${num }(${num }) : 양수!</h3>
		</c:when>
		<c:when test="${num < 0 }"> <%-- 음수 --%>
			<h3>\${num }(${num }) : 음수!</h3>
		</c:when>
<%-- 		<c:when test="${num eq 0 }"> 0 (test="${num == 0 }" 동일) --%>
<%-- 			<h3>\${num }(${num }) : 0!</h3> --%>
<%-- 		</c:when> --%>
		<c:otherwise>
			<h3>\${num }(${num }) : 0! (c:otherwise)</h3>
		</c:otherwise>
	</c:choose>
	<hr>
	<h3>\${param.name } = ${param.name }</h3>
	<%--
	파라미터 name 값 판별 -> "홍길동", "이순신", 그 외 나머지 판별
	단, name 값이 비어있을 경우 자바스크립트로 "이름 입력 필수!" 출력 후 이전페이지로 돌아가기
	--%>
	<c:choose>
		<c:when test="${empty param.name }">
			<script type="text/javascript">
				alert("이름 입력 필수!");
				history.back();
			</script>
		</c:when>
		<c:when test="${param.name eq '홍길동' }">
			<h3>\${param.name} : 홍길동입니다!</h3>
		</c:when>
		<c:when test="${param.name eq '이순신' }">
			<h3>\${param.name} : 이순신입니다!</h3>
		</c:when>
		<c:otherwise>
			<h3>\${param.name} : 그 외 나머지입니다!</h3>
		</c:otherwise>
	</c:choose>
	
</body>
</html>














