package model.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.common.JNDI;

public class UserDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	
	// 유저 등록
	public boolean insert(UserVO invo) {
		
		conn = JNDI.getConnection();
		String sql = "insert into users (u_id, name, pw) values (?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, invo.getU_id());
			pstmt.setString(2, invo.getName());
			pstmt.setString(3, invo.getPw());
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JNDI.Close(conn, pstmt);
		}
		return true;
	}
	
	// 로그인
	public boolean login(UserVO invo) {
		conn = JNDI.getConnection();
		String sql = "select u_id, pw from users where u_id = ?";
		boolean result = false;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, invo.getU_id());
			rs = pstmt.executeQuery();
			rs.next();
			if (rs.getString("pw").equals(invo.getPw())) {
				result=true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			JNDI.Close(conn, pstmt);
		}
		return result;
	}
	
	// 
	public ArrayList<UserVO> selectAll() {
		
		ArrayList<UserVO> datas = new ArrayList<UserVO>();
		conn = JNDI.getConnection();
		String sql = "select * from users where rownum <= 3 order by udate desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				UserVO data=new UserVO();
				data.setU_id(rs.getString("u_id"));
				data.setName(rs.getString("name"));
				data.setPw(rs.getString("pw"));
				data.setUdate(rs.getString("udate"));
				datas.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			JNDI.Close(conn, pstmt);
		}
		return datas;
	}
	
	
}
