package com.wrw.qianxingsubject.common.service;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wrw.qianxingsubject.common.dao.MapperSupport;
import com.wrw.qianxingsubject.common.dto.QueryResult;

public abstract class ServiceSupport<T> implements IServiceSupport<T> {

	public abstract MapperSupport<T> getMapperSupport();
	
	@Override
	public void insert(T clazz) {
		this.getMapperSupport().insert(clazz);
	}

	@Override
	public void insertSelective(T clazz) {
		this.getMapperSupport().insertSelective(clazz);
	}

	@Override
	public void deleteByPrimaryKey(Integer id) {
		this.getMapperSupport().deleteByPrimaryKey(id);
	}

	@Override
	public void updateByPrimaryKey(Integer id) {
		this.getMapperSupport().updateByPrimaryKey(id);
	}

	@Override
	public void updateByPrimaryKeySelective(T clazz) {
		this.getMapperSupport().updateByPrimaryKeySelective(clazz);
	}

	@Override
	public void saveOrUpdate(T clazz) {
		try {
			Method method = clazz.getClass().getMethod("getId");
			Object object = method.invoke(clazz);
			if (object != null) {
				this.updateByPrimaryKeySelective(clazz);
			} else {
				this.insertSelective(clazz);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public T selectByPrimaryKey(Integer id) {
		return this.getMapperSupport().selectByPrimaryKey(id);
	}

	@Override
	public QueryResult<T> list() {
		Map<String, Object> params = new HashMap<String, Object>();
		return this.list(params);
	}

	@Override
	public QueryResult<T> list(Map<String, Object> params) {
		QueryResult<T> queryResult = new QueryResult<>();
		List<T> list = this.getMapperSupport().selectByMapParams(params);
		Integer count = this.getMapperSupport().countByMapParams(params);
		queryResult.setQueryResult(list);
		queryResult.setCount(count);
		return queryResult;
	}

	@Override
	public QueryResult<T> list(T clazz) {
		QueryResult queryResult = new QueryResult<>();
		List<T> list = this.getMapperSupport().selectByEntityParams(clazz);
		Integer count = this.getMapperSupport().countByEntityParams(clazz);
		queryResult.setQueryResult(list);
		queryResult.setCount(count);
		return queryResult;
	}

}
