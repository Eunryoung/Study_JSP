package jsp13_cookie;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/jsp13_cookie/ShowCookie")
public class ShowCookieServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ----------- 서블릿 클래스에서 쿠키 확인하기 -------------
		// 클라이언트가 서버에 정보 요청 시 해당 서버 주소와 일치하는 쿠키 정보를 함께 전송
		// => request 객체 내의 요청 정보에 쿠키 정보도 함께 포함되어 있음
		// 1. request 객체의 헤더에 "Cookie" 라는 문자열에 해당하는 데이터 가져오기
		//    => 요청 정보에 쿠키 존재 여부 확인 용도이며, 생략 가능
		String cookieHeader = request.getHeader("Cookie");
		
		// 2. 리턴받은 헤더 정보에 대한 문자열이 null 이 아닐 경우 판별(생략 가능)
		//    => null 이 아니면 쿠키 정보가 존재한다는 의미
		if(cookieHeader != null) {
			// 3. request 객체의 getCookies() 메서드를 호출하여 Cookie 객체들 가져오기
			//    => 리턴타입 : Cookie[]
			Cookie[] cookies = request.getCookies();
			
			// 4. for 문을 사용하여 Cookie 배열 차례대로 반복하면서 쿠키 객체 꺼내기
//			for(int i = 0; i < cookies.length; i++) {
//				Cookie cookie = cookies[i];
//			}
			
			for(Cookie cookie : cookies) {
				// 5. Cookie 객체의 getName(), getValue() 메서드를 호출하여 쿠키 정보 가져오기
				System.out.println("쿠키명 : " + cookie.getName());
				System.out.println("쿠키값 : " + cookie.getValue());
			}
			
			// ----------- 클라이언트에서 쿠키 사용하기 -----------
			// test1_show_cookie.jsp 페이지로 포워딩(디스패치)
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher("test1_show_cookie.jsp");
			dispatcher.forward(request, response);
			
		}
	}

}














