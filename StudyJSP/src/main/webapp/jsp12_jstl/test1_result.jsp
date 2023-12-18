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
	<h1>test1_result.jsp</h1>
	<%-- 기존 자바 코드를 활용한 파라미터(name, age) 및 세션 객체 속성값(testValue) 처리 --%>
	<%
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	
	String sessionValue = (String)session.getAttribute("testValue"); 
	
	// session 객체에 저장된 StudentDTO 객체를 "student" 속성명으로 접근하여 가져오기
	StudentDTO student = (StudentDTO)session.getAttribute("student");
	%>
	<h3>
		이름 : <%=name %><br>
		나이 : <%=age %><br>
		세션값 : <%=sessionValue %><br> 
		Student 객체의 idx 값 : <%=student.getIdx() %><br>
		Student 객체의 name 값 : <%=student.getName() %>
	</h3>
	<hr>
	<h3>
		이름 : <%=request.getParameter("name") %><br>
		나이 : <%=request.getParameter("age") %><br>
		<%-- 파라미터는 존재하지만 값이 없는 경우 널스트링("") 출력됨 --%>
		주민번호 : <%=request.getParameter("jumin") %><br>
		<%-- 파라미터 자체가 존재하지 않는 경우 null 출력됨 --%>
		점수 : <%=request.getParameter("score") %><br>
		세션값 : <%=session.getAttribute("testValue") %> <br>
		Student 객체의 idx 값 : <%=student.getIdx() %><br>
		Student 객체의 name 값 : <%=student.getName() %>
	</h3>
	<hr>
	<%--
	< EL(Expression Language) >
	- JSP 스크립트 태그(= 표현식 <%=%>) 대신 사용 가능한 데이터 처리 표현 방식(언어)
	  (단, JSP 페이지에서만 사용 가능함)
	- JSP 스크립트 태그는 다른 일반 태그(<>)와 혼동을 가져올 수 있지만
	  EL 은 이러한 단점을 보완
	- 기본 표기법 : ${데이터}   =>  <%=%> 기호를 ${} 기호로 변경
	  ex) test 다른 변수 값을 EL 로 표현할 경우 ${test} (표현식은 <%=test%>)
	- 변수값만 지정 가능한 것이 아니라 내장 객체 및 연산자도 제공됨
	  1) 이전 페이지로부터 전달받은 request 객체의 파라미터(URL 파라미터 포함) 접근 시
	     => ${param.파라미터명}
	  2) 각 영역 객체 의 속성 접근 시
	     => ${영역객체명.속성명}   
	     => EL 에서 내장된 영역 객체명 : pageScope, requestScope, sessionScope, applicationScope
	- EL 문장을 데이터로서 취급해야할 경우(= 파싱되지 않고 문자열 자체로 사용할 경우)
	  $ 기호 앞에 \(백슬래시) 기호를 붙여서 표기하면 해당 문장은 단순 텍스트로 취급됨
	  ex) ${name} 을 단순 텍스트로 취급 시 \${name} 으로 표현하면 그대로 화면에 출력됨
	- request 객체 등을 통해 DTO 객체 등을 저장한 후 사용할 때
	  DTO 객체에 접근하는 코드를 ${객체명.변수명} 형태로 접근이 가능하며
	  변수에 직접 접근하는 것처럼 보이지만 실제로는 getXXX() 메서드를 호출하도록 구성되어 있음
	  따라서, DTO 클래스 정의 시 멤버변수 선언 및 Getter 메서드 정의 필수!
	- ${} 내에 잘못된 값을 입력하더라도 param.xxx 이 존재하지 않을 경우 널스트링 출력되고
	  객체 내의 속성이 존재하지 않을 경우 오류 발생
	--%>
	<h3>
		<%-- EL 을 사용하여 request 객체 내의 파라미터 처리(내장객체 param 활용) --%>
		<%-- ${param.파라미터명} 형식으로 접근 --%>
		이름 : ${param.name }<br> <%-- <%=request.getParmeter("name")%> 코드 대체 --%>
		나이 : ${param.age }<br> <%-- <%=request.getParmeter("age")%> 코드 대체 --%>
		<%-- 파라미터에 값이 없을 경우 널스트링("") 출력됨 --%>
		주민번호 : ${param.jumin }<br>
		<%-- 존재하지 않는 파라미터 접근 시 오류 발생(또는 null) 대신 널스트링("") 출력됨  --%>
		점수 : ${param.score }<br>
		<%-- EL 을 사용하여 session 객체의 속성 처리(내장객체 sessionScope 활용) --%>
		세션의 testValue 값 : ${sessionScope.testValue }<br> <%-- <%=session.getAttribute("testValue")%> 코드 대체 --%>
		<%-- 세션 객체 내에 Student 객체를 통해 멤버변수값 접근 --%>
		<%-- 주의! Getter 메서드명이 아니라, 멤버변수명 지정(단, 내부적으로는 멤버변수가 호출됨) --%>
		세션의 Student 객체의 idx 값 : ${sessionScope.student.idx }<br>
		세션의 Student 객체의 name 값 : ${sessionScope.student.name }
		<%-- 객체 내에 존재하지 않는 멤버에 접근 시 오류 발생함 --%>
