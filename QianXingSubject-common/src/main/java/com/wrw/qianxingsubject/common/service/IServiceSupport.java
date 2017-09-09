package com.wrw.qianxingsubject.common.service;

import java.util.Map;

import com.wrw.qianxingsubject.common.dto.QueryResult;

public interface IServiceSupport<T> {
	
	void insert(T clazz);

	void insertSelective(T clazz);

	void deleteByPrimaryKey(Integer id);

	void updateByPrimaryKey(Integer id);

	void updateByPrimaryKeySelective(T clazz);
	
	void saveOrUpdate(T clazz);

	T selectByPrimaryKey(Integer id);
	
	QueryResult<T> list();

	QueryResult<T> list(Map<String, Object> params);
	
	QueryResult<T> list(T clazz);
	
}
