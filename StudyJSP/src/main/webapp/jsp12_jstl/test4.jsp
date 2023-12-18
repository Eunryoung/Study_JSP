<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="jsp11_jdbc_dao.StudentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// request 객체에 다음 데이터 저장
// 1) 속성명 : idx, 정수 데이터 3
// 2) 속성명 : name, 문자열 "홍길동"
request.setAttribute("idx", 3);
request.setAttribute("name", "홍길동");

// String 타입 배열 names 생성 및 이름("홍길동", "이순신", "강감찬") 저장 후
// request 객체에 속성명 "names" 로 배열 저장
String[] names = {"홍길동", "이순신", "강감찬"};
request.setAttribute("names", names);

// jsp11_jdbc_dao.StudentDTO 객체 생성 후 List 객체(studentList)에 추가하고 request 객체에 저장
List<StudentDTO> studentList = new ArrayList<StudentDTO>();
// StudentDTO student = new StudentDTO(1, "홍길동");
// studentList.add(student);
// StudentDTO 타입 변수 선언 없이 객체 생성 코드를 파라미터에 직접 기술하여 객체 즉시 전달
studentList.add(new StudentDTO(1, "홍길동"));
studentList.add(new StudentDTO(2, "이순신"));
studentList.add(new StudentDTO(3, "강감찬"));
request.setAttribute("studentList", studentList);

// test4_result.jsp 페이지로 포워딩
// => request 객체 유지하면서 다른 페이지로 포워딩하려면 Dispatch 방식 포워딩 필요
pageContext.forward("test4_result.jsp");
%>












