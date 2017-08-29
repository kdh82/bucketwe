package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.MessageVO;
import com.dgit.persistence.MessageDAO;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	private MessageDAO dao;
	
	
	
	@Override
	public void addMessage(MessageVO vo) throws Exception {
		dao.create(vo);
		
	}

	@Override
	public List<MessageVO> listMessage() throws Exception {
		// TODO Auto-generated method stub
		return dao.listMessage();
	}

	@Override
	public void modifyMessage(MessageVO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeMessage(int mno) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteMess(mno);
	}

	@Override
	public int count(int mno) throws Exception {
		// TODO Auto-generated method stub
		return dao.count(mno);
	}


}
