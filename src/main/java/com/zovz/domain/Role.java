package com.zovz.domain;

/**
 * @author ：zovz
 * @date ：Created in 2021/9/4 16:51
 * @description：
 * @version: $
 */
public class Role {
    private int id;
    private String roleName;
    private String rolePhone;
    private String roleIdentity;

    public int getId() {
        return id;
    }

    @Override
    public String toString() {
        return "Role{" +
                "id=" + id +
                ", roleName='" + roleName + '\'' +
                ", rolePhone='" + rolePhone + '\'' +
                ", roleIdentity='" + roleIdentity + '\'' +
                '}';
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRolePhone() {
        return rolePhone;
    }

    public void setRolePhone(String rolePhone) {
        this.rolePhone = rolePhone;
    }

    public String getRoleIdentity() {
        return roleIdentity;
    }

    public void setRoleIdentity(String roleIdentity) {
        this.roleIdentity = roleIdentity;
    }

}
