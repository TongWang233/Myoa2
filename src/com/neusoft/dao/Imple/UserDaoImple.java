package com.neusoft.dao.Imple;

import com.neusoft.dao.UserDao;
import com.neusoft.pojo.User;
import com.neusoft.util.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDaoImple implements UserDao {
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    @Override
    public User userLogin(String name, String pwd) {
        User user = null;
        try {
            //����������ݿ����
            conn = DBUtils.getConn();
            //Ԥ����sql���
            pstmt = conn.prepareStatement("select * from t_user where user_name=? and user_password=?");
            //����ռλ��
            pstmt.setString(1, name);
            pstmt.setString(2, pwd);
            //ִ��sql���
            rs = pstmt.executeQuery();
            //��������
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setCreate_date(rs.getTimestamp("create_date"));
                user.setUser_department(rs.getInt("user_department"));
                user.setUser_role(rs.getInt("user_role"));
                user.setUser_sex(rs.getString("user_sex"));
                user.setUser_name(rs.getString("user_name"));
                user.setUser_password(rs.getString("user_password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeAll(rs, pstmt, conn);
        }
        return user;
    }
}
