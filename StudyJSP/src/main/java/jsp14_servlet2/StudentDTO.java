package jsp14_servlet2;

// DTO(Data Transfer Object, 데이터 전송 객체) 역할을 수행할 StudentDTO 클래스 정의
// => 멤버변수, Getter/Setter 정의, 필요에 따라 생성자 정의
// => 이 객체를 통해 데이터를 담아 JSP(view) 페이지와 Servlet 클래스, DAO 객체 사이에서
//    데이터를 주고받는 용도로 활용
public class StudentDTO {
	
	// 1. 데이터를 저장하는데 사용할 인스턴스 멤버변수 선언
	// => study_jsp5.jsp09_student 테이블의 각 컬럼에 대응하는 멤버변수를 선언
	// => 멤버변수는 외부로부터 직접 접근을 차단하기 위해 접근제한자 private 선언 
	private int idx;
	private String name;
	
	// 필요에 따라 기본 생성자 및 파라미터 생성자 정의 가능
	public StudentDTO() {}
	
	public StudentDTO(int idx, String name) {
		super();
		this.idx = idx;
		this.name = name;
	}
	// 2. Getter/Setter 정의
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	// toString() 메서드 오버라이딩을 통해 멤버변수 값 전체를 문자열로 결합하여 리턴
	// => Alt + Shift + S -> S
	@Override
	public String toString() {
		return "StudentDTO [idx=" + idx + ", name=" + name + "]";
	}
	
}












