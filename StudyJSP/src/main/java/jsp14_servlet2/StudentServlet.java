package jsp14_servlet2;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 컨텍스트 루트 뒤의 서블릿 주소가 "xxxx.st" 로 끝나는 주소일 경우 모두 매핑을 수행하기 위해
// 일치할 필요가 없는 주소 부분을 * 기호로 대체하고, 마지막 끝나는 주소를 패턴 형식(.st)으로
// 지정하여 복수개의 서블릿 주소를 하나의 서블릿 클래스에서 처리하도록 매핑
// => 컨텍스트 루트 뒤부터 패턴의 앞 부분까지는 어떤 구조 및 어떤 문자열이라도 상관없다!
// => 단, 각각의 서블릿 주소에 따른 작업을 별도로 수행하려면 서블릿 주소의 구별은 필수!
// => ex) http://localhost:8080/StudyJSP/jsp13_servlet/xxxx.st
//        => http://localhost:8080/StudyJSP/jsp13_servlet/StudentList.st
//        => http://localhost:8080/StudyJSP/jsp13_servlet/StudentInsertForm.st
@WebServlet("*.st")
public class StudentServlet extends HttpServlet {
	// GET 방식 요청과 POST 방식 요청 처리는 크게 다르지 않기 때문에
	// 두 요청을 공통으로 처리하기 위한 doProcess() 메서드로 통합
	// => 각각의 doGet(), doPost() 메서드에서 doProcess() 메서드를 호출
	// => 파라미터 : request, response 객체   리턴타입 : void
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 공통으로 작업을 처리할 doProcess() 메서드 호출
		doProcess(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 공통으로 작업을 처리할 doProcess() 메서드 호출
		// => 단, POST 방식 요청일 경우 한글 파라미터에 대한 인코딩 방식 변경
		request.setCharacterEncoding("UTF-8");
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("StudentServlet - doProcess() 메서드 호출됨!");
		
		/*
		 * [ 서블릿 주소 패턴을 각 요청별로 구별하기 ]
		 * - 주소표시줄에 입력되어 있는 URL 에서 서블릿 주소를 가져와서
		 *   각 서블릿 주소 판별을 통해 수행해야할 동작을 결정해야함
		 * - 따라서, 요청 정보가 저장된 request 객체를 통해 서블릿 주소 추출 필요
		 * ex) http://localhost:8080/StudyJSP/jsp14_servlet2/StudentList.st 주소 요청과
		 *     http://localhost:8080/StudyJSP/jsp14_servlet2/StudentInsertForm.st 주소 요청의
		 *     동작이 서로 달라야하므로 구별할 수 있는 부분을 추출하여 작업을 따로 수행해야함
		 *     => 이 때, 컨텍스트 루트(/StudyJSP)까지를 제외한 나머지 URL 부분 중에서
		 *        서블릿 주소(= 프로젝트명 뒷부분의 /xxx.패턴)를 추출 후
		 *        문자열 비교를 통해 각 서블릿 주소 판별 작업을 수행해야함
		 */
		// < 서블릿 주소 추출 과정 >
		// 0. 참고) 요청 주소(전체 URL) 추출(= 가져오기)
//		String requestURL = request.getRequestURL().toString();
//		System.out.println("requestURL : " + requestURL);
		// requestURL : http://localhost:8080/StudyJSP/jsp14_servlet2/StudentList.st
		// => 단, 서버마다 IP 주소(localhost 부분) 또는 서비스 포트번호(8080 부분) 등이
		//    달라질 수도 있으므로 요청 주소(URL) 전체를 문자열로 판별하는 작업은 비효율적임
		// => 공통 부분을 제외한 나머지(= 서블릿 주소) 부분만 추출하여 판별
		// ------------------------------------------------------
		// 1. 요청 주소 중 URI 부분(/컨텍스트루트(프로젝트명)/서블릿주소) 추출 
//		String requestURI = request.getRequestURI();
//		System.out.println("requestURI : " + requestURI);
		// requestURI : /StudyJSP/jsp14_servlet2/StudentList.st
		// => 요청 주소 중 포트번호까지를 제외한 컨텍스트루트부터의 경로가 추출됨
		// ------------
		// 2. 요청 주소 중 컨텍스트 루트(/프로젝트명) 추출
//		String contextPath = request.getContextPath();
//		System.out.println("contextPath : " + contextPath);
		// contextPath : /StudyJSP
		// ------------
		// 3. 요청 주소 중 서블릿 주소 부분(/서블릿주소) 추출(중간경로 포함)
		// => requestURI 와 contextPath 를 가공해서 추출
		// ex) /StudyJSP/jsp14_servlet2/StudentList.st => /jsp14_servlet2/StudentList.st
		// 방법1) requestURI 중에서 "/서블릿주소" 에 해당하는 부분문자열 추출
		//        => String - substring() 메서드 활용
		//           requestURI 주소 중 "/jsp14_servlet2/StudentList.st" 추출이 필요하므로
		//           컨텍스트 루트("/StudyJSP") 문자열의 길이를 계산하여 시작 인덱스로 지정 후
		//           해당 문자열의 마지막 인덱스까지 추출
		//        ex) "/StudyJSP" 문자열(contextPath)의 길이가 9이므로 
		//            서블릿 주소 부분의 "/" 위치(시작인덱스) 로 활용 가능
//		String command = requestURI.substring(contextPath.length());
//		System.out.println("command(substring()) : " + command);
		
		// 방법2) requestURI 중에서 contextPath 부분을 널스트링("") 으로 치환(교체)
		//        => String - replace() 메서드 활용
//		String command = requestURI.replace(contextPath, "");
//		System.out.println("command(replace()) : " + command);
		// =============================================================================
		// 위의 1 ~ 3번 과정을 하나의 메서드로 압축하여 제공
		// => request 객체의 getServletPath() 메서드 활용
		String command = request.getServletPath();
		System.out.println("command : " + command);
		// ----------------------------------------
		// 추출된 서블릿 주소(command)를 if문을 통해 문자열 비교를 수행하고
		// 각 주소 판별에 따른 작업(= 액션)을 수행 => String - equals() 메서드로 문자열 비교
		if(command.equals("/jsp14_servlet2/StudentInsertForm.st")) {
			System.out.println("학생정보 등록 폼!");
			 
			// 학생정보 등록 폼 뷰페이지("/jsp14_servlet2/student_insert_form.jsp")로 이동
			// => DB 작업(= 비즈니스로직)이 불필요하므로 뷰페이지로 바로 이동
			// => 주소표시줄 변경 없이 기존 서블릿 주소가 유지 = Dispatch 방식 포워딩
			// 1) request 객체의 getRequestDispatcher() 메서드 호출하여 RequestDispatcher 객체 리턴받기
			//    => 파라미터 : 포워딩 경로   리턴타입 : RequestDispatcher
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher("/jsp14_servlet2/student_insert_form.jsp");
			// 2) RequestDispatcher 객체의 forward() 메서드를 호출하여 포워딩 작업 수행
			//    => 파라미터 : request, forward 객체   리턴타입 : void   
			dispatcher.forward(request, response);
			// => 포워딩 후에도 브라우저 주소표시줄 URL 이 그대로 유지됨
			//    (http://localhost:8080/StudyJSP/jsp14_servlet2/StudentInsertForm.st)
		} else if(command.equals("/jsp14_servlet2/StudentInsertPro.st")) {
			System.out.println("학생 등록 작업!");
			
			// 전달받은 폼 파라미터 데이터(번호, 이름) 가져와서 StudentDTO 객체에 저장
			StudentDTO student = new StudentDTO();
			student.setIdx(Integer.parseInt(request.getParameter("idx"))); // 번호
			student.setName(request.getParameter("name"));
//			System.out.println("번호 : " + student.getIdx());
//			System.out.println("이름 : " + student.getName());
			// 만약, StudentDTO 클래스에 toString() 메서드가 오버라이딩 되어 있을 경우
			// 출력문에 객체명.toString() 또는 객체명만 기술해도 멤버변수값 출력 가능
//			System.out.println(student.toString()); // toString() 메서드 생략 가능
			
			// 학생정보 등록 작업 처리를 DB 를 통해 수행하기 위해
			// StudentDAO 클래스 인스턴스 생성 후 insert() 메서드 호출
			// => 파라미터 : StudentDTO 객체(student)   리턴타입 : int(insertCount)
			StudentDAO dao = new StudentDAO();
			int insertCount = dao.insert(student);
			
			if(insertCount > 0) { // 성공 시
				// 가입 결과 확인(= 학생 목록 조회) 위해 "StudentList.st" 서블릿 요청(리다이렉트)
				response.sendRedirect("StudentList.st");
			} else {
				// 자바스크립트를 사용하여 "학생 정보 등록 실패!" 출력 후 이전페이지로 돌아가기
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('학생 정보 등록 실패!');");
				out.println("history.back();");
				out.println("</script>");
			}
			
		} else if(command.equals("/jsp14_servlet2/StudentList.st")) {
			System.out.println("학생목록 출력 폼!");
			
			// 학생 목록 조회를 위해 StudentDAO - selectStudentList() 메서드 호출
			// => 파라미터 : 없음   리턴타입 : List<StudentDTO>(studentList)
			StudentDAO dao = new StudentDAO();
			List<StudentDTO> studentList = dao.selectStudentList();
//			System.out.println(studentList); 
			// => StudentDTO 클래스에 toString() 메서드가 오버라이딩 되어있으므로
			// 	  주소값이 아닌 문자열 결합물 출력됨
			
			// 뷰페이지로 학생 목록 조회 결과객체(List<StudentDTO>)를 전달하기 위해
			// request 객체의 setAttribute() 메서드를 통해 객체 저장(속성명: studentList)
			request.setAttribute("studentList", studentList);
			
			// 뷰페이지(student_list.jsp)로 포워딩
			// => URL 유지 및 request 객체 유지를 위해 Dispatch 방식 포워딩
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp14_servlet2/student_list.jsp");
			dispatcher.forward(request, response);
			
		}
		
		
	}

}
















