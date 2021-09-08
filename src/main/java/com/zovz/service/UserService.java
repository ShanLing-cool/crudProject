package com.zovz.service;

import com.zovz.domain.Role;
import com.zovz.domain.User;

import java.util.List;

/**
 * @author ：zovz
 * @date ：Created in 2021/9/4 16:32
 * @description：
 * @version: $
 */
public interface UserService {
    Boolean find(String username, String password);

    Boolean save(String username, String password);

    Boolean saveRole(String roleName, String rolePhone, String roleIdentity);

    List<Role> list();

    void deleteRole(String id);
}
