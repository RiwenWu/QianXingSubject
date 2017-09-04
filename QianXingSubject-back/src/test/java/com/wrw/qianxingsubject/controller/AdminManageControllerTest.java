package com.wrw.qianxingsubject.controller;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.*;  
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.*;  
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;  
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*; 

@SuppressWarnings("deprecation")
@RunWith(SpringJUnit4ClassRunner.class)  
@WebAppConfiguration 
@ContextConfiguration(locations = { "classpath:applicationContext.xml", "classpath:spring-mvc.xml"})
//当然 你可以声明一个事务管理 每个单元测试都进行事务回滚 无论成功与否  
@Rollback(value = true)  
//记得要在XML文件中声明事务哦~~~我是采用注解的方式  
@Transactional 
public class AdminManageControllerTest {
	

	@Autowired  
	private WebApplicationContext wac;
	
	private MockMvc mockMvc;
	 
	@Before
    public void setup() {
        this.mockMvc = webAppContextSetup(this.wac).build();
    }

}
