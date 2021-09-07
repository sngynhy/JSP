package model.customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.common.JDBC;

public class CustomerDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;

	// 로그인
	public CustomerVO login(CustomerVO invo) {

		conn = JDBC.getConnection();
		String sql = "select * from customer where id = ? and pw = ?";

		CustomerVO outvo = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, invo.getId());
			pstmt.setString(2, invo.getPw());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				outvo = new CustomerVO();
				outvo.setId(rs.getString("id"));
				outvo.setPw(rs.getString("pw"));
				outvo.setName(rs.getString("name"));
				outvo.setAddress(rs.getString("address"));
				outvo.setPhone_num(rs.getString("phone_num"));
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBC.Close(conn, pstmt);
		}
		return outvo;
	}

	// 회원 정보 수정 update
	public CustomerVO updateCustomerInfo(CustomerVO invo) {

		conn = JDBC.getConnection();
		CustomerVO outvo = null;

		try {
			String sql = "update customer set pw = ?, name = ?, address = ?, phone_num = ? where id = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, invo.getPw());
			pstmt.setString(2, invo.getName());
			pstmt.setString(3, invo.getAddress());
			pstmt.setString(4, invo.getPhone_num());
			pstmt.setString(5, invo.getId());
			pstmt.executeUpdate();

			outvo = invo;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBC.Close(conn, pstmt);
		}
		return outvo;
	}	

	// 회원 가입 시 정보 insert
	public boolean signUp(CustomerVO invo) {
		conn = JDBC.getConnection();
		String sql = "insert into customer values (?,?,?,?,?)"; // id, pw, name, address, phone_num

		boolean result = false;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, invo.getId());
			pstmt.setString(2, invo.getPw());
			pstmt.setString(3, invo.getName());
			pstmt.setString(4, invo.getAddress());
			pstmt.setString(5, invo.getPhone_num());
			pstmt.executeUpdate();
			result = true;
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JDBC.Close(conn, pstmt);
		}
		return result;
	}

	// 회원 탈퇴 delete
	public boolean deleteCustomer(CustomerVO invo) {

		conn = JDBC.getConnection();
		String sql = "delete from customer where id = ?";

		boolean result = false;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, invo.getId());
			pstmt.executeUpdate();
			result = true;
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JDBC.Close(conn, pstmt);
		}
		return result;
	}

	// 회원가입 시 아이디 중복확인
	public boolean checkID(String id) { // ID 중복 검사

		conn = JDBC.getConnection();
		String sql = "select * from customer where id = ?";

		boolean exist = false;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				exist = true;
			}

			rs.close();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JDBC.Close(conn, pstmt);
		}
		return exist;
	}
}
