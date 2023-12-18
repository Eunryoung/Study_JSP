package jsp09_jdbc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/JdbcConnect3_SELECT") // http://localhost:8080/StudyJSP/JdbcConnect3_SELECT
public class JdbcConnect3Select extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("JdbcConnect3Select");
		
		// DB 자원을 관리하는 Connection, PreparedStatement, ResultSet 등의 타입 변수 선언
		// => finally 블럭에서 접근하기 위함
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // SELECT 결과를 관리할 객체 타입
		
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
			// jsp09_student 테이블 조회 - SELECT
			String sql = "SELECT * FROM jsp09_student";
			pstmt = con.prepareStatement(sql);
			
			System.out.println(pstmt);
			
			// 4단계. SQL 구문 실행 및 결과 처리
			// => SELECT 구문 실행을 위해 PreparedStatement 객체의 executeQuery() 메서드 호출
			// => 조회 결과(테이블)가 java.sql.ResultSet 타입 객체로 리턴됨
			rs = pstmt.executeQuery();
			
			/*
     		 * SELECT 구문 실행 성공 시 조회된 테이블이 ResultSet 타입 객체로 리턴됨
     		 * 조회 결과 테이블의 특정 레코드를 가리키는 포인터 역할을 커서(Cursor)라고 함
     		 * ResultSet 객체의 next() 메서드를 호출하여 커서를 다음 레코드(아래)로 이동시킴
     		 * => 이 때, 다음 레코드가 존재하면 true 리턴, 아니면 false 리턴
     		 *  +------+--------+
     		 *  | idx  | name   | <- 현재 커서(Cursor) 위치(항상 첫번째 레코드 위에 위치)
     		 *  +------+--------+
    		 *  |    1 | 홍길동 | <- rs.next() 한 번 호출 시 커서 위치(레코드 있음 = true 리턴)
     		 *  |    2 | 이순신 | <- rs.next() 두 번 호출 시 커서 위치(레코드 있음 = true 리턴)
     		 *  +------+--------+ <- rs.next() 세 번 호출 시 커서 위치(레코드 없음 = false 리턴) 
			 */
			
			// ResultSet 객체의 next() 메서드 호출하여 커서를 다음 레코드로 이동시키기
//			System.out.println(rs.next()); // true(레코드 있음)
//			System.out.println(rs.next()); // true(레코드 있음)
//			System.out.println(rs.next()); // false(레코드 없음)
			// -------------------------------------------------------------
		    // 다음 레코드가 존재할 경우 ResultSet 객체의 getXXX() 메서드를 호출하여 
			// 현재 접근한 레코드의 각 컬럼 데이터 가져오기 
			// => 데이터를 가져오는 것이므로 getXXX() 메서드를 호출한다! 
			// 	  c.f. SQL 구문 전달 시 만능문자 ? 기호를 사용할 때는 PreparedStatement 객체의 setXXX() 메서드 호출!
		    // => 이 때, getXXX() 메서드의 XXX 은 가져올 컬럼의 자바 데이터타입명을 지정
		    //    (ex. 문자데이터(VARCHAR) 가 저장된 컬럼 : getString(), 정수 데이터 컬럼 : getInt())
		    // => getXXX() 메서드 파라미터는 컬럼의 인덱스번호(정수 1부터 시작) 또는 컬럼명(String)을 지정
		    //    (e.g. 문자데이터 저장된 두번째 컬럼(컬럼명 : name) : getString(2) 또는 getString("name")
//			rs.next(); // 첫번째 레코드로 커서 이동
			
			// 첫번째 레코드의 첫번째 컬럼데이터(정수), 두번째 컬럼데이터(문자열) 가져오기
//			System.out.println("컬럼인덱스로 접근 : " + rs.getInt(1) + ", " + rs.getString(2));
			
			// 컬럼인덱스 잘못 지정 시 SQLException 예외 발생(존재하지 않는 3번 인덱스 지정)
//			System.out.println("컬럼인덱스로 접근 : " + rs.getInt(3) + ", " + rs.getString(2));
			// => java.sql.SQLException: Column Index out of range, 3 > 2. 
			
			// 첫번째 레코드의 "idx" 컬럼데이터(정수), "name" 컬럼데이터(문자열) 가져오기
//			System.out.println("컬럼명으로 접근 : " + rs.getInt("idx") + ", " + rs.getString("name"));
			
			// 컬럼인덱스 잘못 지정 시 SQLException 예외 발생(존재하지 않는 "age" 컬럼 지정)
//			System.out.println("컬럼명으로 접근 : " + rs.getInt("age") + ", " + rs.getString("name"));
			// => java.sql.SQLException: Column 'age' not found.
			// ------------------------------------------------------------------------------------
//			rs.next(); // 첫번째 레코드로 커서 이동
//			System.out.println("첫번째 레코드 접근 : " + rs.getInt("idx") + ", " + rs.getString("name"));
			
			// 다음 레코드로 이동하여 다시 데이터에 접근하려면 rs.next() 메서드를 또 호출
//			rs.next();
//			System.out.println("두번째 레코드 접근 : " + rs.getInt("idx") + ", " + rs.getString("name"));

//			rs.next(); // 존재하지 않는 레코드에 접근(false 리턴) 
			// => 단, rs.next() 구문에서 예외가 발생하는 것은 아님(예외 발생은 아래의 rs.getXXX()에서!) 
//			System.out.println("세번째 레코드 접근 : " + rs.getInt("idx") + ", " + rs.getString("name"));
			// => 주의! 세번째 레코드가 존재하지 않으므로 rs.next() 메서드 호출 후
			//    해당 레코드의 데이터에 접근하려 할 경우(rs.getXXX()) 예외 발생
			// => java.sql.SQLException: After end of result set
			// ====================================================================================
			// 조건문 또는 반복문과 rs.next()를 결합하여 레코드가 존재할 경우에만 접근
			// 1) 조회 결과가 단일 레코드(1개)일 경우
			// 	  => if문을 사용하여 rs.next() 결과가 true일 때 데이터에 접근하면 안전
//			if(rs.next()) {
//				System.out.println("다음 레코드 존재함!");
//				System.out.println("레코드 접근 : " + rs.getInt("idx") + ", " + rs.getString("name"));
//			} else {
//				System.out.println("다음 레코드 존재하지 않음!");
//				// => 접근하지 않으므로 오류 발생하지 않는다!
//			}
			
			// 2) 조회 결과가 복수개의 레코드(2개 이상)일 경우
			//	  => if문 대신 while 문을 사용하여 "다음 레코드가 존재할 동안" 반복
			while(rs.next()) {
				System.out.println("다음 레코드 존재함!");
				
				// 현재 커서가 위치한 레코드의 각 컬럼에 접근하여 데이터 가져오기
				// => while 문으로 인해 각 레코드 접근 반복되므로 모든 레코드의 데이터 접근 가능
				int idx = rs.getInt("idx"); // 리턴타입이 int 타입이므로 int 타입 변수에 저장
				String name = rs.getString("name");  // String 타입 리턴
				System.out.println("번호 : " + idx + ", 이름 : " + name);
			}
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로드 실패!");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("DB 연결 실패! 또는 SQL 구문 오류!");
			e.printStackTrace();
		} finally {
			try {
				// DB 자원 반환(Connection, PreparedStatement, ResultSet)
				rs.close();
				pstmt.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}












