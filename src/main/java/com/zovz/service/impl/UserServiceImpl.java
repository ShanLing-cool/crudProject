package com.zovz.service.impl;

import com.zovz.dao.UserDao;
import com.zovz.domain.Role;
import com.zovz.domain.User;
import com.zovz.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author ：zovz
 * @date ：Created in 2021/9/4 16:34
 * @description：
 * @version: $
 */
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    public Boolean find(String username, String password) {
        if (userDao.find(username, password)) {
            return true;
        } else {
            return false;
        }
    }

    public Boolean save(String username, String password) {
        if (userDao.save(username, password)) {
            return true;
        } else {
            return false;
        }
    }

    public Boolean saveRole(String roleName, String rolePhone, String roleIdentity) {
        if (userDao.saveRole(roleName, rolePhone, roleIdentity)) {
            return true;
        } else {
            return false;
        }
    }

    public List<Role> list() {
        List<Role> list = userDao.list();
        return list;
    }

    public void deleteRole(String id) {
        userDao.deleteRole(id);
    }
}
