package model;

public class newsVO {
	private String originallink;
	private String link;
	private String description;
	private String title;
	private String pubDate;
	
	
	
	@Override
	public String toString() {
		return "newsVO [originallink=" + originallink + ", link=" + link + ", description=" + description + ", title="
				+ title + ", pubDate=" + pubDate + "]";
	}

	public newsVO(String originallink, String link, String description, String title, String pubDate) {
		super();
		this.originallink = originallink;
		this.link = link;
		this.description = description;
		this.title = title;
		this.pubDate = pubDate;
	}
	
	public String getOriginallink() {
		return originallink;
	}
	public void setOriginallink(String originallink) {
		this.originallink = originallink;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPubDate() {
		return pubDate;
	}
	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}
	
	
	
}
