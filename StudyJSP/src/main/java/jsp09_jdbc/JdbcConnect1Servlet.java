package jsp09_jdbc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/JdbcConnect1") // http://localhost:8080/StudyJSP/JdbcConnect1
public class JdbcConnect1Servlet extends HttpServlet {
	
	// 하이퍼링크를 사용해 페이지 이동 작업을 수행했으므로 GET 방식! => doGet() 메서드!
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("JdbcConnect1Servlet");
		
		/*
		 * [ JDBC 를 활용한 MySQL 연동(사용) 방법 - 4단계 ]
		 * < 1단계. JDBC 드라이버 클래스 로드 >
		 * - java.lang 패키지의 Class 클래스의 static 메서드 forName() 호출하여
		 *   드라이버 클래스가 위치한 패키지명과 클래스명을 문자열 파라미터로 전달
		 * - com.mysql.cj.jdbc 패키지 내의 Driver.class 파일을 지정해야함
		 *   => "com.mysql.cj.jdbc.Driver" 형식으로 지정(주의! .class 생략해야함)
		 * - 해당 드라이버 클래스가 자바 메모리에 로딩됨
		 * - 반드시, 드라이버 클래스가 포함된 라이브러리(jar 파일)가
		 *   Build Path 에 추가되어 있어야 한다.
		 */
		try {
			// 1단계. JDBC 드라이버 로드
			// => java.lang 패키지의 Class 클래스의 static 메서드 forName() 호출하여
			//    드라이버 클래스가 위치한 패키지명과 클래스명을 문자열 파라미터로 전달
			//    com.mysql.cj.jdbc 패키지 내의 Driver.class 파일을 지정해야함
			//    "com.mysql.cj.jdbc.Driver" 형식으로 지정(주의! .class 생략해야함)
			//    해당 드라이버 클래스가 자바 메모리에 로딩됨
			Class.forName("com.mysql.cj.jdbc.Driver");
			// --------------------------------------
			// 만약, 드라이버 클래스가 존재하지 않거나, 이름이 틀린 경우
			// 웹브라우저 오류 메세지 기준 HTTP 상태 500 - 내부 서버 오류 발생
			// 자바 기준 ClassNotFoundException 예외 발생
//			Class.forName("com.mysql.cj.jdbc.Dri"); // 드라이버 위치가 잘못된 경우
			// 예외메세지 : java.lang.ClassNotFoundException: com.mysql.cj.jdbc.Dri
			//                        ~~~~~~~~~~~~~~~ 이 부분 주의 ~~~~~~~~~~~~~~~~
			// => com.mysql.cj.jdbc.Dri 라는 클래스가 존재하지 않는다는 의미의 예외가 발생했으므로
			//    1) 클래스 파일 존재 여부 확인(Build path 등록 확인)
			//    2) 드라이버 클래스명(패키지명 포함)이 올바르게 입력되었는지 확인
			// => 해당 예외가 발생됐을 때 후속 처리를 수행하기 위해 try~catch 블럭을 사용해야하며
			//    예외 발생 예상 지점을 블럭 지정 후 Alt + Shift + Z 단축키를 통해
			//    팝업 메뉴의 Try/catch block 항목 클릭(자세한 예외 처리는 자바에서....)
			// --------------------------------------
			// try 블록 내에서 예외가 발생했을 경우
			// 해당 예외 발생 코드 아래쪽의 나머지 코드들은 실행되지 못하고
			// 즉시, catch 블럭으로 흐름이 이동함
			System.out.println("드라이버 로드 성공!"); // 예외 발생 시 실행되지 못하는 코드
		} catch (ClassNotFoundException e) {
			// 드라이버 클래스가 존재하지 않는 등의 예외(= 오류) 발생 시
			// 현재 catch 블럭의 코드가 실행됨(예외 미발생 시 실행되지 않음)
			System.out.println("드라이버 로드 실패!");
			e.printStackTrace();
		}
		
	}

}


















