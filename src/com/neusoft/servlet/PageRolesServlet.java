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
        String cp = req.getParameter("cp");
        String pageNum = req.getParameter("pageNum");
        int c = 0;
        int num = 0;
        if (cp != null && !cp.equals("")) {
            c = Integer.parseInt(cp);
        } else {
            c = 1;
        }
        if (pageNum != null && !pageNum.equals("")) {
            num = Integer.parseInt(pageNum);
        } else {
            num = 5;
        }
        HttpSession session = req.getSession();
        session.setAttribute("cp", cp);
        session.setAttribute("pageNum", pageNum);
        //�����ҳ����
        //�����ҳ����
        PageInfo pageInfo = new PageInfo();
        //�ܼ�¼��
        pageInfo.setTotalCount(new RoleDaoImple().getTotalCount());
        //ÿҳ��ʾ��¼��
        pageInfo.setPageSize(num);
        //��ҳ�洫�ݹ�����ҳ��
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
