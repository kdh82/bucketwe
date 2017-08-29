package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.MessageVO;

public interface MessageDAO {
	public List<MessageVO> listMessage() throws Exception;
	public void create(MessageVO vo) throws Exception;
	public void update(MessageVO vo) throws Exception;
	public MessageVO readMessage(int mno) throws Exception;
	public void deleteMess(int mno) throws Exception;	
	public int count(int mno) throws Exception;
}
