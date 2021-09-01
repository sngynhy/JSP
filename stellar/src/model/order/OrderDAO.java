package model.order;

import java.util.ArrayList;

import model.product.ProductDAO;

public class OrderDAO {
	
	public int calc(ArrayList<OrderVO> list) {
		
		int totalPrice = 0;
		ProductDAO pdao = new ProductDAO();
		
		for (OrderVO vo : list) {
			int price = vo.getOrderCnt() * pdao.select(vo.getProduct());
			totalPrice += price;
		}
		return totalPrice;
	}
	
}
