package serviceTest;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wrw.qianxingsubject.common.JsonResult;
import com.wrw.qianxingsubject.org.dto.AdministratorDTO;
import com.wrw.qianxingsubject.org.entity.Administrator;
import com.wrw.qianxingsubject.org.service.AdministratorService;

import junit.framework.Assert;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class AdminService {

	@Resource
	AdministratorService administratorService;
	
	@Test
	public void loginTest() {
		AdministratorDTO adminDTO = new AdministratorDTO();
		adminDTO.setAdminName("wrw");
		adminDTO.setAdminPassword("123456");
		Administrator admin = administratorService.login(adminDTO);
		System.out.println(admin.getAdminPassword());
		Assert.assertEquals("123456", admin.getAdminPassword());
	}

	@Test
	public void updatePasswordTest() {
		AdministratorDTO adminDTO = new AdministratorDTO();
		adminDTO.setId((long)1);
		adminDTO.setAdminPassword("123456");
		adminDTO.setNewPwd("654321");
		administratorService.updatePassword(adminDTO);
	}
	
	@Test
	public void findAllUserInfoTest() {
		List<Administrator> admins = new ArrayList<Administrator>();
		admins = administratorService.findAllUserInfo();
		
		for (Administrator admin : admins) {
			System.out.println(admin.toString());
		}
	}
	
	@Test
	public void findAllUserCTTest() {
		JsonResult jsonResult = new JsonResult();
		jsonResult = administratorService.findAllUserCT(1);
		System.out.println(jsonResult.getObj());
	}
	
	@Test
	public void findByIdTest() {
		Administrator admin = administratorService.findById((long)1);
		System.out.println(admin.getAdminName());
	}
	
	@Test
	public void createAdmin() {
		AdministratorDTO adminDTO = new AdministratorDTO();
		adminDTO.setAdminName("测试");
		adminDTO.setAdminPassword("123456");
		adminDTO.setAdminRegistered(new Date());
		administratorService.createAdmin(adminDTO);
	}
}
