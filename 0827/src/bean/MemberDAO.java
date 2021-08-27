package bean;

import java.util.ArrayList;

public class MemberDAO {
	
	ArrayList<MemberVO> datas = new ArrayList<MemberVO>();

	public ArrayList<MemberVO> getDatas() { // ����� ȸ�� �ҷ�����
		return datas;
	}
	
	public void addMember(MemberVO vo) { // ȸ�� �߰�
		datas.add(vo);
	}
	
	public boolean loginCheck(MemberVO vo) {
		for (MemberVO data : datas) {
			if (data.getUserID().equals(vo.getUserID()) && data.getUserPW().equals(vo.getUserPW())) {
				return true;
			}
		}
		return false;
	}
}
