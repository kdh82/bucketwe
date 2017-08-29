package com.dgit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.BoardVO;
import com.dgit.domain.Criteria;
import com.dgit.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Autowired
	private SqlSession session;
	
	private static String namespace = "com.dgit.persistence.ReplyDAO";
	
	@Override
	public List<ReplyVO> list(int bno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".list", bno);
	}

	@Override
	public void create(ReplyVO ro) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".create", ro);
	}

	@Override
	public void update(ReplyVO ro) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".update", ro);
	}

	@Override
	public void delete(int rno) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".delete", rno);
	}

	@Override
	public List<ReplyVO> listPage(int bno, Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map  = new HashMap<>();
		map.put("bno", bno);
		map.put("cri", cri);
		return session.selectList(namespace+".listPage", map);
	}

	@Override
	public int count(int bno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".count", bno);
	}

	@Override
	public int getBno(int rno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".getBno", rno);
	}

	@Override
	public ReplyVO read2(int rno) throws Exception {
		// TODO Auto-generated method stub
		ReplyVO vo = session.selectOne(namespace+".read", rno);
		return vo;
		
	}

}
