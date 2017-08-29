package com.dgit.controller;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.domain.MessageVO;
import com.dgit.persistence.MessageDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class MessageDaoTest {
	
	@Autowired
	private MessageDAO dao;
	
	@Test
	public void testlist() throws Exception {
		MessageVO vo = new MessageVO();
		List<MessageVO> list = dao.listMessage();
		for(MessageVO b : list){
			System.out.println(b.getMessage());
		}
	}

}
