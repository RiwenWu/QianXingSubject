package serviceTest;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wrw.qianxingsubject.common.dto.QueryResult;
import com.wrw.qianxingsubject.org.entity.AdminRole;
import com.wrw.qianxingsubject.org.entity.Role;
import com.wrw.qianxingsubject.org.service.impl.AdminRoleService;
import com.wrw.qianxingsubject.org.service.impl.AdministratorServiceImpl;
import com.wrw.qianxingsubject.org.service.impl.RoleService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class AdminRoleServiceTest {

	@Resource
	AdministratorServiceImpl adminService;
	@Resource
	RoleService roleService;
	@Resource
	AdminRoleService adminRoleService;
	
	@Test
	public void insertTest() {
		AdminRole ar = new AdminRole();
		ar.setAdminRoleId(2);
		ar.setAdminId((long)1);
		ar.setRoleId(3);
		adminRoleService.insert(ar);
	}

	@Test
	public void insertSelectiveTest() {
		AdminRole ar = new AdminRole();
		ar.setAdminId((long)2);
		ar.setRoleId(2);
		adminRoleService.insertSelective(ar);
	}
	
	@Test
	public void deleteByPrimaryKeyTest() {
		adminRoleService.deleteByPrimaryKey(2);
	}
	
	@Test
	public void saveOrUpdateTest() {
		AdminRole ar = new AdminRole();
		ar.setAdminId((long)2);
		ar.setRoleId(2);
		adminRoleService.saveOrUpdate(ar);
	}
	
	@Test
	public void saveOrUpdateTest2() {
		AdminRole ar = new AdminRole();
		ar.setAdminId((long)18);
		ar.setRoleId(3);
		adminRoleService.saveOrUpdate(ar);
	}
	
	@Test
	public void listMapTest(){
		QueryResult<AdminRole> queryResult = new QueryResult();
		Map<String, Object> map = new HashMap();
		map.put("adminId", (long)2);
		queryResult = adminRoleService.list(map);
		System.out.println(queryResult.getCount());
		for(AdminRole ar : queryResult.getQueryResult()) {
			System.out.println(ar.toString());
			Role r = roleService.selectByPrimaryKey(ar.getRoleId());
			System.out.println(r.toString());
		}
	}
	
	@Test
	public void listTest() {
		QueryResult<AdminRole> queryResult = new QueryResult();
		queryResult = adminRoleService.list();
		System.out.println(queryResult.getCount());
		for(AdminRole ar : queryResult.getQueryResult()) {
			System.out.println(ar.toString());
		}
	}
	
	@Test
	public void listClzzTest() {
		QueryResult<AdminRole> qr = new QueryResult();
		AdminRole ar = new AdminRole();
		ar.setAdminId((long)2);
		qr = adminRoleService.list(ar);
		System.out.println(qr.getCount());
		for(AdminRole ar2 : qr.getQueryResult()) {
			System.out.println(ar2.toString());
		}
	}
}
