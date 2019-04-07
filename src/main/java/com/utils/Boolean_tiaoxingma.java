package com.utils;

public class Boolean_tiaoxingma {
		private final static String reg = "[0-9]{6,22}";
		/**用于校验条形码格式
		 * reg = "[0-9]{6,22}"
		 * @param param
		 * @return
		 */
		public static boolean CheckParam(String param) {                                                                             
            return param.matches(reg);                                
    }
}
