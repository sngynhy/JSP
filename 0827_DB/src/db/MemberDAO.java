package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	
	public boolean signIn(MemberVO vo) {
		conn = JDBC.getConnection();
		String sql = "select * from member where id = ? and pw = ?";
		
		boolean exist = false;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				exist = true;
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
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
	
	public MemberVO selectAll() {
		conn = JDBC.getConnection();
		String sql = "select * from member";
		
		MemberVO outvo = null;

		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				outvo = new MemberVO();
				outvo.setName(rs.getString("name"));
				outvo.setName(rs.getString("id"));
				outvo.setName(rs.getString("pw"));
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
		}
		return outvo;
	}
}
