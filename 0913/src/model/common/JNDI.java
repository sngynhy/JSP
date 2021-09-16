package model.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JNDI {
	
	public static Connection getConnection() {
		
		Connection conn = null;
		
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/orcl");
			conn = ds.getConnection();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void Close(Connection conn, PreparedStatement pstmt) {
		try {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
