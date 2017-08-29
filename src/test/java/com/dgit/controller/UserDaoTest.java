package com.dgit.controller;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.domain.UserVO;
import com.dgit.persistence.UserDAO;
import com.dgit.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class UserDaoTest {

	@Autowired
	private UserDAO dao;
	
	@Inject
	private UserService service;
	
	private static Logger logger = LoggerFactory.getLogger(UserDaoTest.class);
	
/*	@Test
	public void testCreateUser() throws Exception{
		UserVO vo = new UserVO();
		
		vo.setId("test01");
		vo.setPw("test01");
		vo.setName("김두환");
		vo.setEmail("bbb@gmail.com");
	
		dao.createUser(vo);
	}*/
/*	@Test
	public void testUpdateUser() throws Exception{
		UserVO vo = new UserVO();
		vo.setId("test01");
		vo.setPw("test01");
		vo.setName("김소미");
		vo.setEmail("reina@gmail.com");
		
		dao.updateUser(vo);
	}*/
	/*	@Test
	public void testUpdate() throws Exception {
		ReplyVO vo = new ReplyVO();
		vo.setBno(176);
		vo.setRno(26);
		vo.setReplyText("test");
		vo.setId("user01");
		dao.update(vo);
	}*/
	
	@Test
	public void testSelectUser() throws Exception{
		dao.selectUser("test01");
	}
}
