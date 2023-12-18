package jsp13_cookie;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/jsp13_cookie/Test3Cookie")
public class Test3CookieServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터 lang 값 가져와서 변수에 저장
		String lang = request.getParameter("lang");
//		System.out.println(lang);
		
		// lang 이라는 쿠키명으로 쿠키에 파라미터값 저장(유효기간 : 30일)
		Cookie cookie = new Cookie("lang", lang);
		cookie.setMaxAge(60 * 60 * 24 * 30);
		response.addCookie(cookie);
		
		// test3.jsp 페이지로 리다이렉트(또는 디스패치 무관)
		response.sendRedirect("test3.jsp");
	}

}


























