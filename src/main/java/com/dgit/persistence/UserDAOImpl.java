package com.dgit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace="com.dgit.mappers.userMapper";
	
	@Override
	public void createUser(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".createUser", vo);
	}

	@Override
	public UserVO selectUser(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".selectUser", id);
	}

	@Override
	public UserVO login(String id, String pw) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		return sqlSession.selectOne(namespace+".login", map);
	}

	@Override
	public void updateUser(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".updateUser", vo);		
	}

	@Override
	public List<UserVO> selectAll() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".selectAll");
	}

	@Override
	public UserVO allUser(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".allUser", id);
	}
}
