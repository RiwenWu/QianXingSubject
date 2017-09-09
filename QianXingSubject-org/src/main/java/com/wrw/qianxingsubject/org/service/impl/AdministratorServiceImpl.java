package com.wrw.qianxingsubject.org.service.impl;

import static com.wrw.qianxingsubject.common.AssertThrowUtil.$;
import static com.wrw.qianxingsubject.common.AssertThrowUtil.assertEquals;
import static com.wrw.qianxingsubject.common.AssertThrowUtil.assertNotNulll;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wrw.qianxingsubject.common.JsonResult;
import com.wrw.qianxingsubject.common.ThisSystemException;
import com.wrw.qianxingsubject.org.dao.AdminRoleMapper;
import com.wrw.qianxingsubject.org.dao.AdministratorMapper;
import com.wrw.qianxingsubject.org.dao.RoleMapper;
import com.wrw.qianxingsubject.org.dto.AdministratorDTO;
import com.wrw.qianxingsubject.org.entity.AdminRole;
import com.wrw.qianxingsubject.org.entity.Administrator;
import com.wrw.qianxingsubject.org.service.AdministratorService;


@Service
@Transactional
public class AdministratorServiceImpl implements AdministratorService{

	@Autowired
	AdministratorMapper administratorDao;
	@Autowired
	AdminRoleMapper adminRoleDao;
	@Autowired
	RoleMapper roleDao;
	
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
	 * 新增用户  Or 修改用户
	 * 
	 */
	@Override
	public void addOrUpdata(AdministratorDTO adminDTO) {
		
		AdminRole newar = new AdminRole();
		try {
			if (adminDTO.getId() == 0  ) {
				adminDTO.setAdminRegistered(new Date());
				administratorDao.insert(adminDTO);
				
				//先找到新增admin的id
				//再在admin 和 role 的中间表 插入他们的对应关系
				Long newAdminId = administratorDao.select("admin_name", adminDTO.getAdminName()).getId();
				newar.setAdminId(newAdminId);
				newar.setRoleId(adminDTO.getRoleId());
				adminRoleDao.insertSelective(newar);
			} else {
				administratorDao.update(adminDTO);
				
				//先找到admin对应的role这条数据的Id
				newar.setAdminId(adminDTO.getId());
				List<AdminRole> arList= adminRoleDao.selectByEntityParams(newar);

				//再修改(感觉这样写有点傻)
				AdminRole newar1 = new AdminRole();
				newar1.setAdminRoleId(arList.get(0).getAdminRoleId());
				newar1.setAdminId(adminDTO.getId());
				newar1.setRoleId(adminDTO.getRoleId());
				adminRoleDao.updateByPrimaryKeySelective(newar1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
