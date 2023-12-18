package jsp09_jdbc;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/JdbcConnect2") // http://localhost:8080/StudyJSP/JdbcConnect2
public class JdbcConnect2Servlet extends HttpServlet {
	
	// 하이퍼링크를 사용해 페이지 이동 작업을 수행했으므로 GET 방식! => doGet() 메서드!
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("JdbcConnect2Servlet");
		
		/*
		 * < 2단계. DB 연결(접속) >
		 * - java.sql 패키지의 DriverManager 클래스의 static 메서드 getConnection() 호출하여
		 *   파라미터로 DB 접속을 위한 URL 과 DB 접속 계정명, 패스워드를 문자열로 전달
		 *   => URL 형식 : "jdbc:mysql://접속할주소:포트번호/DB명"
		 *                  e.g. jdbc:mysql://localhost:3306/study_jsp5
		 *                 // => 3306은 MySQL 데이터베이스의 기본 포트 번호를 뜻함(암기할 것!)
		 *   => 실제 접속 문법
		 *      DriverManager.getConnection("jdbc:mysql://localhost:3306/study_jsp5", "root", "1234");
		 * - 접속에 성공할 경우 java.sql.Connection 타입 객체 리턴됨
		 *   따라서, 리턴되는 객체를 전달받아 저장하면 접속 정보를 유지하고 사용할 수 있음
		 *   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/study_jsp5", "root", "1234");
		 * - 주의사항!
		 *   1) 아이디 또는 패스워드 틀렸을 경우 발생하는 오류 메세지
		 *      java.sql.SQLException: Access denied for user 'root'@'localhost' (using password: YES)
		 *                                                     ~~~~ 접속계정명
		 *   2) 접속할 DB 명이 틀렸을 경우 발생하는 오류 메세지
		 *      java.sql.SQLSyntaxErrorException: Unknown database 'study_jsp'
		 *   3) 포트번호가 틀렸을 경우 발생하는 오류 메세지
		 *      java.net.ConnectException: Connection refused: connect
		 *   4) 접속 주소가 틀렸을 경우 발생하는 오류 메세지
		 *      java.net.UnknownHostException: localhos
		 */
		
		try {
			// 1단계. JDBC 드라이버 로드
			Class.forName("com.mysql.cj.jdbc.Driver");
			// => ClassNotFoundException 예외 발생이 예상되므로 예외 처리(try/catch) 필요
			System.out.println("드라이버 로드 성공!");
			
			// 2단계. DB 연결
			// => java.sql 패키지의 DriverManager 클래스의 static 메서드 getConnection() 호출하여
			//    DB 접속을 위한 URL 과 DB 접속 계정명, 패스워드를 문자열의 형태로 파라미터로 전달
			//	  접속에 성공할 경우 java.sql.Connection 타입 객체 리턴됨
			DriverManager.getConnection("jdbc:mysql://localhost:3306/study_jsp5", "root", "1234");
			System.out.println("DB 연결 성공!");
		} catch (ClassNotFoundException e) {
			// 드라이버 클래스 로드 실패 시 실행되는 catch 블럭
			System.out.println("드라이버 로드 실패!");
			e.printStackTrace();
		} catch (SQLException e) {
			// DB 연결 실패시 실행되는 catch 블럭
			System.out.println("DB 연결 실패!");
			e.printStackTrace();
		}
		
	}

}












