package com.wrw.qianxingsubject.org.common;

public class ThisSystemUtil {

	public static String throwIfBlank(String message, String target) {
		
		if(target == null || (target = target.trim()).length() == 0) {
			throw new ThisSystemException(message);
		}
		return target;
	}
	
	public static String $(String message, String target) {
		return throwIfBlank(message, target);
	}
}
