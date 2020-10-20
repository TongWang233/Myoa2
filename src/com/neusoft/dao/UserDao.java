package com.neusoft.dao;

import com.neusoft.pojo.User;

public interface UserDao {
    public User userLogin(String name, String pwd);
}
