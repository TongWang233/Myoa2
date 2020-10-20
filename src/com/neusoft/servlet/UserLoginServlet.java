package com.neusoft.servlet;

import com.neusoft.dao.Imple.UserDaoImple;
import com.neusoft.dao.UserDao;
import com.neusoft.pojo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

@WebServlet("/userLoginServlet")
public class UserLoginServlet extends HttpServlet {
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
        String psd = req.getParameter("userPassword");
        String name = req.getParameter("userName");
        UserDao userDao = new UserDaoImple();
        User user = userDao.userLogin(name, psd);
        if (user != null) {
            resp.sendRedirect("mainframe.html");
        } else {
            session.setAttribute("msg", "Login failed due to error password or userName");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
