<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
JSTL(JSP Standard Tag Library)
- JSP 에서 사용 가능한 커스텀 태그 라이브러리
  => JSP 에서 사용하는 문장을 태그 형식으로 제공
  => JSTL Core 라이브러리 : JSTL 의 기본 핵심 기능 제공(조건문, 반복문, 변수 설정 및 출력 등)
- JSTL 기능을 사용하려면 해당 라이브러리 다운로드(tomcat.apache.org - Taglibs) 후 Build path 추가 필요
  또한, 등록된 JSTL 라이브러리를 실제로 적용하려면 반드시 <%@taglib %> 디렉티브를 사용하여
  현재 문서에 등록 필수(prefix 값과 uri 정보 설정)
  => prefix : 태그에서 사용할 문구(접두어) 를 지정하며, 주로 Core 의 약자 c 를 사용
              (JSTL 태그 사용 시 접두어 c 를 활용하여 <c:xxx> 형식의 태그 사용 가능)
  => uri : 태그 라이브러리 문법이 존재하는 위치를 지정
 --%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test2.jsp - JSTL</h1>
	<%--
	<c:set> 태그를 사용하여 변수 설정
	- var 속성에 변수명, value 속성에 변수값 지정
	- scope 속성을 사용하여 변수의 유효범위 지정 가능하며, 생략 시 기본값 page
	  (page 속성 : 현재 페이지에서만 유효)
	- 생성(선언)된 변수는 EL 을 통해 접근(출력)도 가능함. 또한 <c:out> 태그로도 접근 가능 
	--%>
<%-- 	<c:set var="" value=""></c:set> --%>
	<%-- <c:set></c:set> 사이에 내용이 없으므로 <c:set /> 형태로 표기 가능 --%>
	<c:set var="str" value="Hello, World!" />
	<%-- 위에서 선언된 변수 str 을 EL 문법으로 출력(사용) 가능(${변수명}) --%>
	<h3>\${str } = ${str }</h3>
	<h3>\${str } 값이 비어있는가? ${empty str }</h3>
	<%-- c:set 태그로 생성된 변수는 자바의 스크립트 요소를 통해 접근 불가! --%>
<%-- 	<h3>\${str } = <%=str %></h3> --%>
	<%-- 단, 각 영역에 저장된 변수를 영역 객체를 통해 접근 할 수는 있다! --%>
	<h3>pageContext.getAttribute("str") = <%=pageContext.getAttribute("str") %></h3>
	<%--
	자바 코드로 생성(선언)한 변수를 JSTL(EL) 에서 기본적으로 접근 불가!
	따라서, 자바 코드로 생성한 변수를 접근하기 위해
	1. 선언된 변수를 각 영역 객체의 속성값으로 저장 후 접근
	   ex) pageContext.setAttribute("xxx");  =>  ${pageScope.xxx}
	       단, 각 영역객체명 생략 가능함(좁은 범위(page) -> 넓은 범위(application) 방향으로 탐색)
	2. <c:set> 태그로 JSTL 에서 변수 선언 시 값(value 속성)에 표현식을 사용하여 값 전달
	   ex) <c:set var="x" value="<%=xxx%>" /> 
	--%>
	<%
	String str2 = "Hello, World2!";
	pageContext.setAttribute("str2", str2);
	request.setAttribute("requestStr2", "request str2");
	%>
	<h3>\${str2 } = ${str2 }</h3>
	<h3>\${requestStr2 } = ${requestStr2 }</h3>
	
	<c:set var="str3" value="<%=str2 %>" />
	<h3>\${str3 } = ${str3 }</h3>
	<hr>
	
	<%-- <c:out> 태그를 사용하여 변수값 출력 가능 = 표현식과 기능 동일 --%>
	<c:out value="${str }" /> <%-- 변수 지정 시 EL 필요 --%>
	<hr>
	
	<%-- <c:remove> 태그를 사용하여 변수값 삭제 --%>
	<%-- 주의! var 속성에 변수명만 지정(EL 표기법 X) --%>
	<c:remove var="str"/>
	<h3>\${str } 변수값 삭제 후 = ${str }</h3>
	<h3>\${str } 변수값이 비어있는가? ${empty str }</h3>
	
</body>
</html>










