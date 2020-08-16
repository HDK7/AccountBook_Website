package model;

public class hhYearVO {	// 월별 데이터를 받을 그릇
	private String yearmonth; // 연도-월
	private int money_sum; // 수입,지출의 합
	
	@Override
	public String toString() {
		return "hhYearVO [yearmonth=" + yearmonth + ", money_sum=" + money_sum + "]";
	}
	
	public hhYearVO(String yearmonth, int money_sum) {
		super();
		this.yearmonth = yearmonth;
		this.money_sum = money_sum;
	}
	
	public String getYearmonth() {
		return yearmonth;
	}
	
	public void setYearmonth(String yearmonth) {
		this.yearmonth = yearmonth;
	}
	
	public int getMoney_sum() {
		return money_sum;
	}
	
	public void setMoney_sum(int money_sum) {
		this.money_sum = money_sum;
	}
}
