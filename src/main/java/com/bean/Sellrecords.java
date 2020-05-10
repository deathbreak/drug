package com.bean;

public class Sellrecords {
	private String drugname;
	private String changshang;
	private String beginprice;
	private String price;
	private String date;
	private String pihao;
	private String beizhu;	
	private String unit;
	private String guige;
	private String amount;
	private String sum;
	private String selltime;

	@Override
	public String toString() {
		return "Sellrecords{" +
				"drugname='" + drugname + '\'' +
				", changshang='" + changshang + '\'' +
				", beginprice='" + beginprice + '\'' +
				", price='" + price + '\'' +
				", date='" + date + '\'' +
				", pihao='" + pihao + '\'' +
				", beizhu='" + beizhu + '\'' +
				", unit='" + unit + '\'' +
				", guige='" + guige + '\'' +
				", amount='" + amount + '\'' +
				", sum='" + sum + '\'' +
				", selltime='" + selltime + '\'' +
				'}';
	}

	public Sellrecords(){}
	public Sellrecords(String drugname, String changshang, String beginprice, String price, String date, String pihao, String beizhu, String unit, String guige, String amount, String sum, String selltime) {
		this.drugname = drugname;
		this.changshang = changshang;
		this.beginprice = beginprice;
		this.price = price;
		this.date = date;
		this.pihao = pihao;
		this.beizhu = beizhu;
		this.unit = unit;
		this.guige = guige;
		this.amount = amount;
		this.sum = sum;
		this.selltime = selltime;
	}

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

	public String getBeginprice() {
		return beginprice;
	}

	public void setBeginprice(String beginprice) {
		this.beginprice = beginprice;
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

	public String getSelltime() {
		return selltime;
	}

	public void setSelltime(String selltime) {
		this.selltime = selltime;
	}
}
