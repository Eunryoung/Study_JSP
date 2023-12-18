<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// JSP 내장 객체 중 response 객체는 응답 정보를 관리하는 객체이며
// response 객체의 sendRedirect() 메서드를 호출하여
// 파라미터로 전달되는 페이지로 이동(리다이렉트) 가능
// => 기본 문법 : response.sendRedirect("이동할 URL 또는 파일명");
response.sendRedirect("responseTest2.jsp"); // responseTest2.jsp 페이지로 리다이렉트
/* 
서버가 응답하는 데이터에 리다이렉트가 포함될 경우
응답 데이터를 수신한 클라이언트 측에서 리다이렉트 대상 URL에 해당하는 주소를
다시 서버측으로 요청 정보에 포함하여 전송한다! (= 새로운 주소로 새로운 요청이 발생한다!)
=> 따라서, 이 응답 데이터를 클라이언트가 수신하는 즉시 새로운 요청이 발생하므로
   클라이언트 측에서는 responseTest1.jsp 페이지의 내용은 볼 수 없고
   리다이렉트 된 responseTest2.jsp 페이지의 내용을 최종적으로 볼 수 있게 된다!
*/
System.out.println("리다이렉트 완료!");
// 리다이렉트 코드가 포함되더라도 나머지 다른 자바 코드들은 서버에서 모두 실행되므로
// 이 메세지도 이클립스 콘솔에서 확인 가능하다!
// => 서버에서 모든 코드 실행 후에 응답 데이터가 클라이언트로 전송되기 때문
%>

<%-- 단, HTML 태그(또는 자바스크립트 등)은 클라이언트에서 실행되며 --%>
<%-- 응답 데이터에 포함된 리다이렉트 신호에 의해 responseTest2.jsp 페이지로 요청이 수행되므로 --%>
<%-- 아래 모든 HTML 요소들은 클라이언트에서 확인(실행) 불가능하다! --%>
<script>
	console.log("확인!");
	alert("확인!");
</script>