package com.bean;

public class Limitsell {

    private String drugname;

    private String changshang;

    private int amount;


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

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Limitsell(String drugname, String changshang, int amount) {
        this.drugname = drugname;
        this.changshang = changshang;
        this.amount = amount;
    }
}
