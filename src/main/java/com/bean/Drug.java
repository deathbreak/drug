package com.bean;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

public class Drug {
	@Pattern(regexp = "^.{1,22}$",message = "格式错误或超过字数限制")
	@NotBlank(message="dn不能为空")
	private String drugname;
	
	@Pattern(regexp = "^.{1,22}$",message = "格式错误或超过字数限制")
	@NotBlank(message="cs不能为空")
	private String changshang;
	
	@Pattern(regexp = "^.{1,22}$",message = "格式错误或超过字数限制")
	@NotBlank(message="bz不能为空")
	private String beizhu;
	
	@Pattern(regexp = "^.{1,22}$",message = "格式错误或超过字数限制")
	@NotBlank(message="loc不能为空")
	private String location;
	
	@Pattern(regexp = "^.{1,10}$",message = "格式错误或超过字数限制")
	@NotBlank(message="unit不能为空")
	private String unit;
	
	@Pattern(regexp = "^.{1,22}$",message = "格式错误或超过字数限制")
	@NotBlank(message="gg不能为空")
	private String guige;
	
	@Pattern(regexp = "^$|^[0-9]{6,22}$",message = "格式错误或超过字数限制")
	private String tiaoxingma;
	public Drug(){}
	public Drug(String drugname, String changshang, String beizhu,
			String location, String unit, String guige, String tiaoxingma) {
		super();
		this.drugname = drugname;
		this.changshang = changshang;
		this.beizhu = beizhu;
		this.location = location;
		this.unit = unit;
		this.guige = guige;
		this.tiaoxingma = tiaoxingma;
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
	@Override
	public String toString() {
		return "Drug [drugname=" + drugname + ", changshang=" + changshang
				+ ", beizhu=" + beizhu + ", location=" + location + ", unit="
				+ unit + ", guige=" + guige + ", tiaoxingma=" + tiaoxingma
				+ "]";
	}
}
