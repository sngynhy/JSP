package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	
	public boolean signIn(MemberVO vo) { // 로그인 인증
		conn = JDBC.getConnection();
		String sql = "select * from member where id = ? and pw = ?";
		
		MemberVO data = null;
		boolean exist = false;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				data = new MemberVO();
				data.setName(rs.getString("name"));
				data.setId(rs.getString("id"));
				data.setPw(rs.getString("pw"));
				
				exist = true;
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBC.Close(conn, pstmt);
		}
		return exist;
	}
	
	public void signUp(MemberVO invo) { // 회원가입 시 데이터 추가
		conn = JDBC.getConnection();
		String sql = "insert into member (name, id, pw) values (?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, invo.getName());
			pstmt.setString(2, invo.getId());
			pstmt.setString(3, invo.getPw());
			
			if (invo.getName() != null && invo.getId() != null && invo.getPw() != null) {
				pstmt.executeUpdate();
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JDBC.Close(conn, pstmt);
		}
	}
	
	public ArrayList<MemberVO> selectAll() { // 모든 회원 정보 조회
		conn = JDBC.getConnection();
		String sql = "select * from member";
		
		ArrayList<MemberVO> datas = new ArrayList<MemberVO>();
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberVO data = new MemberVO();
				data.setName(rs.getString("name"));
				data.setId(rs.getString("id"));
				data.setPw(rs.getString("pw"));
				datas.add(data);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBC.Close(conn, pstmt);
		}
		return datas;
	}
}
