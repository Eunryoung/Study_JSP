<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h1>jdbc_main.jsp</h1>
		<hr>
		<!-- jsp09_jdbc/JdbcConnectMainServlet 서블릿 클래스 <-> "JdbcConnectMain" 서블릿 주소 매핑 -->
		<!-- jsp09_jdbc/JdbcConnect1Servlet 서블릿 클래스 <-> "JdbcConnect1" 서블릿 주소 매핑 -->
		<!-- jsp09_jdbc/JdbcConnect2Servlet 서블릿 클래스 <-> "JdbcConnect2" 서블릿 주소 매핑 -->
		<!-- jsp09_jdbc/JdbcConnect3Insert 서블릿 클래스 <-> "JdbcConnect3_INSERT" 서블릿 주소 매핑 -->
		<!-- jsp09_jdbc/JdbcConnect3Update 서블릿 클래스 <-> "JdbcConnect3_UPDATE" 서블릿 주소 매핑 -->
		<!-- jsp09_jdbc/JdbcConnect3Delete 서블릿 클래스 <-> "JdbcConnect3_DELETE" 서블릿 주소 매핑 -->
		<!-- jsp09_jdbc/JdbcConnect3Select 서블릿 클래스 <-> "JdbcConnect3_SELECT" 서블릿 주소 매핑 -->
		<h3><a href="JdbcConnect1">JDBC 연동 1단계</a></h3> <!-- http://localhost:8080/StudyJSP/JdbcConnect1 -->
		<h3><a href="JdbcConnect2">JDBC 연동 2단계</a></h3>
		<h3><a href="JdbcConnect3_INSERT">JDBC 연동 3&4단계 - INSERT</a></h3>
		<h3><a href="JdbcConnect3_UPDATE">JDBC 연동 3&4단계 - UPDATE</a></h3>
		<h3><a href="JdbcConnect3_DELETE">JDBC 연동 3&4단계 - DELETE</a></h3>
		<h3><a href="JdbcConnect3_SELECT">JDBC 연동 3&4단계 - SELECT</a></h3>
	</div>
</body>
</html>