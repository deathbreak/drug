package com.bean;

public class Json {
		private String first;
		private String second;
		private String three;
		private String four;
		private String five;
		private int six;
		public String getFirst() {
			return first;
		}
		public void setFirst(String first) {
			this.first = first;
		}
		public String getSecond() {
			return second;
		}
		public void setSecond(String second) {
			this.second = second;
		}
		public String getThree() {
			return three;
		}
		public void setThree(String three) {
			this.three = three;
		}
		public String getFour() {
			return four;
		}
		public void setFour(String four) {
			this.four = four;
		}
		public String getFive() {
			return five;
		}
		public void setFive(String five) {
			this.five = five;
		}
		public int getSix() {
			return six;
		}
		public void setSix(int six) {
			this.six = six;
		}
		public Json(){}
		public Json(String first, String second, String three, String four,
				String five, int six) {
			super();
			this.first = first;
			this.second = second;
			this.three = three;
			this.four = four;
			this.five = five;
			this.six = six;
		}
}
