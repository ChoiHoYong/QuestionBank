package back;

public class MathProblemDTO {
	 private int id;

	 private int problem1;

	 private int problem2;

	 private int no1;

	 private int no2;

	 private int no3;

	 private int no4;

	 private int answer;
	
	public MathProblemDTO(int id, int problem1, int problem2, int no1, int no2, int no3, int no4, int answer) {
		this.id = id;
		this.problem1 = problem1;
		this.problem2 = problem2;
		this.no1 = no1;
		this.no2 = no2;
		this.no3 = no3;
		this.no4 = no4;
		this.answer = answer;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getProblem1() {
		return problem1;
	}

	public void setProblem1(int problem1) {
		this.problem1 = problem1;
	}

	public int getProblem2() {
		return problem2;
	}

	public void setProblem2(int problem2) {
		this.problem2 = problem2;
	}

	public int getNo1() {
		return no1;
	}

	public void setNo1(int no1) {
		this.no1 = no1;
	}

	public int getNo2() {
		return no2;
	}

	public void setNo2(int no2) {
		this.no2 = no2;
	}

	public int getNo3() {
		return no3;
	}

	public void setNo3(int no3) {
		this.no3 = no3;
	}

	public int getNo4() {
		return no4;
	}

	public void setNo4(int no4) {
		this.no4 = no4;
	}

	public int getAnswer() {
		return answer;
	}

	public void setAnswer(int answer) {
		this.answer = answer;
	}
	
	
}
