package model;

import java.util.ArrayList;

public class MenuDAO {
	
	ArrayList<MenuVO> list;
	
	public MenuDAO() {
		list = new ArrayList<MenuVO>();
		list.add(new MenuVO("유스베리", 4200));
		list.add(new MenuVO("히비스커스", 3800));
		list.add(new MenuVO("자스민", 2900));
		list.add(new MenuVO("잉글리쉬브랙퍼스트", 4000));
		list.add(new MenuVO("TWG1837", 4800));
	}
	
	public int select(String menu) { // 주문 메뉴의 가격 반환
		for (MenuVO v : list) {
			if (v.getMenu().equals(menu)) {
				return v.getPrice();
			}
		}
		return 0;
	}
}
