package jsp13_cookie;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/jsp13_cookie/DeleteCookie")
public class DeleteCookieServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클라이언트에 저장되어 있는 쿠키 정보 삭제
		// => 서버에서 직접 삭제하는 것이 아니라 
		//    전송받은 쿠키 정보에서 유효기간(타이머)만 0으로 설정 후 클라이언트에게 전송
		// 1. Cookie 객체 생성 시 삭제할 쿠키명을 지정(값은 무관)
		Cookie cookie = new Cookie("cookieName", null); // 쿠키명만 일치하면 된다!
		
		// 2. 쿠키 유효기간을 0으로 설정(쿠키를 즉시 삭제한다는 의미)
		cookie.setMaxAge(0);
		
		// 3. 응답 데이터에 쿠키 추가
		response.addCookie(cookie);
		
		// 4. 쿠키 확인을 위해 ShowCookie 서블릿 리다이렉트
		response.sendRedirect("ShowCookie");
	}

}












