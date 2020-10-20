package com.neusoft.servlet;

import com.neusoft.dao.Imple.RoleDaoImple;
import com.neusoft.dao.Imple.UserDaoImple;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

@WebServlet("/delRoleByIdServlet")
public class DelRoleByIdServlet extends HttpServlet {
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
        String id = req.getParameter("id");
        int result = new RoleDaoImple().delRoleById(Integer.parseInt(id));
        if (result != 0) {
            session.setAttribute("delmesg", "É¾³ý³É¹¦");
            req.getRequestDispatcher("pageRolesServlet?cp=1").forward(req, resp);
        } else {
            session.setAttribute("delmesg", "É¾³ýÊ§°Ü");
            req.getRequestDispatcher("pageRolesServlet?cp=1").forward(req, resp);
        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
