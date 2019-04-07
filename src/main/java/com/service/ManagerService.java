package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;



import org.springframework.stereotype.Service;

import com.bean.Manager;
import com.mapper.ManagerMapper;

@Service
public class ManagerService {
	@Autowired
	ManagerMapper manager;
	
	public List<Manager> QueryUserService(String username) {
		return manager.QueryUserByName(username);
	}
}
