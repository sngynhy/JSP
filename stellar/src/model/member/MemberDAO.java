package model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.common.JDBC;

public class MemberDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	
	public boolean login(MemberVO invo) { // 로그인 인증
		
		conn = JDBC.getConnection();
		String sql = "select * from members where id = ? and pw = ?";
		
		MemberVO outvo = null;
		boolean exist = false;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, invo.getId());
			pstmt.setString(2, invo.getPw());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				outvo = new MemberVO();
				outvo.setId(rs.getString("id"));
				outvo.setPw(rs.getString("pw"));
				outvo.setName(rs.getString("name"));
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
	
	public boolean signUp(MemberVO invo) { // 회원가입 시 데이터 추가
		conn = JDBC.getConnection();
		String sql = "insert into members values (?,?,?)";
		
		boolean result = false;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, invo.getId());
			pstmt.setString(2, invo.getPw());
			pstmt.setString(3, invo.getName());
			pstmt.executeUpdate();
			result = true;
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JDBC.Close(conn, pstmt);
		}
		return result;
	}
	
	public boolean checkID(String id) { // ID 중복 검사
		
		conn = JDBC.getConnection();
		String sql = "select * from members where id = ?";
		
		boolean exist = false;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				exist = true;
			}
			
			rs.close();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JDBC.Close(conn, pstmt);
		}
		return exist;
	}
}
