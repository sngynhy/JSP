package model.order;

import java.util.ArrayList;

import model.menu.MenuDAO;

public class OrderDAO {
	
	public int calc(ArrayList<OrderVO> list) {
		
		int totalPrice = 0;
		
		MenuDAO mdao = new MenuDAO();
		
		for (OrderVO v : list) {
			int price = v.getCnt() * mdao.select(v.getMenu());
			totalPrice += price;
		}
		
		return totalPrice;
	}
	
	
}
