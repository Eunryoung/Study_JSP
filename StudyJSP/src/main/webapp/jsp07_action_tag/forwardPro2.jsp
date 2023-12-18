<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>forwardPro2.jsp</h1>
	<%
	// forwardForm.jsp 페이지에서 입력받은 데이터를 forwardPro.jsp 페이지로 전달한 후
	// 다시 디스패치 방식의 포워딩으로 현재 페이지로 이동했을 때
	// 이전의 request 객체가 그대로 유지되므로 기존 데이터에 접근이 가능하다!
	// => 이 때, 이전 페이지(forwardPro.jsp)에서 한글 인코딩 방식을 변경했으며
	//	  해당 request 객체가 공유되었으므로 현재 페이지에서 다시 인코딩 방식 변경할 필요 X
	// ----------------------------------------------------------------------------
	// 아이디, 패스워드, 이름, 주민번호 변수에 저장 후 출력
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	// => name 파라미터값이 한글이지만 이전페이지에서 인코딩 방식 변경했으므로 정상 출력
	String jumin = request.getParameter("jumin");
	
	
	// forwardPro.jsp 페이지에서 <jsp:param> 액션태그로 전달된 데이터 가져오기 = 접근 방법 동일
	String paramValue1 = request.getParameter("paramValue1");
	String paramValue2 = request.getParameter("paramValue2");
	%>
	<h3>아이디 : <%=id %></h3>
	<h3>패스워드 : <%=passwd %></h3>
	<h3>이름 : <%=name %></h3>
	<h3>주민번호 : <%=jumin %></h3>	
	
	<%-- forward 액션태그 내의 param 태그로 전달받은 파라미터 값 출력 --%>
	<h3>paramValue1 : <%=paramValue1 %></h3>	
	<h3>paramValue2 : <%=paramValue2 %></h3>	
	
</body>
</html>