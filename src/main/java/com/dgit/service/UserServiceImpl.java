package com.dgit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.UserVO;
import com.dgit.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO dao;
	
	@Override
	public void createUser(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.createUser(vo);
	}

	@Override
	public UserVO selectUser(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectUser(id);
	}

	@Override
	public UserVO login(String id, String pw) throws Exception {
		// TODO Auto-generated method stub
		return dao.login(id, pw);
	}

	@Override
	public void updateUser(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.updateUser(vo);
	}

	@Override
	public UserVO allUser(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.allUser(id);
	}

}
