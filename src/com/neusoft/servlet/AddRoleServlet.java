package com.neusoft.servlet;

import com.neusoft.dao.Imple.RoleDaoImple;
import com.neusoft.pojo.Role;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

@WebServlet("/addRoleServlet")
public class AddRoleServlet extends HttpServlet {
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
        String id = req.getParameter("roleNo");
        String name = req.getParameter("roleName");
        Role role = new Role();
        role.setRoleName(name);
        role.setId(Integer.parseInt(id));
        int result = new RoleDaoImple().addRole(role);
        if (result != 0) {
            session.setAttribute("delmesg", "addSuccess");
            req.getRequestDispatcher("pageRolesServlet?cp=1").forward(req, resp);
        } else {
            session.setAttribute("delmesg", "add false due to the roleNo");
            req.getRequestDispatcher("pageRolesServlet?cp=1").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
