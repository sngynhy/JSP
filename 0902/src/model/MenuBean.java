package model;

import java.util.Arrays;

public class MenuBean {
	
	private String[] product = {"�Ƹ޸�ī��", "ī���", "���ڶ�", "��׷���", "���۹�Ʈ"};
	private int[] price = {2500, 3500, 4000, 3000, 3000};
	
	public String[] getProduct() {
		return product;
	}
	public int[] getPrice() {
		return price;
	}
	
	public int pay(String menu, int cnt) {
		return cnt * price[Arrays.asList(product).indexOf(menu)];
		// �迭������ indexOf()�� �������� �ʰ�,
		// ArrayList �ڷᱸ�������� �����ϹǷ� asList()�� ���� ��ȯ �ʿ�!
	}
}
