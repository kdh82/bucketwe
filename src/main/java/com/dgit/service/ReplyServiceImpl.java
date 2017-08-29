package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dgit.domain.Criteria;
import com.dgit.domain.ReplyVO;
import com.dgit.persistence.BoardDAO;
import com.dgit.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDAO dao;
	
	@Autowired
	private BoardDAO boardDao;
	
	@Override
	public List<ReplyVO> listReply(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(bno);
	}
	@Transactional
	@Override
	public void addReply(ReplyVO ro) throws Exception {
		// TODO Auto-generated method stub
		dao.create(ro);
		boardDao.updateReplyCnt(ro.getBno(), 1);
	}

	@Override
	public void modifyReply(ReplyVO ro) throws Exception {
		// TODO Auto-generated method stub
		dao.update(ro);
	}
	
	@Transactional
	@Override
	public void removeReply(int rno) throws Exception {
		// TODO Auto-generated method stub
		int bno = dao.getBno(rno);
		dao.delete(rno);
		boardDao.updateReplyCnt(bno, -1);
	}

	@Override
	public List<ReplyVO> listPage(int bno, Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listPage(bno, cri);
	}
	
	@Override
	public int count(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.count(bno);
	}

}
