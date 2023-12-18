package jsp08_servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/redirectServlet") // http://localhost:8080/StudyJSP/redirectServlet
public class Servlet2RedirectServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Servlet2RedirectServlet");
		
		// 폼에서 입력받은 파라미터(이름, 나이) 가져와서 변수에 저장 후 출력
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age")); // String -> int 형변환
		System.out.println("이름 : " + name);
		System.out.println("나이 : " + age);
		
		// "jsp08_servlet/servlet2_redirect_result.jsp" 페이지로 리다이렉트
		// => 현재 요청 서블릿 주소 : http://localhost:8080/StudyJSP/redirectServlet
		// => StudyJSP = webapp 디렉토리를 가리키므로 나머지 서브디렉토리까지 명시해야함
		response.sendRedirect("jsp08_servlet/servlet2_redirect_result.jsp");
		
		// ==========================================================================
		/* [ 리다이렉트(Redirect 방식 포워딩) 특징 ]
		 * 1. 지정한(리다이렉트 된) 주소(= 새 주소)로 웹브라우저 주소표시줄의 주소가 변경됨
		 * 	  즉, 요청받은 새 주소로 변경됨
		 * 	  => 이전 요청 주소 : http://localhost:8080/StudyJSP/redirectServlet
		 * 	  => 새 요청 주소 : http://localhost:8080/StudyJSP/jsp08_servlet/servlet2_redirect_result.jsp
		 * 2. 이전 요청에서 생성된 request 객체가 유지되지 않음
		 * 	  즉, 새로운 request 객체가 생성됨
		 * 	  => 따라서, 이전 페이지에서 저장된 request 객체 내의 파라미터 및 속성값은
		 * 		 새로운 페이지에서 접근 불가능하다! (null 값 출력됨)
		 * 
		 */
		
	}

}
