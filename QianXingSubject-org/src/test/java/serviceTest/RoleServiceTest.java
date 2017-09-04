package serviceTest;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wrw.qianxingsubject.common.dto.QueryResult;
import com.wrw.qianxingsubject.org.entity.Role;
import com.wrw.qianxingsubject.org.service.impl.RoleService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class RoleServiceTest {

	@Resource
	RoleService roleService;
	
	@Test
	public void insertTest() {
		Role r = new Role();
		r.setRoleName("超级管理员");
//		r.setRoleDesc("超级了，还用说明吗");
		r.setRoleCreatetime(new Date());
		roleService.insert(r);
	}

	@Test
	public void listTest() {
		QueryResult<Role> queryResult = new QueryResult();
		queryResult = roleService.list();
		System.out.println(queryResult.getCount());
		List<Role> rolelist = queryResult.getQueryResult();
		for(Role r : rolelist) {
			System.out.println(r.toString());
		} 
	}
	
	@Test
	public void listMapTest() {
		Map<String, Object> map = new HashMap<>();
		map.put("roleId", 3);
		QueryResult<Role> queryResult = new QueryResult();
		queryResult = roleService.list(map);
		System.out.println(queryResult.getCount());
		System.out.println(queryResult.getQueryResult());
	}
	
	@Test
	public void listClazzTest() {
		Role r = new Role();
		r.setRoleId(2);
		QueryResult<Role> queryResult = new QueryResult();
		queryResult = roleService.list(r);
		System.out.println(queryResult.getCount());
	}
}
