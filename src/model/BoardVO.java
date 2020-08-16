package model;

public class BoardVO {
	
	private int sequence;
	private String title;
	private String writer;
	private String content;
	private String time;
	private int viewcount;
	private int recommend_cnt;
	
	public BoardVO() {}

	



	public BoardVO(int sequence, String title, String writer, String content, String time, int viewcount,
			int recommend_cnt) {
		super();
		this.sequence = sequence;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.time = time;
		this.viewcount = viewcount;
		this.recommend_cnt = recommend_cnt;
		
	}





	public int getSequence() {
		return sequence;
	}

	public void setSequence(int sequence) {
		this.sequence = sequence;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public String getTime() {
		return time;
	}



	public void setTime(String time) {
		this.time = time;
	}



	public int getViewcount() {
		return viewcount;
	}

	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}

	public int getRecommend_cnt() {
		return recommend_cnt;
	}

	public void setRecommend_cnt(int recommend_cnt) {
		this.recommend_cnt = recommend_cnt;
	}
	
	





	





	@Override
	public String toString() {
		return "BoardVO [sequence=" + sequence + ", title=" + title + ", writer=" + writer + ", content=" + content
				+ ", time=" + time + ", viewcount=" + viewcount + ", recommend_cnt=" + recommend_cnt + "]";
	}
	
	
	
}
