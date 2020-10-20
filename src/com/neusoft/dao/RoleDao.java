package com.neusoft.dao;

import com.neusoft.pojo.Role;
import com.neusoft.pojo.User;
import com.neusoft.util.PageInfo;

import java.util.List;

public interface RoleDao {
    public List<Role> findAllRole();

    public int delRoleById(int id);

    public List<Role> findRoleById(String sql);

    public int updateRole(int id, String name);

    public int addRole(Role role);

    //查询总记录数
    public int getTotalCount();

    //分页查询
    public List<Role> pageQueryAll(PageInfo pageInfo);
}
