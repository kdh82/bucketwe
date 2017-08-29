package com.dgit.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.domain.Criteria;
import com.dgit.domain.ReplyVO;
import com.dgit.persistence.ReplyDAO;
import com.dgit.service.ReplyService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class ReplyDaoTest {

	@Autowired
	private ReplyDAO dao;
		
	@Inject
	private ReplyService service;

	private static Logger logger = LoggerFactory.getLogger(BoardDaoTest.class);

/*	@Test
	public void testCredate() throws Exception {
		ReplyVO vo = new ReplyVO();
		vo.setReplyText("수고하십니다");
		vo.setRregDate(new Date());
		vo.setBno(823);
		vo.setId("user03");
		dao.create(vo);

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
	
/*	@Test
	public void testDelete() throws Exception{
		ReplyVO vo = new ReplyVO();
		
		dao.delete(25);
	}*/
	
	
	/*@Test
	public void testRead() {
		try {
			logger.info(dao.read(1).toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testUpdate() throws Exception {
		BoardVo vo = new BoardVo();
		vo.setBno(1);
		vo.setTitle("수정된 제목");
		vo.setContent("수정된 테스트 내용");
		dao.update(vo);
	}*/
	
	/*@Test
	public void testDelete() throws Exception {
		dao.dalete(1);
	}*/
	
	/*@Test
	public void testListAll() throws Exception {
		logger.info(dao.listAll().toString());
	}*/
	
	/*@Test
	public void testListPage() throws Exception {
		int page = 2;
		List<BoardVo> list = dao.listPage(page);
		
		for(BoardVo boardVo : list) {
			logger.info(boardVo.getBno() + " : " + boardVo.getTitle());
		}
	}*/
	
	/*@Test
	public void testListCriteria() throws Exception {
		Criteria cri = new Criteria();
		cri.setPage(2);
		cri.setPerPageNum(20);
		
		List<BoardVo> list = dao.listCriteria(cri);
		
		for(BoardVo boardVo : list) {
			logger.info(boardVo.getBno() + " : " + boardVo.getTitle());
		}
	}*/
}
