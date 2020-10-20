package com.neusoft.servlet;

import com.neusoft.dao.Imple.RoleDaoImple;
import com.neusoft.pojo.Role;
import com.neusoft.pojo.User;
import com.neusoft.util.PageInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/pageRolesServlet")
public class PageRolesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String cp = req.getParameter("cp");
        String pageNum = req.getParameter("pageNum");
        int c = 0;
        int num = 0;
        if (cp != null && !cp.equals("")) {
            c = Integer.parseInt(cp);
        } else {
            c = session.getAttribute("cp") != null ? (int) session.getAttribute("cp") : 1;
        }
        if (pageNum != null && !pageNum.equals("")) {
            num = Integer.parseInt(pageNum);
        } else {
            num = session.getAttribute("pageNum") != null ? (int) session.getAttribute("pageNum") : 3;
        }
        session.setAttribute("cp", c);
        session.setAttribute("pageNum", num);
        //构造分页对象
        //构造分页对象
        PageInfo pageInfo = new PageInfo();
        //总记录数
        pageInfo.setTotalCount(new RoleDaoImple().getTotalCount());
        //每页显示记录数
        pageInfo.setPageSize(num);
        //从页面传递过来的页号
        pageInfo.setCurrentPageIndex(c);
        List<Role> roles = new RoleDaoImple().pageQueryAll(pageInfo);
        req.setAttribute("page", pageInfo);
        req.setAttribute("roles", roles);
        req.getRequestDispatcher(req.getContextPath() + "/files/jueseguanli.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
