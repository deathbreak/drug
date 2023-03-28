package com.utils;

public class Boolean_tiaoxingma {
    private final static String reg = "[0-9]{6,22}";
    private final static String reg2 = "^\\d{4}-\\d{2}-\\d{2}$";

    /**
     * 用于校验条形码格式
     * reg = "[0-9]{6,22}"
     *
     * @param param
     * @return
     */
    public static boolean CheckParam(String param) {
        return param.matches(reg);
    }

    public static boolean Checkdate(String date) {
        return date.matches(reg2);
    }
}
