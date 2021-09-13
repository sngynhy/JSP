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
	public boolean insert(MessageVO invo) {
		
		conn = JNDI.getConnection();
		String sql = "insert into reply (r_id, m_id, u_id, rmsg) values (nvl(0, (select max(r_id) from reply)+1),?,?,?)";
			
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, invo.getM_id());
			pstmt.setString(2, invo.getU_id());
			pstmt.setString(3, invo.getMsg());
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JNDI.Close(conn, pstmt);
		}
		return true;
	}
	
	// ¥Î¥Ò±€ ªË¡¶
	public boolean delete(ReplyVO invo) {
		
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
