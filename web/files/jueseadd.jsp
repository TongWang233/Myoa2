<%@ page contentType="text/html;charset=GB2312" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
>
<link rel="stylesheet"
      href="../styles/style.css"/>
<link rel="stylesheet"
      href="../styles/calendar-win2k-cold-1.css"
      rel="stylesheet" type="text/css" title="win2k-cold-1"/>
<script src="../js/jquery.js"></script>
<script type="text/javascript">

    function addRole() {
        document.forms[0].action = "${pageContext.request.contextPath}/addRoleServlet";
        document.forms[0].submit();
    }

    //跳转不同功能时转换编号的可编辑性
    window.onload = function () {
        let value = $("#roleNo").val();
        if (value != "") {
            $("#roleNo").attr("readonly", "readonly");
            $("#add").attr("style", "display:none");

        } else {
            $("#update").attr("style", "display:none");
        }
    }
</script>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <title>添加角色信息</title>
</head>
<body>
<div id="main_body">
    <ul class="main_top">
        <li class="main_top_left left">
            添加角色信息
        </li>
        <li class="main_top_right right">
        </li>
    </ul>
    <div class="main_content_rightbg">
        <div class="main_content_leftbg">
            <form name="form1" method="post"
                  action="${pageContext.request.contextPath}/updateRloeServlet">
                <center>
                    <input type="hidden" name="bz" value=""/>
                    <input id="id" name="id" type="hidden" value="">
                    <table width="50%" border="0" align=center cellpadding="2"
                           cellspacing="1" bgcolor="#FFFFFF" class="border">
                        <tr align="center">
                            <td width="20%" height=25 align="left">
                                角色编号
                            </td>
                            <td width="50%" align="left">
                                <input name="roleNo" id="roleNo"
                                       value="<%=request.getParameter("id")%>"/>
                            </td>
                        </tr>
                        <tr align="center">
                            <td width="23%" height=25 align="left">
                                角色名称
                            </td>
                            <td width="77%" align="left">
                                <input name="roleName" id="roleName"
                                       value="<%=request.getParameter("roleName")%>"/>
                            </td>
                        </tr>

                    </table>
                    <input type="button" id="add" value=" 添加  " onclick="addRole()"/>
                    <input type="submit" id="update" value=" 修改  "/>
                    <input type="reset" value=" 重 置  "/>
                </center>
            </form>
        </div>
    </div>
    <ul class="main_end">
        <li class="main_end_left left"></li>
        <li class="main_end_right right"></li>
    </ul>
</div>
</body>
</html>

