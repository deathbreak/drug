package com.bean;

public class Rxperson {
		private String time; //购药时间
		private String name; //顾客姓名
		private String gendar; //性别
		private String age; //年龄
		private String phone; //联系方式
		private String location; //通讯地址
		private String hospital; //医疗机构名称
		private String htime; //就医日期
		private String yz; //医嘱内容
		private String ysname; //医师姓名
		private String zdys; //驻店药师签名
		public String getTime() {
			return time;
		}
		public void setTime(String time) {
			this.time = time;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getGendar() {
			return gendar;
		}
		public void setGendar(String gendar) {
			this.gendar = gendar;
		}
		public String getAge() {
			return age;
		}
		public void setAge(String age) {
			this.age = age;
		}
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
		}
		public String getLocation() {
			return location;
		}
		public void setLocation(String location) {
			this.location = location;
		}
		public String getHospital() {
			return hospital;
		}
		public void setHospital(String hospital) {
			this.hospital = hospital;
		}
		public String getHtime() {
			return htime;
		}
		public void setHtime(String htime) {
			this.htime = htime;
		}
		public String getYz() {
			return yz;
		}
		public void setYz(String yz) {
			this.yz = yz;
		}
		public String getYsname() {
			return ysname;
		}
		public void setYsname(String ysname) {
			this.ysname = ysname;
		}
		public String getZdys() {
			return zdys;
		}
		public void setZdys(String zdys) {
			this.zdys = zdys;
		}
		public Rxperson() {}
		public Rxperson(String time, String name, String gendar, String age, String phone, String location,
				String hospital, String htime, String yz, String ysname, String zdys) {
			super();
			this.time = time;
			this.name = name;
			this.gendar = gendar;
			this.age = age;
			this.phone = phone;
			this.location = location;
			this.hospital = hospital;
			this.htime = htime;
			this.yz = yz;
			this.ysname = ysname;
			this.zdys = zdys;
		}
		
}
