package com.zovz.dao;

import com.zovz.domain.Role;
import com.zovz.domain.User;

import java.util.List;

/**
 * @author ：zovz
 * @date ：Created in 2021/9/4 16:33
 * @description：
 * @version: $
 */
public interface UserDao {
    Boolean find(String username, String password);

    boolean save(String username, String password);

    boolean saveRole(String roleName, String rolePhone, String roleIdentity);

    List<Role> list();

    void deleteRole(String id);
}
