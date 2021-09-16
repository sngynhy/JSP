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
				conn.setAutoCommit(true);
				return false;
			}
			
			pstmt = conn.prepareStatement(update_sql);
			pstmt.setInt(1, invo.getM_id());
			if (pstmt.executeUpdate() == 0) {
				conn.rollback();
				conn.setAutoCommit(true);
				return false;
			}
			
			conn.commit();
			conn.setAutoCommit(true);
		} catch(SQLException e) {
			conn.rollback();
			e.printStackTrace();
			conn.setAutoCommit(true);
			return false;
		} finally {
			JNDI.Close(conn, pstmt);
		}
		return true;
	}
	
	// ¥Î¥Ò±€ ªË¡¶
	public boolean RMSGdelete(ReplyVO invo) {
		
		conn = JNDI.getConnection();
		String sql = "delete from reply where r_id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, invo.getR_id());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JNDI.Close(conn, pstmt);
		}
		return true;
	}
}
