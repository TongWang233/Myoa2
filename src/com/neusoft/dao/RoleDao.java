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

    //��ѯ�ܼ�¼��
    public int getTotalCount();

    //��ҳ��ѯ
    public List<Role> pageQueryAll(PageInfo pageInfo);
}
