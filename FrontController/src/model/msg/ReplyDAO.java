package model.msg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.common.JNDI;

public class ReplyDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	
	// ¥Î¥Ò±€ µÓ∑œ
	public boolean RMSGinsert(ReplyVO invo) throws SQLException {
		
		conn = JNDI.getConnection();
		String insert_sql = "insert into reply (r_id, m_id, u_id, rmsg) values (nvl((select max(r_id) from reply),0)+1,?,?,?)";
		String update_sql = "update messages set REPLYCOUNT = REPLYCOUNT + 1 where m_id = ?";
		
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(insert_sql);
			pstmt.setInt(1, invo.getM_id());
			pstmt.setString(2, invo.getU_id());
			pstmt.setString(3, invo.getRmsg());
			if (pstmt.executeUpdate() == 0) {
				conn.rollback();
				return false;
			}
			
			pstmt = conn.prepareStatement(update_sql);
			pstmt.setInt(1, invo.getM_id());
			if (pstmt.executeUpdate() == 0) {
				conn.rollback();
				return false;
			}
			
			conn.commit();
		} catch(SQLException e) {
			conn.rollback();
			e.printStackTrace();
			return false;
		} finally {
			JNDI.Close(conn, pstmt);
		}
		return true;
	}
	
	// ¥Î¥Ò±€ ªË¡¶
	public boolean RMSGdelete(ReplyVO invo) throws SQLException {
		
		conn = JNDI.getConnection();
		String delete_sql = "delete from reply where r_id = ?";
		String update_sql = "update messages set REPLYCOUNT = REPLYCOUNT - 1 where m_id = ?";
		
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(delete_sql);
			pstmt.setInt(1, invo.getR_id());
			if (pstmt.executeUpdate() == 0) {
				conn.rollback();
				return false;
			}
			
			pstmt = conn.prepareStatement(update_sql);
			pstmt.setInt(1, invo.getM_id());
			if (pstmt.executeUpdate() == 0) {
				conn.rollback();
				return false;
			}
			
			conn.commit();
		} catch (SQLException e) {
			conn.rollback();
			e.printStackTrace();
			return false;
		} finally {
			JNDI.Close(conn, pstmt);
		}
		return true;
	}
}
