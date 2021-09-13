package model.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.common.DBCP;

public class BookDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;

	// 모든 데이터 조회
	public ArrayList<BookVO> getDBList() {

		conn = DBCP.getConnection();
		ArrayList<BookVO> datas = new ArrayList<BookVO>();

		try {
			String sql = "select * from book";

			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				BookVO data = new BookVO();
				data.setBnum(rs.getInt("bnum"));
				data.setTitle(rs.getString("title"));
				data.setAuthor(rs.getString("author"));
				data.setGenre(rs.getString("genre"));
				data.setSummary(rs.getString("summary"));
				datas.add(data);
			}

			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCP.Close(conn, pstmt);
		}
		return datas;
	}

	// 책 title 클릭 시 해당 데이터 정보 조회
	public BookVO getDBData(BookVO invo) {

		conn = DBCP.getConnection();
		BookVO outvo = null;

		String sql = "select * from book where bnum = ?"; // 최근 게시글부터 조회

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, invo.getBnum());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				outvo = new BookVO();
				outvo.setBnum(rs.getInt("bnum"));
				outvo.setTitle(rs.getString("title"));
				outvo.setAuthor(rs.getString("author"));
				outvo.setGenre(rs.getString("genre"));
				outvo.setSummary(rs.getString("summary"));
			}

			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCP.Close(conn, pstmt);
		}
		return outvo;
	}

	// 데이터 추가
	public boolean insertDB(BookVO invo) {

		conn = DBCP.getConnection();
		boolean result = false;

		String sql = "insert into book (bnum, title, author, genre, summary) values (nvl((select max(bnum) from book),0)+1, ?, ?, ?, ?)";

		try {			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, invo.getTitle());
			pstmt.setString(2, invo.getAuthor());
			pstmt.setString(3, invo.getGenre());
			pstmt.setString(4, invo.getSummary());
			pstmt.executeUpdate();

			result = true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCP.Close(conn, pstmt);
		}
		return result;
	}

	// 게시글 삭제
	public boolean deleteDB(BookVO invo) {

		conn = DBCP.getConnection();
		boolean result = false;

		String sql = "delete from book where bnum = ?";

		try {			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, invo.getBnum());
			pstmt.executeUpdate();

			result = true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCP.Close(conn, pstmt);
		}
		return result;
	}

	// 게시글 수정
	public boolean updateDB(BookVO invo) {

		conn = DBCP.getConnection();
		boolean result = false;

		String sql = "update book set title = ?, author = ?, genre = ?, summary = ? where bnum = ?";

		try {			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, invo.getTitle());
			pstmt.setString(2, invo.getAuthor());
			pstmt.setString(3, invo.getGenre());
			pstmt.setString(4, invo.getSummary());
			pstmt.setInt(5, invo.getBnum());
			pstmt.executeUpdate();

			result = true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCP.Close(conn, pstmt);
		}
		return result;
	}
}
