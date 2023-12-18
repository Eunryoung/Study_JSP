package jsp09_jdbc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/JdbcConnect3_UPDATE") // http://localhost:8080/StudyJSP/JdbcConnect3_UPDATE
public class JdbcConnect3Update extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("JdbcConnect3Update");
		
		// DB 자원을 관리하는 Connection, PreparedStatement 등의 타입 변수 선언
		// => finally 블럭에서 접근하기 위함
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			// 0단계. JDBC 연결에 필요한 문자열을 각각의 변수에 저장
			String driver = "com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/study_jsp5";
			String user = "root";
			String password = "1234";
		
			// 1단계. JDBC 드라이버 로드
			Class.forName(driver);
			System.out.println("드라이버 로드 성공!");

			// 2단계. DB 연결
			con = DriverManager.getConnection(url, user, password);
			System.out.println("DB 연결 성공!");

			// 3단계. SQL 구문 작성 및 전달
			// 번호가 3인 레코드의 이름을 '조인성'으로 변경
			int idx = 3;
			String name = "조인성";
			
			String sql = "UPDATE jsp09_student SET name = ? WHERE idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, idx);
			
			System.out.println(pstmt);
			
			// 4단계. SQL 구문 실행 및 결과 처리
			int updateCount = pstmt.executeUpdate();
			System.out.println("수정 성공! - " + updateCount);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로드 실패!");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("DB 연결 실패! 또는 SQL 구문 오류!");
			e.printStackTrace();
		} finally {
			try {
				// DB 자원 반환(Connection, PreparedStatement)
				pstmt.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
	}

}












