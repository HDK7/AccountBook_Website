package model;

public class categoryVO {
	String category;
	String date;
	int price;
	public categoryVO(String category, String date, int price) {
		super();
		this.category = category;
		this.date = date;
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
	
}
