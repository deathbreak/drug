package com.bean;


import java.text.SimpleDateFormat;
import java.util.Date;



import javax.validation.constraints.Future;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;

import org.springframework.format.annotation.DateTimeFormat;



public class Store {
		
		private String drugname;
		private String changshang;
		
		@Pattern(regexp = "^[1-9]\\d*\\.\\d*|^0\\.\\d*[1-9]\\d*$|^\\d+$",message = "数字格式有误")
		@NotBlank(message="bp不能为空")
		private String beginprice;
		
		@Pattern(regexp = "^[1-9]\\d*\\.\\d*|^0\\.\\d*[1-9]\\d*$|^\\d+$",message = "数字格式有误")
		@NotBlank(message="pri不能为空")
		private String price;
		
		@Past
		@DateTimeFormat(pattern="yyyy-MM-dd")
		//@Pattern(regexp = "^\\d{4}-\\d{2}-\\d{2}$$",message = "日期格式有误")
		private Date begindate;
		
		
		@Future
		@DateTimeFormat(pattern="yyyy-MM-dd")
		//@Pattern(regexp = "^\\d{4}-\\d{2}-\\d{2}$",message = "日期格式有误")
		private Date date;
		
		
		
		@Pattern(regexp = "^.{1,30}$",message = "格式错误或超过字数限制")
		@NotBlank(message="ph不能为空")
		private String pihao;
		private String beizhu;
		private String location;
		
		@Pattern(regexp = "^[1-9]\\d*|0$",message = "数字格式有误")
		@NotBlank(message="kc不能为空")
		private String count;
		private String unit;
		private String guige;
		private String tiaoxingma;
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
		public String getTiaoxingma() {
			return tiaoxingma;
		}
		public void setTiaoxingma(String tiaoxingma) {
			this.tiaoxingma = tiaoxingma;
		}
		
		public String getBegindate() {
			return new SimpleDateFormat("yyyy-MM-dd").format(begindate);
		}
		public void setBegindate(Date begindate) {
			this.begindate = begindate;
		}
		public String getDate() {
			return new SimpleDateFormat("yyyy-MM-dd").format(date);
		}
		public void setDate(Date date) {
			this.date = date;
		}
		@Override
		public String toString() {
			return "Store [drugname=" + drugname + ", changshang=" + changshang
					+ ", beginprice=" + beginprice + ", price=" + price
					+ ", begindate=" + begindate + ", date=" + date
					+ ", pihao=" + pihao + ", beizhu=" + beizhu + ", location="
					+ location + ", count=" + count + ", unit=" + unit
					+ ", guige=" + guige + ", tiaoxingma=" + tiaoxingma + "]";
		}
		public Store(String drugname, String changshang, String beginprice,
				String price, Date begindate, Date date, String pihao,
				String beizhu, String location, String count, String unit,
				String guige, String tiaoxingma) {
			super();
			this.drugname = drugname;
			this.changshang = changshang;
			this.beginprice = beginprice;
			this.price = price;
			this.begindate = begindate;
			this.date = date;
			this.pihao = pihao;
			this.beizhu = beizhu;
			this.location = location;
			this.count = count;
			this.unit = unit;
			this.guige = guige;
			this.tiaoxingma = tiaoxingma;
		}
		public Store(){}
		
}
