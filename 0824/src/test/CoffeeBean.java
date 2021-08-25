package test;

public class CoffeeBean {
	
	private String menu;
	private int cnt;
	private int totalPrice;
	
	public CoffeeBean() {
		this.menu = "";
		this.cnt = 0;
		this.totalPrice = 0;
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
	
	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public void totalPrice() {
		if (this.menu.equals("ame")) {
			this.totalPrice = this.cnt * 2000;
		} else if (this.menu.equals("latte")) {
			this.totalPrice = this.cnt * 2500;
		}
	}
}
