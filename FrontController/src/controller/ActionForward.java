package controller;

public class ActionForward {
	
	private boolean redirect; // ������ ���� ���
	// redirect - �ַ� ������ �����Ͱ� ���� �� ��� (url���� ��� �� ������ ���� ����, *.jsp&action=main ���¿� ����)
	// forward - �ַ� ������ �����Ͱ� ���� �� ���
	private String path; // �̵��� ������ ���
	
	public boolean isRedirect() {
		return redirect;
	}
	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
}
