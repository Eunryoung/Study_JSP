package jsp10_jdbc_dbcp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DbcpInsertPro")
public class DbcpInsertProServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("DbcpInsertProServlet");
		
		// 데이터베이스 활용에 사용될 변수 선언
		Connection con = null;
		PreparedStatement pstmt = null;
		
		// JdbcUtil 클래스의 getConnection() 메서드를 호출하여
		// 커넥션풀을 통해 관리되는 Connection 객체 리턴받기
		// => static 메서드이므로 클래스명만으로 접근 가능
		// => 1단계 & 2단계 작업에 해당
		con = JdbcUtil.getConnection();
		
		// insert_form.jsp 페이지로부터 전달받은 폼 파라미터 가져와서 변수에 저장
		// => 한글 파라미터에 대한 인코딩 처리
		request.setCharacterEncoding("UTF-8");
		int idx = Integer.parseInt(request.getParameter("idx"));
		String name = request.getParameter("name");
//		System.out.println("번호 : " + idx);
//		System.out.println("이름 : " + name);
		
		try {
			// 3단계. SQL 구문 작성 및 전달
			// => jsp09_student 테이블에 번호, 이름 추가(INSERT)
			String sql = "INSERT INTO jsp09_student VALUES (?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.setString(2, name);
			System.out.println(pstmt);
			
			// 4단계. SQL 구문 실행 및 결과 처리
			int insertCount = pstmt.executeUpdate();
			
			// INSERT 작업에 대한 결과 판별
			// => 문장 실행 결과(insertCount)가 0보다 크면 성공, 아니면 실패
			//    현재 경우에는 1인 경우 성공이므로 판별식을 insertCount == 1 로 작성해도 되지만
			//	  0보다 크다는 조건을 두는 것이 더 효용성이 좋다!(현재와 같은 경우가 아니라도 두루 사용 가능)
			if(insertCount > 0) {
				System.out.println("INSERT 성공! - " + insertCount + "개 레코드");
				// 학생 목록 조회를 위해 "DbcpSelect" 서블릿으로 리다이렉트
				response.sendRedirect("DbcpSelect");
			} else {
				System.out.println("INSERT 실패!");
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
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
	}

}
