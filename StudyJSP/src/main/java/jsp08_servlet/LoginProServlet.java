package jsp08_servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
// servlet1_loginForm.jsp 파일 내에서 POST 방식으로 "LoginPro" 주소 요청했으나
// 현재 서블릿 클래스 파일(LoginProServlet.java)을 Run As로 실행시킨다면
// 요청 URL을 주소창에 쳐서 들어가는 것과 동일해 GET 방식으로 처리되므로 405 오류가 발생한다!
// => HTTP 상태 405 – 허용되지 않는 메소드
// => HTTP 메소드 GET은 이 URL에 의해 지원되지 않습니다.
// 현재 서블릿 클래스 파일은 파라미터를 전송 받아서 처리하려고 만든 페이지이므로 굳이 따로 실행시킬 필요가 없으므로
// servlet1_main.jsp 파일을 ctrl + F11로 실행해 로그인 하이퍼링크를 누르고 입력 값을 전송하면 실행 된다!


// 요청 URL : http://localhost:8080 /StudyJSP /jsp08_servlet/LoginPro
//                                  ~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~
//                               컨텍스트루트 매핑할 서블릿 주소
// => 컨텍스트 루트(= 프로젝트명) 뒤의 경로 및 서블릿 주소를 모두 매핑 주소로 지정해야함
//    ex) "/LoginPro" 가 아닌 "/jsp08_servlet/LoginPro" 주소 지정
@WebServlet("/jsp08_servlet/LoginPro")
public class LoginProServlet extends HttpServlet {
	// POST 방식 요청만 처리할 경우 doGet() 메서드 불필요
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("LoginProServlet - doPost() 메서드 호출됨!");
		
		// 로그인 폼으로부터 입력받아 전달된 아이디, 패스워드 가져와서 저장 후 콘솔에 출력
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		System.out.println("아이디 : " + id);
		System.out.println("패스워드 : " + passwd);
		
		// 아이디가 "admin" 이고, 패스워드가 "1234" 이면 "로그인 성공!" 출력하고
		// 아니면, "로그인 실패" 출력
		if(id.equals("admin") && passwd.equals("1234")) { // 로그인 성공
//			System.out.println("로그인 성공!");
			
			// 세션 객체에 로그인 성공한 아이디 저장(속성명 "sId")
			// 단, 자바 클래스 내에서는 내장 객체가 존재하지 않으므로 session 변수가 없음
			// 따라서, request 객체로부터 session 객체를 얻어와서 사용해야한다!
			// => request 객체의 getSession() 메서드를 호출하여
			//    javax.servlet.http.HttpSession 타입 객체를 리턴받아 사용
			HttpSession session = request.getSession();
			// 속성명 "sId" 로 로그인에 성공한 아이디를 저장
			session.setAttribute("sId", id);
			// ----------------------------------------------------------------------
			// servlet1_main.jsp 페이지로 리다이렉트
			// 리다이렉트 과정에서 루트(/) 경로(= 계층 구조에서 첫 번째 또는 최상위 디렉토리) 지정 시 
			// 주소 및 포트번호 제외 나머지 경로 제거됨 => 슬래쉬(/)를 넣지 않아야한다!
//			response.sendRedirect("/servlet1_main.jsp"); // http://localhost:8080/servlet1_main.jsp
			// => 해당 경로상에 main.jsp 파일이 존재하지 않으므로 404 에러 발생함
			
			// 현재 LoginPro 서블릿 주소의 경로가 http://localhost:8080/StudyJSP/jsp08_servlet/LoginPro 이고
			// 요청할 파일(페이지)이 webapp/jsp08_servlet/servlet1_main.jsp 파일일 때
			// 컨텍스트루트(StudyJSP)가 webapp 디렉토리를 가리키기 때문에
			// 컨텍스트루트 뒤에 디렉토리 구조(/jsp08_servlet)를 유지한 채 파일명만 지정하면 된다!
			// 따라서, 현재 위치에서 서블릿 주소만 교체하면 되므로 파일명만 지정 가능
			response.sendRedirect("servlet1_main.jsp");
			// => http://localhost:8080/StudyJSP/jsp08_servlet/servlet1_main.jsp 페이지로 리다이렉트
		} else { // 로그인 실패
//			System.out.println("로그인 실패!");

			/*
			 * 자바스크립트 사용하여 "로그인 실패!" 출력 후 이전페이지로 돌아가기
			 * => 현재 JSP 파일이 아닌 자바 클래스(서블릿)에서 웹브라우저로
			 *    HTML 태그 등을 내보내기(출력) 위한 작업 수행
			 *    (= 자바 클래스 내에서 출력스트림을 활용하여 HTML 태그를 응답데이터로 출력해야함)
			 * => 응답 객체인 response 객체 활용하여 응답 데이터 생성해야함
			 * 
			 * 1) 출력할 HTML 형식에 대한 문서 타입(contentType) 설정
			 *    => 응답 데이터의 형식(타입)으로 HTML 태그가 사용됨을 클라이언트에게 알려줌
			 *    => response 객체의 setContentType() 메서드를 호출하여 문서 타입 지정
			 *       (JSP 파일 최상단 page 디렉티브 내의 contentType=XXX 항목 활용)
			 *       
			 * 2) 자바 코드를 사용하여 HTML 태그(자바스크립트 포함) 출력(전송)하려면
			 *    java.io.PrintWriter 객체 필요(= 출력 스트림으로 사용할 객체)
			 *    => response 객체의 getWriter() 메서드를 호출하여 얻을 수 있다!
			 *    
			 * 3) PrintWriter 객체(out)의 print() 또는 println() 메서드를 호출하여
			 *    출력할(전송할) HTML 태그 등의 코드를 문자열 형태로 전달
			 */
			// 1) 출력할 HTML 형식에 대한 문서 타입(contentType) 설정
			response.setContentType("text/html; charset=UTF-8");
			
			// 2) java.io.PrintWriter 객체 리턴받기
			PrintWriter out = response.getWriter();
			
			// PrintWriter 객체(out)의 print() or println() 메서드로 출력할 HTML 태그 문자열 전달
			// => JSP 의 out 객체와 동일하게 사용
			out.println("<script>");
			out.println("alert('로그인 실패!');");
			out.println("history.back();");
			out.println("</script>");
			// 이 코드들이 실행되는 시점에 바로 클라이언트로 응답하는 것은 아니고
			// 응답객체(response)에 응답 데이터를 저장하면
			// doPost() 메서드가 종료된 후 자동으로 클라이언트에 응답 데이터가 전송됨
		}
		
	} // doPost() 메서드 끝
	// => 이후, 클라이언트 측으로 응답 메세지가 전송됨

}










