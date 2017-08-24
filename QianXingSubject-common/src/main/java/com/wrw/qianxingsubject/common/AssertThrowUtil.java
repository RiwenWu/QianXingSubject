package com.wrw.qianxingsubject.common;

public class AssertThrowUtil {

	public static String assetNotBlank(String message, String target) {
		
		if(target == null || (target = target.trim()).length() == 0) {
			throw new ThisSystemException(message);
		}
		return target;
	}
	
	public static String $(String message, String target) {
		return assetNotBlank(message, target);
	}
	
	public static void assertNotNulll(String message, Object o) {
		if (o == null)
			throw new ThisSystemException(message);
	}
	
	public static void assertNulll(String message, Object o) {
		if (o != null)
			throw new ThisSystemException(message);
	}
	
	public static void assertNotEquals(String message, Object o1, Object o2) {
		if (o1 == null ? o1 ==o2 : o1.equals(o2))
			throw new ThisSystemException(message);
	}
	
	public static void assertEquals(String message, Object o1, Object o2) {
		if (o1 == null ? o1 !=o2 : !o1.equals(o2))
			throw new ThisSystemException(message);
	}
}
