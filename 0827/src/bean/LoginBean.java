package bean;

public class LoginBean { // �ǹ������� Ŭ������ �ڿ� Bean�� ������
	
	private String userID; // �ʵ���� view(.jsp)�� name�� �����ϰ�!
	private String userPW;

	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPW() {
		return userPW;
	}
	public void setUserPW(String userPW) {
		this.userPW = userPW;
	}
	
	final String dbID = "sngynhy"; // DB���� -> �� ���ȭ
	final String dbPW = "asdf";
	
	public boolean check() {
		if (userID.equals(dbID) && userPW.equals(dbPW)) {
			return true;
		}
		return false;
	}
}
