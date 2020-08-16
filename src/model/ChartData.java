package model;

public class ChartData {
	private int price;
	private String category;
	
	public ChartData(int price, String category) {
		super();
		this.price = price;
		this.category = category;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "ChartData [price=" + price + ", category=" + category + "]";
	}
	
	
	
	
}
