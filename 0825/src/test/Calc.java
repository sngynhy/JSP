package test;
// 관심 분리  == concern 분리
//  : 기능을 따로 따로(M/V/C) 보관 => 협업 유리, 유지 보수 편리
// 기능을 보관한 클래스파일 -> 모듈 == 컴포넌트 == 빈즈 : M
public class Calc {
	
	int result;
	
	public int getResult() {
		return result;
	}

	Calc(int num1, int num2, String op) {
		if (op.equals("+")) {
			this.result = num1 + num2;
		} else if (op.equals("-")) {
			this.result = num1 - num2;
		} else if (op.equals("*")) {
			this.result = num1 * num2;
		} else if (op.equals("/")) {
			this.result = num1 / num2;
		}
	}
}
