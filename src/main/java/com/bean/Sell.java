package com.bean;

public class Sell {
	private String drugname;
	private String changshang;	
	private String price;	
	private String date;
	private String pihao;
	private String beizhu;	
	private String count;
	private String unit;
	private String guige;
	private String amount;
	private String sum;
	public String getDrugname() {
		return drugname;
	}
	public void setDrugname(String drugname) {
		this.drugname = drugname;
	}
	public String getChangshang() {
		return changshang;
	}
	public void setChangshang(String changshang) {
		this.changshang = changshang;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getPihao() {
		return pihao;
	}
	public void setPihao(String pihao) {
		this.pihao = pihao;
	}
	public String getBeizhu() {
		return beizhu;
	}
	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getGuige() {
		return guige;
	}
	public void setGuige(String guige) {
		this.guige = guige;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getSum() {
		return sum;
	}
	public void setSum(String sum) {
		this.sum = sum;
	}
	public Sell(String drugname, String changshang, String price, String date,
			String pihao, String beizhu, String count, String unit,
			String guige, String amount, String sum) {
		super();
		this.drugname = drugname;
		this.changshang = changshang;
		this.price = price;
		this.date = date;
		this.pihao = pihao;
		this.beizhu = beizhu;
		this.count = count;
		this.unit = unit;
		this.guige = guige;
		this.amount = amount;
		this.sum = sum;
	}
	public Sell(){}
}
