package com.utils;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class StringPro {
    public static String add(String str1, String str2) {//加法
        BigDecimal b1 = new BigDecimal(str1);
        BigDecimal b2 = new BigDecimal(str2);
        return b1.add(b2).toString();
    }

    public static String sub(String str1, String str2) {//减法
        BigDecimal b1 = new BigDecimal(str1);
        BigDecimal b2 = new BigDecimal(str2);
        return b1.subtract(b2).toString();
    }

    public static String mul(String str1, String str2) {//乘法
        BigDecimal b1 = new BigDecimal(str1);
        BigDecimal b2 = new BigDecimal(str2);
        return b1.multiply(b2).toString();
    }

    /*	public static String div(String str1,String str2){
            BigDecimal b1=new BigDecimal(str1);
            BigDecimal b2=new BigDecimal(str2);
            return b1.divide(b2,DEF_DIV_SCALE,BigDecimal.ROUND_HALF_UP).toString();
        }
    */
    public static int daysBetween(String nowdate, String bdate) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        cal.setTime(sdf.parse(nowdate));
        long time1 = cal.getTimeInMillis();
        cal.setTime(sdf.parse(bdate));
        long time2 = cal.getTimeInMillis();
        long between_days = (time2 - time1) / (1000 * 3600 * 24);

        return Integer.parseInt(String.valueOf(between_days));
    }
}