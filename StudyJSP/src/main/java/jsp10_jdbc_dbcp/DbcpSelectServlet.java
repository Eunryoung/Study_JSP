package jsp10_jdbc_dbcp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DbcpSelect")
public class DbcpSelectServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// dbcp_main.jsp 파일 내의 하이퍼링크에서 접속하므로 GET 방식!
		System.out.println("DbcpSelectServlet");
		
		// 데이터베이스 활용에 사용될 변수 선언
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// JdbcUtil 클래스의 getConnection() 메서드를 호출하여
		// 커넥션풀을 통해 관리되는 Connection 객체 리턴받기
		// => static 메서드이므로 클래스명만으로 접근 가능
		// => 1단계 & 2단계 작업에 해당
		con = JdbcUtil.getConnection();
		
		try {
			// 3단계. SQL 구문 작성 및 전달
			// => jsp09_student 테이블의 모든 레코드 조회
			String sql = "SELECT * FROM jsp09_student";
			pstmt = con.prepareStatement(sql);
			
			// 4단계. SQL 구문 실행 및 결과 처리
			rs = pstmt.executeQuery();
			
			// 레코드가 존재할 동안 반복하면서 데이터 출력
			while(rs.next()) {
				// 각 레코드의 컬럼 접근을 위해 ResultSet 객체의 getXXX() 메서드 호출
				int idx = rs.getInt("idx"); // int 타입 리턴
				String name = rs.getString("name"); // String 타입 리턴
				System.out.println("번호 : " + idx + ", 이름 : " + name);
			}
			
		} catch (SQLException e) {
			// DB 연결(2단계) 까지의 처리는 JdbcUtil 클래스의 getConnection() 메서드에서
			// try/catch를 통해 예외 처리를 했기 때문에 SQL 구문 오류만 남음
			System.out.println("SQL 구문 오류 발생!");
			e.printStackTrace();
		} finally {
			// DB 자원 반환
			// => JdbcUtil 클래스의 static 메서드 close() 메서드를 호출하여
			//	  반환할 자원(객체)을 파라미터로 전달
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
	}

}