<%-- 		세션의 Student 객체의 jumin 값 : ${sessionScope.student.jumin } --%>
	</h3>
	<hr>
	<h3>
		<%-- EL 사용 시 EL 문장을 단순 문자열로 취급하려면 \${} 형태로 기술 --%>
		\${param.name } : ${param.name }<br>
		\${param.age } : ${param.age }<br>
		\${param.jumin } : ${param.jumin }<br> <%-- 값이 없으므로 널스트링 --%>
		\${param.score } : ${param.score }<br> <%-- 파라미터가 없으므로 널스트링 --%>
		\${sessionScope.testValue } : ${sessionScope.testValue }<br>
	</h3>
	<hr>
	<h3>
		<%-- EL 의 연산자 활용 --%>
		\${10 + 20 } = ${10 + 20 }<br>	
		<%-- 파라미터 값 등을 사용한 연산식 작성도 가능 --%>
		<%-- 수치데이터의 경우 별도의 형변환 없이도 연산 가능 --%>
		\${param.age + 20 } = ${param.age + 20 }<br>
<%-- 		<%=request.getParameter("age") + 20 %> --%> <%-- String + int 이므로 2020 출력됨 --%>
		<%-- 관계(비교)연산자는 기호 또는 기호에 대응하는 이름을 연산자로 사용 가능 --%>
		\${10 >= 20 } = ${10 >= 20 }<br>	
		\${10 ge 20 } = ${10 ge 20 }<br>	
		\${10 == 20 } = ${10 == 20 }<br>	
		\${10 eq 20 } = ${10 eq 20 }<br>	
		<br>
		<%-- 비어있는 값(null 또는 널스트링) 판별 시 eq 연산자를 통해 판별 가능 --%>
		\${param.name eq null } = ${param.name eq null }<br> <%-- false --%>
		<%-- 같지 않음을 판별 시 ne 연산자 사용 --%>
		\${param.name ne null } = ${param.name ne null }<br> <%-- true --%>
		
		<%-- 파라미터는 존재하고 값이 없는 경우 null 이 아니므로 false --%>
		\${param.jumin eq null } = ${param.jumin eq null }<br> <%-- false --%>
		<%-- 파라미터는 존재하고 값이 없는 경우 널스트링이므로 true --%>
		\${param.jumin eq "" } = ${param.jumin eq "" }<br> <%-- true --%>
		
		<%-- 파라미터 자체가 존재하지 않으므로 null 이기 때문에 true --%>
		\${param.score eq null } = ${param.score eq null }<br> <%-- true --%>
		
		<%-- empty 연산자 사용 시 null, 널스트링, 컬렉션 사이즈 0 등 값이 비어있음을 판별 가능 --%>
		<%-- empty 연산자는 단항연산자이므로 대상의 앞에 기술 --%>
		\${empty param.name } = ${empty param.name }<br> <%-- false --%>
		\${empty param.jumin } = ${empty param.jumin }<br> <%-- true(널스트링) --%>
		\${empty param.score } = ${empty param.score }<br> <%-- true(null) --%>
		<%-- 논리연산자 중 not 연산자를 empty 연산자와 결합 시 비어있지 않음을 판별 --%>
		\${not empty param.name } = ${not empty param.name }<br> <%-- true --%>
	</h3>
</body>
</html>














