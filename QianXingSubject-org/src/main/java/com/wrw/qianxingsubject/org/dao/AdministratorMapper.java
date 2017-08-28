package com.wrw.qianxingsubject.org.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wrw.qianxingsubject.common.dao.AbstractDao;
import com.wrw.qianxingsubject.org.dto.AdministratorDTO;
import com.wrw.qianxingsubject.org.entity.Administrator;


/**
 * @author wrw
 * 管理员Mapper
 */
public interface AdministratorMapper extends AbstractDao<Administrator>{

	void updatePassword(AdministratorDTO adminDTO);
	
	List<Administrator>  findAllAdminInfo();
}
