package model.bank;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.common.DBCP;

public class Bank1DAO {

	Connection conn = null;
	PreparedStatement pstmt = null;

	public Bank1VO getBank1() {

		String sql="select * from bank1";
		Bank1VO outvo = null;

		try {
			conn = DBCP.getConnection();
			pstmt = conn.prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery();
			while (rs.next()) {
				outvo = new Bank1VO();
				outvo.setId(rs.getString("id"));
				outvo.setName(rs.getString("name"));
				outvo.setBalance(rs.getInt("balance"));
			}
			rs.close();

		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			DBCP.Close(conn, pstmt);
		}
		return outvo;
	}

	public boolean trans(int bal) {
		
		try {
			conn = DBCP.getConnection();
			conn.setAutoCommit(false);

			String sql1="update bank1 set balance = balance - ? where id = 1001";
			String sql2="update bank2 set balance = balance + ? where id = 2001";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, bal);
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, bal);
			pstmt.executeUpdate();

			String sql = "select balance from bank1 where id = 1001";
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			if (rs.getInt("balance") < 0) {
				conn.rollback();
				return false;
			}
			rs.close();
			conn.commit();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBCP.Close(conn, pstmt);
		}

		return true;
	}

}
