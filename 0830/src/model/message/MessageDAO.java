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
	
	// �Խñ� ��� ��ȸ -> ��� ������ �ҷ�����
	public ArrayList<MessageVO> getDBList() {
		
		conn = JDBC.getConnection();
		ArrayList<MessageVO> datas = new ArrayList<MessageVO>();
		
		try {
			String sql = "select * from message order by mnum desc"; // �ֱ� �Խñۺ��� ��ȸ
			
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
	
	// Ư�� �Խñ� ��ȸ -> mnum(PK)������ ��ȸ
	public MessageVO getDBData(MessageVO vo) {
	
		conn = JDBC.getConnection();
		MessageVO data = null;
		
		String sql = "select * from message where mnum = ?"; // �ֱ� �Խñۺ��� ��ȸ
		
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
	
	// �Խñ� ���
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
	
	// �Խñ� ����
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
	
	// �Խñ� ����
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
