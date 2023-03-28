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

    public synchronized Boolean AddUser(Manager _manager) {
        String username = _manager.getUser();
        if (!"".equals(username) && !(null == username)) {
            int check = manager.CountUserByName(_manager.getUser());
            if (check == 0) {
                manager.AddNewUser(_manager);
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    public List<Manager> GetClerk() {
        return manager.GetAllClerk();
    }

    public void DelClerk(String username) {
        manager.DelClerk(username);
    }
}
