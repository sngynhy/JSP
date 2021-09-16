package model.msg;

import java.util.ArrayList;

public class MsgSet {
	
	private MessageVO message;
	private ArrayList<ReplyVO> rlist = new ArrayList<ReplyVO>();
	
	public MessageVO getMessage() {
		return message;
	}
	public void setMessage(MessageVO message) {
		this.message = message;
	}
	public ArrayList<ReplyVO> getRlist() {
		return rlist;
	}
	public void setRlist(ArrayList<ReplyVO> rlist) {
		this.rlist = rlist;
	}
	@Override
	public String toString() {
		return "MsgSet [message=" + message + ", rlist=" + rlist + "]";
	}

}
