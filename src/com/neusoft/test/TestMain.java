package com.neusoft.test;


import com.neusoft.dao.Imple.RoleDaoImple;
import com.neusoft.pojo.Role;
import com.neusoft.pojo.User;

import com.neusoft.util.PageInfo;
import org.junit.Test;


import java.util.List;

public class TestMain {

    @Test
    public void testQueryTotalCount() {
        int i = new RoleDaoImple().getTotalCount();
        System.out.println(i);
    }

    @Test
    public void testFenye() {

        PageInfo pageInfo = new PageInfo();
        pageInfo.setBeginRow(0);
        pageInfo.setPageSize(5);
        pageInfo.setCurrentPageIndex(1);
        List<Role> roles = new RoleDaoImple().pageQueryAll(pageInfo);
        for (Role role : roles) {
            System.out.println(role.getRoleName());
        }

    }
}
