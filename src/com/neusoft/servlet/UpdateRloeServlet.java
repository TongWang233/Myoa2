package com.neusoft.servlet;

import com.neusoft.dao.Imple.RoleDaoImple;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

@WebServlet("/updateRloeServlet")
public class UpdateRloeServlet extends HttpServlet {
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
        int result = new RoleDaoImple().updateRole(Integer.parseInt(id), name);
        if (result != 0) {
            session.setAttribute("delmesg", "update success");
            req.getRequestDispatcher("pageRolesServlet?cp=1").forward(req, resp);
        } else {
            session.setAttribute("delmesg", "Update failed");
            req.getRequestDispatcher("pageRolesServlet").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
