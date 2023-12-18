package jsp08_servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
// 매핑된 JSP 파일을 실행하는 것이 아니라 Run As를 통해 현재 서블릿 클래스 파일을 직접 실행!
// 주소창에 직접 주소를 입력하는 것과 유사하다!(GET 방식)
// => 지정된 서블릿 주소를 포함하는 JSP 파일이 존재하지 않는다!
// --------------------------------------------------------------------
// 단, 현재 서블릿 클래스 파일(MainServlet.java)을 Run As로 실행시킨 후 
// HOME, 로그인, 회원가입 하이퍼링크를 누르면 404 오류 발생!
//		=> HTTP 상태 404 – 찾을 수 없음
// 		=> 파일 [/servlet1_main.jsp]을(를) 찾을 수 없습니다.
// 		=> 파일 [/servlet1_loginForm.jsp]을(를) 찾을 수 없습니다.
// 		=> 파일 [/servlet1_joinForm.jsp]을(를) 찾을 수 없습니다.
// => 오류 발생 원인 : 현재 서블릿의 주소는 매핑 어노테이션에서 컨텍스트루트/리소스의 형태로 설정했고
// 					   하단에서 디스패치 방식으로 포워딩을 실행했기 때문에
// 					   최종 주소는 컨텍스트루트/리소스의 형태로 유지된다!
// 					   servlet1_top.jsp 파일 내의 <a> 태그의 href 속성값에는 
//					   각각 "servlet1_main.jsp", "servlet1_loginForm.jsp", "servlet1_joinForm.jsp"가 지정되어 있으므로
// 					   현재 서블릿 주소가 컨텍스트루트/리소스인 상태에서 하이퍼링크를 누를 시
//  				   주소가 컨텍스트루트/servlet1_main.jsp 등의 형태로 바뀌게 되어
// 					   중간의 디렉토리 구조가 생략되어 파일을 찾을 수 없어 404 오류 발생!
// => 해결방법 : 하이퍼링크를 클릭해 페이지 이동을 수행해야 한다면 
// 				 현재 서블릿 클래스파일을 Run As로 실행하지 않고
//				 servlet1_main.jsp 파일을 ctrl + F11로 실행해 하이퍼링크를 이용하도록 한다!
// => 주의! servlet1_main.jsp 파일을 실행해 로그인을 수행한 후 세션이 남아있는 상태에서 
// 	  현재 서블릿 클래스 파일을 Run As로 실행한 후 HOME, 로그아웃, 관리자 페이지 하이퍼링크 클릭 시
// 	  같은 404 오류가 발생하므로 하이퍼링크를 이용해야할 경우에는 servlet1_main.jsp 파일을 실행하도록 한다!


@WebServlet("/ServletMain") // http://localhost:8080/StudyJSP/ServletMain
//@WebServlet("/jsp08_servlet/ServletMain") // http://localhost:8080/StudyJSP/jsp08_servlet/ServletMain
public class MainServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MainServlet");
		
		// "jsp08_servlet/servlet1_main.jsp" 페이지 포워딩
		// ----------------------------------------------------------
		// [ Dispatch vs Redirect 방식 ]
		// 1) Redirect 방식
		// => request 객체의 sendRedirect() 메서드 활용
		// => 처음 요청 주소가 아닌 새 요청 주소(URL)로 변경됨
		
		// 만약, 요청 주소(URL)가 http://localhost:8080/StudyJSP/ServletMain 일 경우
		// 컨텍스트 루트(StudyJSP)가 webapp 디렉토리를 가리키므로 현재 경로는 webapp 디렉토리이다.
		// 따라서, 대상 파일 지정 시 디렉토리 구조 지정 생략 후 파일명만 지정 시
		// 해당 파일이 webapp 디렉토리에 위치한 것으로 간주함
//		response.sendRedirect("servlet1_main.jsp"); // webapp/servlet1_main.jsp 가리킴
		// => 해당 경로 상에 파일이 존재하지 않으므로 404 오류 발생
		
		// 결국, 현재 경로(webapp)의 서브디렉토리(jsp08_servlet)에 대상 파일이 존재하므로
		// 서브디렉토리명까지 모두 명시해야한다!
//		response.sendRedirect("jsp08_servlet/servlet1_main.jsp");
		// => http://localhost:8080/StudyJSP/jsp08_servlet/servlet1_main.jsp
		// -------------------------------------------------------------------------------
		// 만약, 요청 주소(URL)가 http://localhost:8080/StudyJSP/jsp08_servlet/ServletMain 일 경우
//		response.sendRedirect("servlet1_main.jsp");
		// 서브디렉토리 구조가 URL 에 포함되어 있으므로 servlet1_main.jsp 파일명만 명시
		// => 현재 위치가 StudyJSP/jsp08_servlet 이므로 webapp/jsp08_servlet 과 같다.
		//    따라서, 대상 파일명만 지정하면 해당 디렉토리까지 접근함
		
		// ===============================================================================
		// 2) Dispatch 방식
		// => request 객체의 getRequestDispatcher() 메서드를 호출하여
		//    RequestDispatcher 객체를 리턴받아 forward() 메서드로 포워딩
		//    (파라미터 : 포워딩 할 경로)
		RequestDispatcher dispatcher = request.getRequestDispatcher("jsp08_servlet/servlet1_main.jsp");
		dispatcher.forward(request, response);
		// => http://localhost:8080/StudyJSP/ServletMain
		//    (서블릿 주소에 디렉토리 구조 없으므로 파일 지정 시 디렉토리 구조까지 명시 필요함)
		// => 처음 요청 주소(URL)가 그대로 유지됨
		
	}

}





 



