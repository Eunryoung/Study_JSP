package jsp08_servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/dispatchServlet") // http://localhost:8080/StudyJSP/dispatchServlet
public class Servlet2DispatchServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Servlet2DispatchServlet");
		
		// 폼에서 입력받은 파라미터(이름, 나이) 가져와서 변수에 저장 후 출력
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age")); // String -> int 형변환
		System.out.println("이름 : " + name);
		System.out.println("나이 : " + age);
		
		// "jsp08_servlet/servlet2_dispatch_result.jsp" 페이지로 포워딩(= 디스패치)
		RequestDispatcher dispatcher = request.getRequestDispatcher("jsp08_servlet/servlet2_dispatch_result.jsp");
		dispatcher.forward(request, response);
		// ==========================================================================================================
		/*
		 * [ Dispatch 방식 포워딩 특징 ]
		 * 1. 포워딩 시 지정한 주소(요청받은 새 주소)가 웹브라우저 주소표시줄에 표시되지 않고
		 * 	  이전의 요청 주소가 그대로 유지됨(= 주소표시줄 주소가 변경되지 않음)
		 * 	  => 이전 요청 주소 : http://localhost:8080/StudyJSP/dispatchServlet
		 * 	  => 새 요청 시에도 주소는 그대로 유지됨
		 * 2. 이전 요청에서 생성된 request 객체(response 포함)가 그대로 유지되므로
		 *    포워딩 후에도 기존 request 객체가 그대로 유지됨
		 *    따라서, 원래 저장되어 있던 파라미터 및 속성 등의 데이터도 그대로 유지됨
		 *    => 즉, 새 페이지에서 기존 저장된 데이터 공유 가능함
		 */
	
	}

}
