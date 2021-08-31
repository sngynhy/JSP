package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	
	public ArrayList<ProductVO> products() { // 모든 상품 조회
		
		conn = JDBC.getConnection();
		String sql = "select * from product";
		
		ArrayList<ProductVO> datas = new ArrayList<ProductVO>();
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductVO data = new ProductVO();
				data.setProduct_name(rs.getString("product_name"));
				data.setCategory(rs.getString("category"));
				data.setBrand(rs.getString("brand"));
				data.setPrice(rs.getInt("price"));
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
	
	public void addProduct(ProductVO vo) {
		conn = JDBC.getConnection();
		String sql = "insert into product value((select ),?,?,?)";
	}
}
