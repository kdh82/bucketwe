package com.dgit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.MessageVO;

@Repository
public class MessageDAOImpl implements MessageDAO {
	
	@Autowired
	private SqlSession session;
	
	private static String namespace = "com.dgit.mapper.messageMapper";
	
	@Override
	public List<MessageVO> listMessage() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".listMessage");
	}

	@Override
	public void create(MessageVO vo) throws Exception {
		session.insert(namespace+".create", vo);

	}

	@Override
	public void update(MessageVO vo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteMess(int mno) throws Exception {
		// TODO Auto-generated method stub
			session.delete(namespace+".deleteMess", mno);
	}

	@Override
	public int count(int mno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".count", mno);
	}

	@Override
	public MessageVO readMessage(int mno) throws Exception {
		MessageVO vo = session.selectOne(namespace+".read", mno);
		return vo;
	}

}
