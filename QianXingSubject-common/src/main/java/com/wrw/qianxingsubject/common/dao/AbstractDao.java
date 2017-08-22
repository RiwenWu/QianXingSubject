package com.wrw.qianxingsubject.common.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

/**
 * @author wrw
 * dao公共類
 * @param <T>
 */
public interface AbstractDao<T> {

	/*
	 * 增
	 */
	void insert(T t);
	
	/*
	 * 改
	 */
	void update(T t);
	
	/*
	 * 刪
	 */
	void delete(@Param("key") String ukfield, @Param("value") Object value);
	
	/*
	 * 查 
	 */
	T select(@Param("key") String ukfield, @Param("value") Object value);
	
	/*
	 * 是否存在
	 */
	boolean exsits(@Param("key") String ukfield, @Param("value") Object value);
	
	/*
	 * 模糊查詢
	 */
	List<T> seleclike(@Param("key") String key);
	
}
