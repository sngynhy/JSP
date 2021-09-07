package model.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class JDBC {

	public static Connection getConnection() {
		
		Connection conn = null; // scope 문제 해결하기 위해 null로 초기화 후 이용
		
		String DName_oracle = "oracle.jdbc.driver.OracleDriver";  // JDBC의 드라이버 클래스명
		
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

	public static void Close(Connection conn, PreparedStatement pstmt) {
		
		try {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
