package com.zovz.dao.impl;

import com.zovz.dao.UserDao;
import com.zovz.domain.Role;
import com.zovz.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;
import java.util.Map;

/**
 * @author ：zovz
 * @date ：Created in 2021/9/4 16:33
 * @description：
 * @version: $
 */
public class UserDaoImpl implements UserDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public Boolean find(String username, String password) {

        String s = null;
        try {
            s = jdbcTemplate.queryForObject("select password from user where username = ?", String.class, username);
        } catch (EmptyResultDataAccessException e) {
            return false;
        }

        return password.equals(s);
    }

    public boolean save(String username, String password) {

        int update = jdbcTemplate.update("insert into user(username,password) values (?,?)", username, password);
        if (update != 0) {
            return true;
        } else {
            return false;
        }
    }

    public boolean saveRole(String roleName, String rolePhone, String roleIdentity) {
        int update = jdbcTemplate.update("insert into role(roleName,rolePhone,roleIdentity) values (?,?,?)", roleName, rolePhone, roleIdentity);
        if (update != 0) {
            return true;
        } else {
            return false;
        }
    }

    public List<Role> list() {
        List<Role> roleList = jdbcTemplate.query("select * from role", new BeanPropertyRowMapper<Role>(Role.class));
        return roleList;
    }

    public void deleteRole(String id) {
        jdbcTemplate.update("delete from role where id = ?", id);
    }
}
