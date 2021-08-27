package model.order;

public class OrderVO {

	private String id;
	private String menu;
	private int cnt;
	
	public OrderVO(String id, String menu, int cnt) {
		this.id = id;
		this.menu = menu;
		this.cnt = cnt;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
}
