package model;

import java.util.Arrays;

public class MenuBean {
	
	private String[] product = {"아메리카노", "카페라떼", "초코라떼", "얼그레이", "페퍼민트"};
	private int[] price = {2500, 3500, 4000, 3000, 3000};
	
	public String[] getProduct() {
		return product;
	}
	public int[] getPrice() {
		return price;
	}
	
	public int pay(String menu, int cnt) {
		return cnt * price[Arrays.asList(product).indexOf(menu)];
		// 배열에서는 indexOf()를 지원하지 않고,
		// ArrayList 자료구조에서만 지원하므로 asList()를 통해 변환 필요!
	}
}
