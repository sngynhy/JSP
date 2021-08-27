package bean;

public class LoginBean { // 실무에서는 클래스명 뒤에 Bean은 생략함
	
	private String userID; // 필드명은 view(.jsp)의 name과 동일하게!
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
	
	final String dbID = "sngynhy"; // DB역할 -> 값 상수화
	final String dbPW = "asdf";
	
	public boolean check() {
		if (userID.equals(dbID) && userPW.equals(dbPW)) {
			return true;
		}
		return false;
	}
}
