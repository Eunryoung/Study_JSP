<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>forwardPro.jsp</h1>
	<%
	// forwardForm.jsp 페이지에서 전달받은 파라미터 가져와서 변수에 저장 후 출력
	// 단, POST 방식 요청일 때 한글 등의 파라미터 표시를 위해
	// request.setCharacterEncoding() 메서드를 호출하여 인코딩 방식을 "UTF-8" 변경 필요
	// => 주의! 파라미터 접근하기 전에 인코딩 변경 필요
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	// input type="hidden" 타입으로 전달받은 파라미터도 동일한 방식으로 접근
	String jumin = request.getParameter("jumin");
	
	// forward 액션태그의 param 액션태그에 포함시켜 전달할 데이터를 변수에 저장
	int age = 25;
	%>
	<h3>아이디 : <%=id %></h3>
	<h3>패스워드 : <%=passwd %></h3>
	<h3>이름 : <%=name %></h3>
	<h3>저장 : <%=jumin %></h3>
	<%--
	===================================================================================
	jsp:forward 액션 태그를 사용하여 "forwardPro2.jsp" 페이지로 포워딩 수행
	=> pageContext.forward() 메서드와 동일한 작업(해당 메서드를 태그로 제공)
	=> Dispatch(디스패치) 방식의 포워딩을 수행하므로
	   주소표시줄의 주소(URL)가 변경되지 않고, request 객체도 유지됨
	   (=> 이동된 페이지에서도 이전 request 객체의 속성 및 파라미터에 접근 가능함)
	=> 만약, 포워딩 과정에서 추가적인 파라미터 전달이 필요할 경우
	   <jsp:forward></jsp:forward> 태그 사이에 <jsp:param> 태그를 사용하여 파라미터 저장
	--%>
<%-- 	<%pageContext.forward("forwardPro2.jsp"); %> --%>
<%-- 	<jsp:forward page="forwardPro2.jsp"></jsp:forward> --%>
<%-- 	<jsp:forward page="forwardPro2.jsp"> --%>
<%-- 		<jsp:param name="paramValue1" value="forward 액션태그의 param 태그 데이터"/> --%>
<%-- 		<jsp:param name="paramValue2" value="<%=age %>"/> --%>
<%-- 	</jsp:forward> --%>

	<%-- jsp:forward 액션태그에서 파라미터 전달 시 URL 뒤에 파라미터 연결도 가능하다! --%>
	<jsp:forward page="forwardPro2.jsp?paramValue1=forward 액션태그의 param 태그 데이터&paramValue2=<%=age %>"></jsp:forward>
</body>
</html>