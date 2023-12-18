package jsp11_jdbc_dao;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DaoSelect")
public class DaoSelectServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("DaoSelectServlet");
		
		// 학생 목록 조회 요청을 위한 StudentDAO - selectStudentList() 메서드 호출
		// => 파라미터 : 없음   리턴타입 : void
		StudentDAO dao = new StudentDAO();
//		dao.selectStudentList();
		
		// 만약, SELECT 작업 결과가 1개의 레코드일 경우
		// 해당 레코드의 각 컬럼 데이터를 StudentDTO 객체에 저장 후 리턴
		// => 파라미터 : 없음   리턴타입 : StudentDTO(student)
//		StudentDTO student = dao.selectStudentList();
//		System.out.println("번호 : " + student.getIdx());
//		System.out.println("이름 : " + student.getName());
		
		// 복수개의 레코드(= 복수개의 StudentDTO 객체)를 List<StudentDTO> 타입으로 리턴받을 경우
		// => 파라미터 : 없음   리턴타입 : List<StudentDTO>(studentList)
		List<StudentDTO> studentList = dao.selectStudentList();
		
		// -----------------------------------------------------------------------------------------------
		// 임시) List 객체에 저장된 StudentDTO 객체를 꺼내서 차례대로 출력
		// 		 => 배열과 거의 동일한 방식 활용(대신 메서드가 제공됨)
		// 1) 일반 for문을 활용하여 인덱스로 접근하는 방법 
		// 	  배열명.length 속성 대신 => List 객체의 size() 메서드 활용
//		for(int i = 0; i < studentList.size(); i++) {
//			// List 객체의 get() 메서드를 호출하여 저장된 StudentDTO 객체 1개 꺼내기
//			// => 파라미터 : 인덱스 		리턴타입 : StudentDTO
//			StudentDTO student = studentList.get(i); // 1개 레코드(StudentDTO 객체) 꺼내기
//			System.out.println("번호 : " + student.getIdx() + ", 이름 : " + student.getName());
//		}
		// 2) 향상된 for문을 활용하여
		for(StudentDTO student : studentList) {
			System.out.println("번호2 : " + student.getIdx() + ", 이름2 : " + student.getName());
		}
		// ------------------------------------------------------------------------------------------------
		// 뷰페이지(select.jsp)로 포워딩 시 전체 레코드가 저장된 List 객체를 함께 전달해야 하므로
		// request 객체의 setAttribute() 메서드를 호출하여 전송할 데이터를 저장해야한다!
		// 이 때, request 객체가 다음 페이지까지 유지되어야 하므로 디스패치 방식 포워딩 필수!
		// => 속성명 "studentList"로 List 객체 저장
		// => 이 때, setAttribute() 메서드의 파라미터 타입 Object 로 업캐스팅 일어남

		request.setAttribute("studentList", studentList);
		
		// 학생 목록 정보를 표시하기 위해 jsp11_jdbc_dao/select.jsp 페이지로 포워딩(디스패치 방식)
		// => 1) 이전 요청에서 사용된 서블릿 주소가 그대로 유지됨(= JSP 페이지명 노출 X)
		// 	  2) 이전 요청에서 생성된 request, response 객체를 그대로 유지(전송) 
		// 		 (따라서 
		// 1. request 객체의 getRequestDispatcher() 메서드를 호출하여 RequestDispatcher 객체 리턴
		// => 파라미터 : 포워딩 될 페이지		리턴타입 : RequestDispatcher
		RequestDispatcher dispatcher = request.getRequestDispatcher("jsp11_jdbc_dao/select.jsp");
		// 2. RequestDispatcher 객체의 forward() 메서드를 호출하여 포워딩 수행
		// => 파라미터 : request, response 객체
		dispatcher.forward(request, response);
		
		
		
		
	}

}












