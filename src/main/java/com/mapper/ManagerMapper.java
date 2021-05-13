package com.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bean.Manager;

@Repository
public interface ManagerMapper {
		List<Manager> QueryUserByName(String username);
		int CountUserByName(String username);
		void AddNewUser(Manager manager);
		List<Manager> GetAllClerk();
		void DelClerk(String username);
}
