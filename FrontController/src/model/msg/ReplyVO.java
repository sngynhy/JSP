package model.msg;

import java.util.Date;

public class ReplyVO {
	
	private int r_id;
	private int m_id;
	private String u_id;
	private Date rdate;
	private String rmsg;
	
	public int getR_id() {
		return r_id;
	}
	public void setR_id(int r_id) {
		this.r_id = r_id;
	}
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
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	public String getRmsg() {
		return rmsg;
	}
	public void setRmsg(String rmsg) {
		this.rmsg = rmsg;
	}

}
