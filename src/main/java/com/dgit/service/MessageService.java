package com.dgit.service;

import java.util.List;

import com.dgit.domain.MessageVO;

public interface MessageService {
	public void addMessage(MessageVO vo) throws Exception;
	public List<MessageVO> listMessage() throws Exception;
	public void modifyMessage(MessageVO vo) throws Exception;
	public void removeMessage(int mno) throws Exception;
	public int count(int mno) throws Exception;
}
