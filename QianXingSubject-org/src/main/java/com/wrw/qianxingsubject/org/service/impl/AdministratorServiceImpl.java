package com.wrw.qianxingsubject.org.service.impl;

import static com.wrw.qianxingsubject.common.AssertThrowUtil.*;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wrw.qianxingsubject.common.JsonResult;
import com.wrw.qianxingsubject.common.ThisSystemException;
import com.wrw.qianxingsubject.org.dao.AdministratorMapper;
import com.wrw.qianxingsubject.org.dto.AdministratorDTO;
import com.wrw.qianxingsubject.org.entity.Administrator;
import com.wrw.qianxingsubject.org.service.AdministratorService;


@Service
public class AdministratorServiceImpl implements AdministratorService{

	@Autowired
	AdministratorMapper administratorDao;
	
	@Override
	public Administrator login(AdministratorDTO adminDTO) {
		Administrator admin = administratorDao.select("admin_name", adminDTO.getAdminName());
		if(admin == null) {
			throw new ThisSystemException("账号不存在");
		}
		if(!admin.getAdminPassword().equals(adminDTO.getAdminPassword())) {
			throw new ThisSystemException("密码错误");
		}
		
		return admin;
	}

	@Override
	public void updatePassword(AdministratorDTO adminDTO) {
		
		//验证参数
		assertNotNulll("id空了！！！", adminDTO.getId());
		$("原密码空了！！！", adminDTO.getAdminPassword());
		$("新密码空了！！！", adminDTO.getNewPwd());
		//找到要操作的用户并验证
		Administrator admin = administratorDao.select("id", adminDTO.getId());
		assertNotNulll("seeion里没有admin", admin);
		//验证旧密码
		assertEquals("旧密码不正确", admin.getAdminPassword(), adminDTO.getAdminPassword());
		//更新密码
		administratorDao.updatePassword(adminDTO);
	}

	@Override
	public List<Administrator> findAllUserInfo() {
		return administratorDao.findAllAdminInfo();
	}

	//pagehelper分页查询用户信息
	@Override
	public JsonResult findAllUserCT(Integer id) {
		//第几页，一页6个
		PageHelper.startPage(id,6);
		List<Administrator> findAllUserCT = administratorDao.findAllAdminInfo();
		PageInfo<Administrator> pageInfo = new PageInfo<>(findAllUserCT);
		
		JsonResult jsonResult = new JsonResult();
		jsonResult.setObj(pageInfo);
		jsonResult.setSuccess(true);
		return jsonResult;
	}

	@Override
	public Administrator findById(long id) {
		//验证参数
		assertNotNulll("id空了！！！",id);
		Administrator admin = administratorDao.select("id", id);
		return admin;
	}

	/*
	 * 创建管理员
	 */
	@Override
	public void createAdmin(AdministratorDTO adminDTO) {
		//验证参数
		assertNotNulll("用户名空了！！！",adminDTO.getAdminName());
		assertNotNulll("密码空了！！！",adminDTO.getAdminPassword());
		assertNotNulll("昵称空了！！！",adminDTO.getAdminNicename());
		
		adminDTO.setAdminRegistered(new Date());
		administratorDao.insert(adminDTO);
	}

	/*
	 * 修改管理员
	 */
	@Override
	public void editAdmin(AdministratorDTO adminDTO) {
		administratorDao.update(adminDTO);
	}

}
