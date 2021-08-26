package model;

import java.util.ArrayList;

public class MenuDAO {
	
	ArrayList<MenuVO> list;
	
	public MenuDAO() {
		list = new ArrayList<MenuVO>();
		list.add(new MenuVO("��������", 4200));
		list.add(new MenuVO("����Ŀ��", 3800));
		list.add(new MenuVO("�ڽ���", 2900));
		list.add(new MenuVO("�ױ۸����귢�۽�Ʈ", 4000));
		list.add(new MenuVO("TWG1837", 4800));
	}
	
	public int select(String menu) { // �ֹ� �޴��� ���� ��ȯ
		for (MenuVO v : list) {
			if (v.getMenu().equals(menu)) {
				return v.getPrice();
			}
		}
		return 0;
	}
}
