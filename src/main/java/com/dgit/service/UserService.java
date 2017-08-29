package com.dgit.service;

import com.dgit.domain.UserVO;

public interface UserService {
	public void createUser(UserVO vo) throws Exception;
	public UserVO selectUser(String id) throws Exception;
	public UserVO login(String id, String pw) throws Exception;
	public void updateUser(UserVO vo) throws Exception;
	public UserVO allUser(String id) throws Exception;
}
