package model.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.common.JDBC;
import model.customer.CustomerVO;

public class ProductDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;

	// 상품 출력 selectAll
	public ArrayList<ProductVO> getProductAll() {

		conn = JDBC.getConnection();
		ArrayList<ProductVO> datas = new ArrayList<ProductVO>();

		try {
			String sql = "select * from product order by pnum";

			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				ProductVO data = new ProductVO();
				data.setPnum(rs.getInt("pnum"));
				data.setPname(rs.getString("pname"));
				data.setPrice(rs.getInt("price"));
				data.setStock(rs.getInt("stock"));
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


	// pname으로 상품 조회
	public ArrayList<ProductVO> getSearchProduct(String keyword) {

		conn = JDBC.getConnection();
		ArrayList<ProductVO> datas = new ArrayList<ProductVO>();
		
		String sql = "select * from product where pname like ?";

		try {
			pstmt = conn.prepareStatement(sql);
			keyword = "%" + keyword + "%";
			pstmt.setString(1, keyword);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductVO data = new ProductVO();
				data.setPnum(rs.getInt("pnum"));
				data.setPname(rs.getString("pname"));
				data.setPrice(rs.getInt("price"));
				data.setStock(rs.getInt("stock"));
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


	// 상품 재고 조회
	public ProductVO getProductOne(ProductVO invo) {

		conn = JDBC.getConnection();
		String sql = "select * from product where pnum = ?";
		
		ProductVO outvo = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, invo.getPnum());
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				outvo = new ProductVO();
				outvo.setPnum(rs.getInt("pnum"));
				outvo.setPname(rs.getString("pname"));
				outvo.setPrice(rs.getInt("price"));
				outvo.setStock(rs.getInt("stock"));
			}

			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBC.Close(conn, pstmt);
		}
		return outvo;
	}
	
	// 주문 시 재고 update
	public boolean updateProduct(ProductVO invo) {

		conn = JDBC.getConnection();
		boolean result = false;
		
		try {
			String sql = "update product set stock = stock - ? where pnum = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, invo.getCnt());
			pstmt.setInt(2, invo.getPnum());
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



