package com.neusoft.service.serviceImple;

import com.neusoft.dao.Imple.RoleDaoImple;
import com.neusoft.dao.RoleDao;
import com.neusoft.pojo.Role;
import com.neusoft.service.RoleService;
import com.neusoft.util.StringUtil;

import java.sql.Timestamp;
import java.util.List;

public class RoleServiceImple implements RoleService {
    RoleDao roleDao = new RoleDaoImple();

    @Override
    public List<Role> findRoleById(String name, String id) {
        StringBuilder stringBuilder = new StringBuilder(
                "select * from t_role where 1=1 ");
        // 下面的语句 一定注意 添加单引号
        if (StringUtil.notEmpty(name)) {
            stringBuilder.append("and roleName like '" + name
                    + "%'         ");
        }
        if (StringUtil.notEmpty(id)) {
            stringBuilder.append("and id like '" + id
                    + "%'         ");
        }

        return roleDao.findRoleById(stringBuilder.toString());
    }
}

