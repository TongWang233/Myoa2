<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Office Anywhere 2009 网络智能办公系统</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet"
          href="styles/style.css" type="text/css;charset=gb2312"/>
    <link rel="stylesheet" type="text/css"
          href="styles/index.css">
    <script type="text/javascript"
            src="js/index.js">
    </script>
</head>
<script type="text/javascript">
    <%
                String msg = (String) session.getAttribute("msg");
                if (msg!=""&&msg!=null) {
                    out.print("alert('"+msg+"');");
                    session.setAttribute("msg","");
                }

    %>
</script>
<body>
<div class="login_div">
    <form action="userLoginServlet" method="post" name="myform" id="form"
          onSubmit="return check()">
        <div align="center">
            <b>用户名</b>
            <input class="text" onMouseOver="this.focus()"
                   onFocus="this.select()" maxlength="20" value=""
                   name="userName"/>
            &nbsp;&nbsp;
            <b>密码</b>
            <input class="text" onMouseOver="this.focus()"
                   onFocus="this.select()" type="password" maxlength="30"
                   name="userPassword"/>
            &nbsp;&nbsp;
            <input name="submit" type="submit" class="newButton" value=" 登 录"/>
        </div>
    </form>
</div>
</body>
</html>
