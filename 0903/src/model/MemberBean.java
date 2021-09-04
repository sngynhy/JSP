package model;

public class MemberBean {
	
	private String userID = "idid";
	private String userPW = "pwpw";
	
	public String getUserID() {
		return userID;
	}
	public String getUserPW() {
		return userPW;
	}
	
	public int checkUser(String id,String pw) {
		if(id.equals(userID)) {
			if(pw.equals(userPW)) {
				return 1;
			}
			return -1;
		}
		return 0;
	}
}
