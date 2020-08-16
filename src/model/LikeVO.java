package model;

public class LikeVO {

	
	private String id;
	private int sequence;
	private String like;
	public LikeVO(String id, int sequence, String like) {
		super();
		this.id = id;
		this.sequence = sequence;
		this.like = like;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getSequence() {
		return sequence;
	}
	public void setSequence(int sequence) {
		this.sequence = sequence;
	}
	public String getLike() {
		return like;
	}
	public void setLike(String like) {
		this.like = like;
	}


	
	
	
}
