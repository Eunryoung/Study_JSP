package jsp11_jdbc_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jsp10_jdbc_dbcp.JdbcUtil;

public class StudentDAO {
	// 학생 정보 등록 작업을 수행하는 insert() 메서드 정의
	// => 파라미터 : 번호(idx), 이름(name)   리턴타입 : int(insertCount)
//	public int insert(int idx, String name) {
//		
//		return 0;
//	}
	
	// 학생 정보 등록 작업을 수행하는 insert() 메서드 정의
	// => 파라미터 : StudentDTO 객체(student)   리턴타입 : int(insertCount)
	public int insert(StudentDTO student) {
//		System.out.println("StudentDAO - insert()");
		
		// 최종적으로 리턴할 int 타입 변수 선언
		int insertCount = 0;
		
		// 데이터베이스 활용에 사용될 변수 선언
		Connection con = null;
		PreparedStatement pstmt = null;
		
		// JdbcUtil - getConnection() 메서드 호출하여
		// 데이터베이스 작업 1단계 & 2단계 수행
		con = JdbcUtil.getConnection();
		
		try {
			// 3단계. SQL 구문 작성 및 전달
			// => jsp09_student 테이블에 번호, 이름 추가(INSERT)
			String sql = "INSERT INTO jsp09_student VALUES (?, ?)";
			pstmt = con.prepareStatement(sql);
			// setXXX() 메서드로 전달할 데이터는 StudentDTO 객체에 저장되어 있으므로
			// StudentDTO 객체의 getXXX() 메서드를 호출하여 변수값 가져와서 전달
			pstmt.setInt(1, student.getIdx());
			pstmt.setString(2, student.getName());
			System.out.println(pstmt);
			
			// 4단계. SQL 구문 실행 및 결과 처리
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			// DB 연결(2단계) 까지의 처리는 JdbcUtil 클래스의 getConnection() 메서드에서
			// try/catch 를 통해 예외 처리를 했기 때문에 SQL 구문 오류만 남음
			System.out.println("SQL 구문 오류 발생!");
			e.printStackTrace();
		} finally {
			// DB 자원 반환
			// => JdbcUtil 클래스의 static 메서드 close() 메서드를 호출하여
			//    반환할 자원(객체)을 파라미터로 전달
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		// 모든 작업 완료 후 작업 결과가 저장된 변수(insertCount)값 리턴
		return insertCount;
	} // insert() 메서드 끝
	
	
	// 학생 목록 조회 작업을 수행하는 selectStudentList() 메서드 정의
	// => 파라미터 : 없음   리턴타입 : List<StudentDTO>(studentList)
	public List<StudentDTO> selectStudentList() {
		// 학생 1명의 정보가 저장되는 StudentDTO 객체 여러개(= 복수개의 레코드)를
		// 한꺼번에 저장할 java.util.List 타입 변수 선언
		// => 제네릭타입으로 StudentDTO 타입 지정(List<저장될 객체 타입> 형태로 선언)
		//    (이후 해당 List 객체에 저장될 객체는 무조건 StudentDTO 타입으로 고정됨)
		List<StudentDTO> studentList = null;
		
		// 데이터베이스 활용에 사용될 변수 선언
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// JdbcUtil 클래의 getConnection() 메서드를 호출하여
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
			// => 단, 복수개의 레코드(StudentDTO 객체 여러개)를 하나의 묶음으로 관리하기 위해
			//    배열을 사용할 수도 있으나 데이터 조회 결과가 몇 개의 레코드인지 모르므로
			//    배열을 생성할 수가 없다! (자바의 배열은 크기 변경 불가능 = 불변)
			// => 따라서, 배열 대신 java.util.List 타입 객체(ArrayList 클래스 활용)를 사용하여
			//    복수개의 StudentDTO 객체를 저장할 수 있다!
			//    (ArrayList 객체는 배열의 단점을 보완한 개념의 객체이므로 크기 확장 자유)
			// => StudentDTO 객체를 저장할 List(ArrayList) 객체를 반복문 밖에서 미리 생성 필요
			// => List 객체에 저장될 객체는 무조건 StudentDTO 타입이므로 List<StudentDTO> 지정
//			List<StudentDTO> studentList = new ArrayList<StudentDTO>(); // 업캐스팅
			// => 부모타입 인터페이스 = 구현체 클래스();
			studentList = new ArrayList<StudentDTO>();
			
			while(rs.next()) {
				// 각 레코드의 컬럼 접근을 위해 ResultSet 객체의 getXXX() 메서드 호출
				int idx = rs.getInt("idx");
				String name = rs.getString("name");
//				System.out.println("번호 : " + idx + ", 이름 : " + name);
				
				// --------------------------------------------------------------------------
				// 하나의 레코드(= 한 명의 학생 정보)의 모든 정보를
				// 각각의 변수가 아닌 하나의 객체(묶음)로 관리하기 위해 StudentDTO 클래스 활용
				// 1) StudentDTO 객체 생성(student)
				StudentDTO student = new StudentDTO();
				// 2) StudentDTO 객체에 조회된 번호, 이름 저장
				student.setIdx(idx);
				student.setName(name);
				// 3) 복수개의 레코드(= 복수개의 StudentDTO 객체) 를 저장할 List 객체에
				//    1개 레코드가 저장된 StudentDTO 객체를 추가
				// => List 객체의 add() 메서드 활용
				// => 단, List 객체는 반복문 밖에서 미리 생성되어 있어야 한다!
				studentList.add(student);
				// => 이 작업이 반복되면 최종적으로 StudentDTO 타입 객체 복수개가
				//    하나의 List(ArrayList) 객체에 차례대로 저장된다! (배열 유사)
				// --------------------------------------------------------------------------
			}
 			
		} catch (SQLException e) {
			// DB 연결(2단계) 까지의 처리는 JdbcUtil 클래스의 getConnection() 메서드에서
			// try/catch 를 통해 예외 처리를 했기 때문에 SQL 구문 오류만 남음
			System.out.println("SQL 구문 오류 발생!");
			e.printStackTrace();
		} finally {
			// DB 자원 반환
			// => JdbcUtil 클래스의 static 메서드 close() 메서드를 호출하여
			//    반환할 자원(객체)을 파라미터로 전달
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		// 복수개의 레코드가 저장된 List 객체(studentList) 리턴
		return studentList;
		
	}
	
	
}













