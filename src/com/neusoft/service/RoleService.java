package com.neusoft.service;

import com.neusoft.pojo.Role;

import java.util.List;

public interface RoleService {
    public List<Role> findRoleById(String name, String id);
}
