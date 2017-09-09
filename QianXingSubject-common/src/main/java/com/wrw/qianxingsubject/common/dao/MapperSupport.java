package com.wrw.qianxingsubject.common.dao;

import java.util.List;
import java.util.Map;


/**
 * @author wrw
 *	dao公共类，另一个是跟视频学的，感觉不怎么好，所以换一个，之前的暂时代码不想改了
 * @param <T>
 */
public abstract interface MapperSupport<T>
{

	int deleteByPrimaryKey(Integer id);

    int insert(T entity);

    int insertSelective(T entity);

    T selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(T entity);

    int updateByPrimaryKey(Integer id);

	List<T> selectByMapParams(Map<String, Object> params);

	Integer countByMapParams(Map<String, Object> params);
	
	List<T> selectByEntityParams(T clazz);

	Integer countByEntityParams(T clazz);
	
	int deleteByParams(Map<String, Object> params);
	
}