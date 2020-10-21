package com.neusoft.servlet;

import com.neusoft.dao.Imple.RoleDaoImple;
import com.neusoft.pojo.Role;
import com.neusoft.service.RoleService;
import com.neusoft.service.serviceImple.RoleServiceImple;
import com.neusoft.util.PageInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

@WebServlet("/findRoleByIdServlet")
public class FindRoleByIdServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setCharacterEncoding("utf-8");
            resp.setContentType("text/html;charset=UTF-8");
        } catch (UnsupportedEncodingException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        HttpSession session = req.getSession();
        String id = req.getParameter("SelectRoleNo");
        String name = req.getParameter("SelectRoleName");
        List<Role> roles = new RoleServiceImple().findRoleById(name, id);
        req.setAttribute("roles", roles);
        req.getRequestDispatcher(req.getContextPath() + "/files/jueseguanli.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
