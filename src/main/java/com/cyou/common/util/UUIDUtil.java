package com.cyou.common.util;

import java.util.Random;
import java.util.UUID;

public class UUIDUtil {
	public static String getUUID(){
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	/**
	 * 
	 * @return
	 */
	public static String getOrderId(){
		long l =  System.currentTimeMillis();
		StringBuffer sb = new StringBuffer();
        String str = "0123456789";
        Random r = new Random();
        for(int i=0;i < 4;i++){
            int num = r.nextInt(str.length());
            sb.append(str.charAt(num));
            str = str.replace((str.charAt(num)+""), "");
        }
        return l + sb.toString();
	}
	public static void main(String[] args) {
		System.out.println(getOrderId());
		
	}
}
