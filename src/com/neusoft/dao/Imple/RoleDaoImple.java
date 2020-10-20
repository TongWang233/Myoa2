package com.neusoft.dao.Imple;

import com.neusoft.dao.RoleDao;
import com.neusoft.pojo.Role;
import com.neusoft.pojo.User;
import com.neusoft.util.DBUtils;
import com.neusoft.util.PageInfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RoleDaoImple implements RoleDao {
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    @Override
    public List<Role> findAllRole() {
        ArrayList<Role> roles = new ArrayList();
        Role role = null;
        try {
            conn = DBUtils.getConn();
            pstmt = conn.prepareStatement("select * from t_role");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                role = new Role();
                role.setId(rs.getInt("id"));
                role.setRoleName(rs.getString("roleName"));
                roles.add(role);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeAll(rs, pstmt, conn);
        }
        return roles;
    }

    @Override
    public int delRoleById(int id) {
        int Count = 0;
        try {
            conn = DBUtils.getConn();
            pstmt = conn.prepareStatement("delete from t_role where id=?");
            pstmt.setInt(1, id);
            Count = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeAll(rs, pstmt, conn);
        }
        return Count;
    }

    @Override
    public List<Role> findRoleById(String sql) {
        Role role = null;
        ArrayList<Role> roles = new ArrayList();
        try {
            //获得连接数据库对象
            conn = DBUtils.getConn();
            //预编译sql语句
            pstmt = conn.prepareStatement(sql);
            //处理结果集
            rs = pstmt.executeQuery();
            while (rs.next()) {
                role = new Role();
                role.setId(rs.getInt("id"));
                role.setRoleName(rs.getString("roleName"));
                roles.add(role);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeAll(rs, pstmt, conn);
        }
        return roles;
    }

    @Override
    public int updateRole(int id, String name) {
        int Count = 0;
        try {
            conn = DBUtils.getConn();
            pstmt = conn.prepareStatement("update t_role set Rolename=? where id=?");
            pstmt.setString(1, name);
            pstmt.setInt(2, id);
            Count = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeAll(rs, pstmt, conn);
        }
        return Count;
    }

    @Override
    public int addRole(Role role) {
        int Count = 0;
        try {
            conn = DBUtils.getConn();
            pstmt = conn.prepareStatement("insert  into t_role(rolename,id) values (?,?)");
            pstmt.setString(1, role.getRoleName());
            pstmt.setInt(2, role.getId());
            Count = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeAll(rs, pstmt, conn);
        }
        return Count;
    }

    @Override
    public int getTotalCount() {
        int result = 0;
        try {
            conn = DBUtils.getConn();
            pstmt = conn.prepareStatement("select count(*) from t_role");
            rs = pstmt.executeQuery();
            if (rs.next()) {
                result = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeAll(rs, pstmt, conn);
        }
        return result;
    }

    @Override
    public List<Role> pageQueryAll(PageInfo pageInfo) {
        List<Role> roles = new ArrayList<>();
        Role role = null;

        try {
            conn = DBUtils.getConn();
            pstmt = conn.prepareStatement("select * from t_role limit ?,?");
            pstmt.setInt(1, pageInfo.getBeginRow());
            pstmt.setInt(2, pageInfo.getPageSize());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                role = new Role();
                role.setId(rs.getInt("id"));
                role.setRoleName(rs.getString("roleName"));
                roles.add(role);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeAll(rs, pstmt, conn);
        }

        return roles;
    }
}
