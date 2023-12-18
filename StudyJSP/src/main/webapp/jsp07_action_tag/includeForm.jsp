<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>includeForm.jsp</h1>
	<hr>
	<%-- pageContext 객체의 include() 메서드로 includePro.jsp 페이지 포함시키기 --%>
<%-- 	<%pageContext.include("includePro.jsp"); %> --%>
	
	<%-- includePro.jsp 페이지를 jsp:include 액션태그로 포함시키기 --%>
<%-- 	<jsp:include page="includePro.jsp"></jsp:include> --%>
	
	<%-- includePro.jsp 페이지를 포함시킬 때, 포함되는 페이지에서 사용할 파라미터 전달 --%>
	<%-- <jsp:include></jsp:include> 태그 사이에 <jsp:param> 태그 사용 --%>
	<jsp:include page="includePro.jsp">
		<jsp:param name="paramValue" value="Parameter Value"/>
	</jsp:include>


	<%-- jsp:include 액션태그에서  파라미터 전달 시 URL 뒤에 파라미터 연결이 불가능하다! --%>
	<%-- 지정된 모든 문자열은 포함시킬 페이지의 파일명으로 인식하므로 오류 발생! --%>
<%-- 	<jsp:include page="includePro.jsp?paramValue=ParameterValue"></jsp:include> --%>

	<%-- pageContext.include() 메서드 호출 시 URL 뒤에 파라미터 연결 가능 --%>
	<%pageContext.include("includePro.jsp?paramValue=ParameterValue"); %>

	<%-- --------------------------------------------------------------------------- --%>
<%-- 	include 디렉티브(@ include) 사용하여 동일한 작업(페이지 포함) 가능  --%>
	<%@ include file="includePro.jsp" %>
	
	<%-- 주의! include 디렉티브도 URL 뒤에 파라미터 전송이 불가능하다! --%>
<%-- 	<%@ include file="includePro.jsp?paramValue=ParameterValue" %> --%>
	
</body>
</html>