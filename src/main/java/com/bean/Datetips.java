package com.bean;

//效期提示
public class Datetips {
	private String drugname;
	private String changshang;
	private String beginprice;
	private String price;
	private String date;
	private String pihao;
	private String beizhu;
	private String location;
	private String count;
	private String unit;
	private String guige;
	private String tip;
	private String flag;   //颜色判断r|y
	public Datetips(){}
	public Datetips(String drugname, String changshang, String beginprice,
			String price, String date, String pihao, String beizhu,
			String location, String count, String unit, String guige,
			String tip, String flag) {
		super();
		this.drugname = drugname;
		this.changshang = changshang;
		this.beginprice = beginprice;
		this.price = price;
		this.date = date;
		this.pihao = pihao;
		this.beizhu = beizhu;
		this.location = location;
		this.count = count;
		this.unit = unit;
		this.guige = guige;
		this.tip = tip;
		this.flag = flag;
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
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
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
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	
}
