package com.bean;

import java.util.HashMap;
import java.util.Map;

public class Msg {
	private int status_code;
	private boolean flag;
	private Map<String,Object> Msgcontext = new HashMap<String,Object>();
	public static Msg success() {
		Msg re = new Msg();
		re.setStatus_code(100);
		re.setFlag(true);
		return re;
	}
	public static Msg fail() {
		Msg re = new Msg();
		re.setStatus_code(200);
		re.setFlag(false);
		return re;
	}
	public Msg add(String attr,Object obj) {
		this.getMsgcontext().put(attr, obj);
		return this;
	}
	public int getStatus_code() {
		return status_code;
	}
	public void setStatus_code(int status_code) {
		this.status_code = status_code;
	}
	public boolean isFlag() {
		return flag;
	}
	public void setFlag(boolean flag) {
		this.flag = flag;
	}
	public Map<String, Object> getMsgcontext() {
		return Msgcontext;
	}
	public void setMsgcontext(Map<String, Object> msgcontext) {
		Msgcontext = msgcontext;
	}
	
}
