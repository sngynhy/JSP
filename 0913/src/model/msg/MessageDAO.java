package model.msg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.common.JNDI;

public class MessageDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	
	// 모든 댓글 조회 cnt == 첫 화면에 보여질 댓글 수
	public ArrayList<MsgSet> selectAll(String u_id, int cnt) {
		
		conn = JNDI.getConnection();
		
		ArrayList<MsgSet> datas = new ArrayList<MsgSet>(); // output
		String sql;
		
		try {
			// 전체 댓글
			if((u_id == null) || u_id.equals("")) {
				sql = "select * from messages where rownum <= ? order by m_id asc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, cnt);
			} else { // 특정 회원 댓글 조회
				sql = "select * from messages where u_id = ? and rownum <= ? order by m_id asc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, u_id);
				pstmt.setInt(2, cnt);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MsgSet ms = new MsgSet();
				MessageVO mvo = new MessageVO(); // 댓글 데이터
				ArrayList<ReplyVO> rlist = new ArrayList<ReplyVO>(); // 대댓글 데이터
				
				// 모든 댓글 정보 저장
				mvo.setM_id(rs.getInt("m_id"));
				mvo.setU_id(rs.getString("u_id"));
				mvo.setMsg(rs.getString("msg"));
				mvo.setFavcount(rs.getInt("favcount"));
				mvo.setReplycount(rs.getInt("replycount"));
				mvo.setMdate(rs.getDate("mdate"));
				
				// m_id에 대한 대댓글 정보 저장
				String rsql = "select * from reply where m_id = ? order by rdate asc";
				pstmt = conn.prepareStatement(rsql);
				pstmt.setInt(1, rs.getInt("m_id"));
				ResultSet rrs = pstmt.executeQuery(); // 대댓글의 조회 결과
				int rcnt = 0; // 대댓글 개수
				while(rrs.next()) {
					ReplyVO rvo = new ReplyVO();
					rvo.setR_id(rrs.getInt("r_id"));
					rvo.setM_id(rrs.getInt("m_id"));
					rvo.setU_id(rrs.getString("u_id"));
					rvo.setRdate(rrs.getDate("rdate"));
					rvo.setRmsg(rrs.getString("rmsg"));
					rlist.add(rvo);
					rcnt++; // 데이터가 불려올 때마다 +1하여 전체 개수 카운트
				}
				mvo.setReplycount(rcnt); // m_id에 대한 전체 대댓글 개수 저장
				
				ms.setMessage(mvo); // 조회된 댓글 데이터 저장
				ms.setRlist(rlist); // 조회된 대댓글 데이터 저장
				datas.add(ms);
				
				rrs.close();
			}
			rs.close();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JNDI.Close(conn, pstmt);
		}

		return datas;
	}
	
public ArrayList<MsgSet> selectAll() {
		
		conn = JNDI.getConnection();
		
		ArrayList<MsgSet> datas = new ArrayList<MsgSet>(); // output
		String sql;
		
		try {
			sql = "select * from messages order by mdate asc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MsgSet ms = new MsgSet();
				MessageVO mvo = new MessageVO(); // 댓글 데이터
				ArrayList<ReplyVO> rlist = new ArrayList<ReplyVO>(); // 대댓글 데이터
				
				// 모든 댓글 정보 저장
				mvo.setM_id(rs.getInt("m_id"));
				mvo.setU_id(rs.getString("u_id"));
				mvo.setMsg(rs.getString("msg"));
				mvo.setFavcount(rs.getInt("favcount"));
				mvo.setReplycount(rs.getInt("replycount"));
				mvo.setMdate(rs.getDate("mdate"));
				
				// m_id에 대한 대댓글 정보 저장
				String rsql = "select * from reply where m_id = ? order by rdate asc";
				pstmt = conn.prepareStatement(rsql);
				pstmt.setInt(1, rs.getInt("m_id"));
				ResultSet rrs = pstmt.executeQuery(); // 대댓글의 조회 결과
				int rcnt = 0; // 대댓글 개수
				while(rrs.next()) {
					ReplyVO rvo = new ReplyVO();
					rvo.setR_id(rrs.getInt("r_id"));
					rvo.setM_id(rrs.getInt("m_id"));
					rvo.setU_id(rrs.getString("u_id"));
					rvo.setRdate(rrs.getDate("rdate"));
					rvo.setRmsg(rrs.getString("rmsg"));
					rlist.add(rvo);
					rcnt++; // 데이터가 불려올 때마다 +1하여 전체 개수 카운트
				}
				mvo.setReplycount(rcnt); // m_id에 대한 전체 대댓글 개수 저장
				
				ms.setMessage(mvo); // 조회된 댓글 데이터 저장
				ms.setRlist(rlist); // 조회된 대댓글 데이터 저장
				datas.add(ms);
				
				rrs.close();
			}
			rs.close();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JNDI.Close(conn, pstmt);
		}

		return datas;
	}
	
	// 댓글 등록
	public boolean MSGinsert(MessageVO invo) {
		System.out.println("왜안돼");
		conn = JNDI.getConnection();
		String sql = "insert into messages (m_id, u_id, msg) values (nvl((select max(m_id) from messages),0)+1,?,?)";
			
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, invo.getU_id());
			pstmt.setString(2, invo.getMsg());
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JNDI.Close(conn, pstmt);
		}
		return true;
	}
	
	public boolean MSGdelete(MessageVO invo) {
		conn = JNDI.getConnection();
		String sql = "delete from messages where m_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, invo.getM_id());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			JNDI.Close(conn, pstmt);
		}
		return true;	
	}
	
	// 좋아요+1
	public void MSGupdate(MessageVO invo) {
		conn = JNDI.getConnection();
		String sql = "update messages set favcount = favcount + 1 where m_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, invo.getM_id());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			JNDI.Close(conn, pstmt);
		}
	}

}
