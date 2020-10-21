<%@ page contentType="text/html;charset=GB2312" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="0">
<html>
<script src="../js/jquery.js"></script>
<script type="text/javascript">

</script>
<style type="text/css">
    a {
        text-decoration: none;
    }
</style>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <title>角色列表</title>
    <link rel="stylesheet" href="../styles/style.css"
          type="text/css"/>
</head>
<%

    int pageIndex = (int) session.getAttribute("cp");
%>
<script type="text/javascript">
    <%
                String msg = (String) session.getAttribute("delmesg");
                if (msg!=""&&msg!=null) {
                    out.print("alert('"+msg+"');");
                    session.setAttribute("delmesg","");
                }

    %>

    function changePageNum(arg) {
        location.href = "pageRolesServlet"
            + "?cp=" + 1 + "&pageNum=" + arg + "";
    }

    //显示没也显示多少条数据
    $(function () {
        $("#pagenum option[value=${page.pageSize}]").attr(
            "selected", "select");
    });
    function delUser(id) {
        if (confirm("您确定删除本条记录吗?")) {
            location.href = "${pageContext.request.contextPath}/delRoleByIdServlet?id=" + id;
        }
    }

    window.onload = function () {
        document.getElementById("chkAll").onclick = function () {
            var cbs = document.getElementsByName("checkbox");
            for (var i = 0; i < cbs.length; i++) {
                cbs[i].checked = this.checked;
            }
        }

        document.getElementById("Submit").onclick = function () {
            if (confirm("你确定要删除选中的记录么")) {
                var flag = false;
                var cbs = document.getElementsByName("checkbox");
                for (var i = 0; i < cbs.length; i++) {
                    if (cbs[i].checked) {
                        flag = true;
                        break;
                    }
                }
                if (flag) {
                    document.forms[0].action = "${pageContext.request.contextPath}/delSelectRoleServlet";
                    document.forms[0].submit();
                }

            }

        }
    }
</script>
<body>
<form name="form1" method="post" action="findRoleByIdServlet">
    <div id="main_body">
        <ul class="main_top">
            <li class="main_top_left left">
                查询
                <BR>
            </li>
            <li class="main_top_right right">
            </li>
        </ul>
        <div class="main_content_rightbg">
            <div class="main_content_leftbg">
                <table width="80%" border="0" align=center cellpadding="2"
                       cellspacing="1" bgcolor="#FFFFFF" class="border">
                    <tr>
                        <td width="9%" align="center" class="tdbg">
                            <strong>角色编号</strong>
                        </td>
                        <td width="13%" align="left" class="tdbg">
                            <input type="text" name="SelectRoleNo"/>
                        </td>
                        <td width="9%" align.="center" class="tdbg">
                            <strong>角色名称</strong>
                        </td>
                        <td width="21%" align="left" class="tdbg">
                            <input name="SelectRoleName">
                        </td>
                        <td align="left" nowrap class="tdbg">
                            <input type="submit" name="Submit22" value=" 查 询  ">
                            <input type="button"
                                   onclick="location.href='${pageContext.request.contextPath}/files/jueseadd.jsp?roleName=&id='"
                                   value=" 新 建  ">
                        </td>
                    </tr>
                </table>

            </div>
        </div>

        <ul class="main_end">
            <li class="main_end_left left"></li>
            <li class="main_end_right right"></li>
        </ul>
        <!--******************************************** -->
        <ul class="main_top">
            <li class="main_top_left left">
                角色信息列表
                <BR>
            </li>
            <li class="main_top_right right">
            </li>
        </ul>
        <div class="main_content_rightbg">
            <div class="main_content_leftbg">

                <table width="80%" border="0" align=center cellpadding="2"
                       cellspacing="1" bgcolor="#FFFFFF" class="border">
                    <tr>
                        <td width="5%" align="center" nowrap class="tdbg">
                            <strong>选择</strong>
                        </td>
                        <td width="23%" align="center" class="tdbg">
                            <strong>角色编号</strong>
                        </td>
                        <td width="19%" align="center" class="tdbg">
                            <strong>角色名称</strong>
                        </td>

                        <td width="35%" align="center" nowrap class="tdbg">
                            <strong>操作</strong>
                        </td>
                    </tr>
                    <c:forEach items="${roles}" var="role" varStatus="s">
                        <tr>
                            <td align="left" class="tdbg">
                                <input type="checkbox" id="checkbox" name="checkbox" value="${role.id}">
                            </td>
                            <td align="center" class="tdbg">
                                    ${role.id}
                            </td>
                            <td align="center" class="tdbg">
                                    ${role.roleName}
                            </td>
                            <td align="center" class="tdbg">
                                <a href="javascript:delUser(${role.id})">删除</a>
                                <a href="${pageContext.request.contextPath}/files/jueseadd.jsp?roleName=${role.roleName}&id=${role.id}">修改</a>
                            </td>
                        </tr>
                    </c:forEach>

                </table>
                <table width="80%" border="0" align=center cellpadding="0"
                       cellspacing="0" bgcolor="#FFFFFF">
                    <tr>
                        <td width="10%" align="left" class="tdbg">
                            <INPUT id="chkAll" type="checkbox" value="checkbox"
                                   name="chkAll">
                            全选
                        </td>
                        <td width="90%" align="left" class="tdbg">
                            <STRONG>操作：</STRONG>
                            <INPUT type="button" value="删除选定" name="Submit" id="Submit">
                        </td>
                    </tr>
                </table>
                <table width="80%" border="0" align=center cellpadding="2"
                       cellspacing="0" bgcolor="#FFFFFF" class="border">
                    <tr>
                        <td width="14%" height="40" align="left" class="tdbg">
                            &nbsp;
                        </td>
                        <td width="86%" align="left" class="tdbg">

                        </td>
                    </tr>
                </table>
                <table width="80%" border="0" align=center cellpadding="2"
                       cellspacing="0" bgcolor="#FFFFFF" class="border">
                    <tr>
                        <td height="40" align="center" class="tdbg" id="buttom1">
                            <select id="pagenum" onchange="changePageNum(this.value)">
                                <option value="3">3</option>
                                <option value="5">5</option>
                                <option value="8">8</option>
                                <option value="10">10</option>
                            </select>
                            <a href="pageRolesServlet?cp=1">首页|&nbsp;</a>
                            <c:if test="${page.hasPrevious==true}">
                                <a href="pageRolesServlet?cp=${sessionScope.cp-1}&pageNum=${sessionScope.pageNum}">上一页|&nbsp;</a>
                            </c:if>
                            <%
                                int count = 0;
                            %>
                            <c:forEach begin="1" end="${page.pageCount}" var="i">
                                <%
                                    count++;
                                %>
                                <%
                                    if (count == pageIndex) {
                                %>
                                <a href="pageRolesServlet?cp=${i}&pageNum=${page.pageSize}" style="color: red">${i}</a>
                                <%
                                } else {
                                %>
                                <a href="pageRolesServlet?cp=${i}&pageNum=${page.pageSize}">${i}</a>
                                <%
                                    }
                                %>
                            </c:forEach>
                            <c:if test="${page.hasNext==true}">
                                <a href="pageRolesServlet?cp=${sessionScope.cp+1}&pageNum=${sessionScope.pageNum}">下一页|&nbsp;</a>
                            </c:if>
                            <a href="pageRolesServlet?cp=${page.pageCount}&pageNum=${sessionScope.pageNum}">尾页|&nbsp;</a>

                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <ul class="main_end">
            <li class="main_end_left left"></li>
            <li class="main_end_right right"></li>
        </ul>
    </div>
</form>
</body>
</html>