package jsp13_cookie;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/jsp13_cookie/MakeCookie")
public class MakeCookieServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 쿠키(Cookie) 객체 생성
		// - javax.servlet.http.Cookie 타입 객체 생성(실제 쿠키가 생성되는 시점이 아님!)
		//   => 클라이언트측에 전송되어야 실제 쿠키가 생성되며, 현재는 단순 객체이다!
		// "cookieName" 이라는 속성명(쿠키명)으로 "cookieValue" 라는 값 저장
		Cookie cookie = new Cookie("cookieName", "cookieValue");
		
		// 2. 생성된 쿠키의 유효기간(만료기간) 설정
		// - Cookie 객체의 setMaxAge() 메서드를 호출하여 유효기간 지정(초 단위)
		// - 만약, 유효기간 지정 생략하거나 음수 지정 시 웹브라우저가 동작할 동안만 쿠키 유지됨
		//   => 즉, 웹브라우저 종료 시 쿠키 삭제됨(세션과 동일해짐)
		cookie.setMaxAge(60); // 60초 = 1분간 쿠키 유지됨
		
		// 3. 생성된 쿠키를 클라이언트로 전송(= 클라이언트에 실제 쿠키 생성됨)
		// - 응답 객체인 response 객체의 addCookie() 메서드 호출하여
		//   생성된 쿠키 객체를 response 객체에 추가
		response.addCookie(cookie);
		// ----------------------------------------------------------------
		// 임시) 생성된 쿠키 정보 확인
		// - getName() : 쿠키명 리턴 
		// - getValue() : 쿠키 값 리턴
		// - getMaxAge() : 쿠키 유효기간 리턴
		System.out.println("쿠키명 : " + cookie.getName());
		System.out.println("쿠키값 : " + cookie.getValue());
		System.out.println("쿠키 유효기간 : " + cookie.getMaxAge());
		// ----------------------------------------------------------------
		// ShowCookie 서블릿 주소 리다이렉트
		response.sendRedirect("ShowCookie");
		// => 응답 전송 후 웹브라우저 개발자 도구에서 생성된 쿠키 확인 가능
		//    단, 생성된 쿠키는 60초가 지나면 사라짐
	}

}













