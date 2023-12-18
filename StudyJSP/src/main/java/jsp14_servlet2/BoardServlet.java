package jsp14_servlet2;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.bo")
public class BoardServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BoardServlet - *.bo 주소 매핑!");
		
		// 서블릿 주소 추출
		String command = request.getServletPath();
		System.out.println("command : " + command);
		
		// 1. "BoardWriteForm.bo" 서블릿 매핑
		// => 뷰페이지(board_write_form.jsp) 로 포워딩
		// 2. "BoardList.bo" 서블릿 매핑
		// => 뷰페이지(board_list.jsp) 로 포워딩
		if(command.equals("/jsp14_servlet2/BoardWriteForm.bo")) {
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher("/jsp14_servlet2/board_write_form.jsp");
			dispatcher.forward(request, response);
		} else if(command.equals("/jsp14_servlet2/BoardList.bo")) {
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher("/jsp14_servlet2/board_list.jsp");
			dispatcher.forward(request, response);
			
			}
		
	}

}
