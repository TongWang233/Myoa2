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

@WebServlet("/delSelectRoleServlet")
public class DelSelectRoleServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setCharacterEncoding("UTF-8");
            resp.setContentType("text/html;charset=UTF-8");
        } catch (UnsupportedEncodingException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        int count = 0;
        HttpSession session = req.getSession();
        String[] uids = req.getParameterValues("checkbox");
        if (uids != null && uids.length > 0) {
            for (String id : uids) {
                count = count + new RoleDaoImple().delRoleById(Integer.parseInt(id));
            }
        }
        if (count == uids.length) {
            session.setAttribute("delmesg", "delSuccess");
            req.getRequestDispatcher("pageRolesServlet?cp=1").forward(req, resp);
        } else {
            session.setAttribute("delmesg", "delfalse");
            req.getRequestDispatcher("pageRolesServlet?cp=1").forward(req, resp);
        }

    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
