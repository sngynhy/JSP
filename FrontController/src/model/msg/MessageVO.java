package model.msg;

import java.util.Date;

public class MessageVO {
	
	private int m_id;
	private String u_id;
	private String msg; // 댓글
	private int favcount; // 좋아요 개수
	private int replycount; // 대댓글 개수
	private Date mdate;
	
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getFavcount() {
		return favcount;
	}
	public void setFavcount(int favcount) {
		this.favcount = favcount;
	}
	public int getReplycount() {
		return replycount;
	}
	public void setReplycount(int replycount) {
		this.replycount = replycount;
	}
	public Date getMdate() {
		return mdate;
	}
	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}
	
}
