package db;

public class MemberVO {
	private String name;
	private String id;
	private String pw;
	private int m_point;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public int getM_point() {
		return m_point;
	}
	public void setM_point(int m_point) {
		this.m_point = m_point;
	}
	
	@Override
	public String toString() {
		return this.name + " " + this.id + " " + this.pw + " " + this.m_point;
	}
}
