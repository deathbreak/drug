package com.bean;

import java.util.List;
/**
 * for return Json
 *
 *
 */
public class RxpersonJson {
	private List<Rxperson> rxperson;
	private List<Rxdrug> rxdrug;
	
	public List<Rxperson> getRxperson() {
		return rxperson;
	}

	public void setRxperson(List<Rxperson> rxperson) {
		this.rxperson = rxperson;
	}

	public List<Rxdrug> getRxdrug() {
		return rxdrug;
	}

	public void setRxdrug(List<Rxdrug> rxdrug) {
		this.rxdrug = rxdrug;
	}

	public RxpersonJson() {}

	public RxpersonJson(List<Rxperson> rxperson, List<Rxdrug> rxdrug) {
		super();
		this.rxperson = rxperson;
		this.rxdrug = rxdrug;
	}
	
}
