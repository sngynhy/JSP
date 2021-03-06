package model.message;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.common.JDBC;

public class MessageDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	// 게시글 목록 조회 -> 모든 데이터 불러오기
	public ArrayList<MessageVO> getDBList() {
		
		conn = JDBC.getConnection();
		ArrayList<MessageVO> datas = new ArrayList<MessageVO>();
		
		try {
			String sql = "select * from message order by mnum desc"; // 최근 게시글부터 조회
			
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				MessageVO data = new MessageVO();
				data.setContent(rs.getNString("content"));
				data.setMnum(rs.getInt("mnum"));
				data.setTitle(rs.getString("title"));
				data.setWdate(rs.getDate("wdate"));
				data.setWriter(rs.getString("writer"));
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
	
	// 특정 게시글 조회 -> mnum(PK)값으로 조회
	public MessageVO getDBData(MessageVO vo) {
	
		conn = JDBC.getConnection();
		MessageVO data = null;
		
		String sql = "select * from message where mnum = ?"; // 최근 게시글부터 조회
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getMnum());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				data = new MessageVO();
				data.setContent(rs.getString("content"));
				data.setMnum(rs.getInt("mnum"));
				data.setTitle(rs.getString("title"));
				data.setWdate(rs.getDate("wdate"));
				data.setWriter(rs.getString("writer"));
			}
			
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBC.Close(conn, pstmt);
		}
		return data;
	}
	
	// 게시글 등록
	public boolean insertDB(MessageVO vo) {
		
		conn = JDBC.getConnection();
		boolean result = false;
		
		String sql = "insert into message (mnum, writer, title, content) values (nvl((select max(mnum) from message),0)+1, ?, ?, ?)";
		
		try {			
	        pstmt=conn.prepareStatement(sql);
	        pstmt.setString(1, vo.getWriter());
	        pstmt.setString(2, vo.getTitle());
	        pstmt.setString(3, vo.getContent());
	        pstmt.executeUpdate();
			
			result = true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBC.Close(conn, pstmt);
		}
		return result;
	}
	
	// 게시글 삭제
	public boolean deleteDB(MessageVO vo) {
		
		conn = JDBC.getConnection();
		boolean result = false;
		
		String sql = "delete from message where mnum = ?";
		
		try {			
	        pstmt=conn.prepareStatement(sql);
	        pstmt.setInt(1, vo.getMnum());
	        pstmt.executeUpdate();
			
			result = true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBC.Close(conn, pstmt);
		}
		return result;
	}
	
	// 게시글 수정
	public boolean updateDB(MessageVO vo) {
		
		conn = JDBC.getConnection();
		boolean result = false;
		
		String sql = "update message set writer = ?, title = ?, content = ?, wdate = sysdate where mnum = ?";
		
		try {			
	         pstmt=conn.prepareStatement(sql);
	         pstmt.setString(1, vo.getWriter());
	         pstmt.setString(2, vo.getTitle());
	         pstmt.setString(3, vo.getContent());
	         pstmt.setInt(4, vo.getMnum());
	         pstmt.executeUpdate();
			
			result = true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBC.Close(conn, pstmt);
		}
		return result;
	}
}
