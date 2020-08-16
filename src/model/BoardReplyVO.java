package model;

public class BoardReplyVO {
	
	private int sequence;
	private int replycount;
	
	
	
	public BoardReplyVO() {}

	




	public BoardReplyVO(int sequence, int replycount) {
		super();
		this.sequence = sequence;

		this.replycount = replycount;
	}





	public int getSequence() {
		return sequence;
	}

	public void setSequence(int sequence) {
		this.sequence = sequence;
	}







	public int getReplycount() {
		return replycount;
	}






	public void setReplycount(int replycount) {
		this.replycount = replycount;
	}
	
	
	
}
