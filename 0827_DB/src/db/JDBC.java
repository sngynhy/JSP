package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class JDBC {
	// JDBC : DB�� �����ϱ� ���� ����̹� �ε��ϴ� ����

	// Connection ��ü ���� (open)
	public static Connection getConnection() {
		Connection conn = null;
		
		String DName_oracle = "oracle.jdbc.driver.OracleDriver";  // JDBC�� ����̹� Ŭ������
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user="sngynhy";
		String password="qwer";
		
		try {
			Class.forName(DName_oracle);
			conn = DriverManager.getConnection(url, user, password);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
		
	}
	
	// ������ Connection ��ü�� close
	public static void Close(Connection conn, PreparedStatement pstmt) {
		
		try {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
