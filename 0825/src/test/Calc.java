package test;
// ���� �и�  == concern �и�
//  : ����� ���� ����(M/V/C) ���� => ���� ����, ���� ���� ��
// ����� ������ Ŭ�������� -> ��� == ������Ʈ == ���� : M
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
