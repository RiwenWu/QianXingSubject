package serviceTest;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

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

}
