package com.wrw.qianxingsubject.org.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wrw.qianxingsubject.org.entity.Administrator;

/**
 * @author wrw
 * 管理员Mapper
 */
public interface AdministratorMapper {

	/*
	 * 动态插入
	 */
	int insert(Administrator admin);
	
	/*
	 * 按主键删除
	 */
	int deleteById(Long id);
	
	/*
	 * 按主键更新
	 */
	int updataById(Long id);
	
	/*
	 * 按名字查询
	 */
	Administrator selectByAdminName(@Param("adminName") String adminName);
}
