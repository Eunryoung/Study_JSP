package jsp13_cookie;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/jsp13_cookie/LoginPro")
public class LoginProServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("LoginProServlet - doPost() 메서드 호출됨!");
		
		// 로그인 폼으로부터 입력받아 전달된 아이디, 패스워드 가져와서 저장 후 콘솔에 출력
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		System.out.println("아이디 : " + id);
		System.out.println("패스워드 : " + passwd);
		
		// 아이디 저장 체크박스 체크 상태 가져오기 => 체크 : "on", 미체크 : null
		String rememberId = request.getParameter("rememberId");
		System.out.println("아이디 저장 여부 : " + rememberId);
		
		// 아이디가 "admin" 이고, 패스워드가 "1234" 이면 "로그인 성공!" 출력하고
		// 아니면, "로그인 실패" 출력
		if(id.equals("admin") && passwd.equals("1234")) { // 로그인 성공
			HttpSession session = request.getSession();
			session.setAttribute("sId", id);
			
			Cookie cookie = new Cookie("cookieId", id);
			
			// 아이디 저장 체크박스 값(rememberId)이 null 인지 판별
			if(rememberId == null) { // 미체크 = 아이디 저장 안 함
				// 기존 쿠키 정보의 쿠키 아이디 삭제(기존 쿠키 아이디 정보에 유효기간 0 설정)
				cookie.setMaxAge(0); // 쿠키 즉시 삭제
			} else { // 체크 = 아이디 저장
				// Cookie 객체를 생성하여 "cookieId" 라는 속성명으로 로그인 성공한 아이디 저장
				// => 유효기간 : 1일
				cookie.setMaxAge(60 * 60 * 24); // 60초 * 60분 * 24시간 = 86400초 = 1일
			}
			
			response.addCookie(cookie);
			response.sendRedirect("test2_main.jsp");
		} else { // 로그인 실패
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 실패!');");
			out.println("history.back();");
			out.println("</script>");
		}
		
	} // doPost() 메서드 끝

}
