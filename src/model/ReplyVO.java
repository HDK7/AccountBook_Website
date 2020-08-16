package model;

public class ReplyVO {
	private int replyseq;
	private int boardseq;
	private String id;
	private String name;
	private String content;
	private String w_date;	
	
	public ReplyVO() {}
	
	public ReplyVO(int boardseq, String id, String name, String content, String w_date) {
		this.boardseq = boardseq;
		this.id = id;
		this.name = name;
		this.content = content;
		this.w_date = w_date;
	}
	
	

	public ReplyVO(int replyseq, int boardseq, String id, String name, String content, String w_date) {
		super();
		this.replyseq = replyseq;
		this.boardseq = boardseq;
		this.id = id;
		this.name = name;
		this.content = content;
		this.w_date = w_date;
	}

	@Override
	public String toString() {
		return "replyseq : "  + replyseq +
				 "boardseq : " + boardseq +
				 "id : " + id +
				 "name : " + name +
				 "content : " + content +
				 "w_date : " + w_date;
	}

	public int getReplyseq() {
		return replyseq;
	}

	public void setReplyseq(int replyseq) {
		this.replyseq = replyseq;
	}

	public int getBoardseq() {
		return boardseq;
	}

	public void setBoardseq(int boardseq) {
		this.boardseq = boardseq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getW_date() {
		return w_date;
	}

	public void setW_date(String w_date) {
		this.w_date = w_date;
	}

	
		
	
}
