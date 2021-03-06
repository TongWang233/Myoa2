<%@ page contentType="text/html;charset=GB2312" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<HTML>
<HEAD>

    <META http-equiv="Content-Type" content="text/html; charset=gb2312">

    <meta name="language" content="zh-cn"/>
    <meta name="copyright" content="&copy;2005 lxbzj.com"/>
    <meta name="date" content="2005-10-21"/>
    <meta name="Reply-to" content="lxbzmy@163.com"/>
    <meta name="description" content="这是管理导航菜单，遵循xhtml，点击标题隐藏内容，基于DOM的脚本。"/>
    <meta name="description" content="我已经设置了文档的基础链接为mainFrame,使用时可以自己修改。"/>
    <meta name="robots" content="None"/>
    <meta name="Keywords" content="menu nabar"/>
    <meta name="pragma" content="no-cache"/>
    <meta name="document-class" content="Completed"/>
    <meta name="cache-control" content="Private"/>

    <title>管理菜单</title>

    <script language="JavaScript" type="text/JavaScript">

        var sp = 12;/*滑动的速度，单位是像素，只填写数字*/

        /*==============
         实现开关菜单的函数
         =================*/
        function onoff(taga) {
            var hd = taga.parentNode;
            var menu = document.getElementById(hd.id + "_child");
            if (menu.style.display == "none") {
                taga.className = "on";
                menu.style.display = "";
                setTimeout("slowon(\"" + menu.id + "\")", 5);/*hda1.style.display="none";*/
            } else {
                /*menu.style.height="10px";*/
                /*menu.style.display="none";*/
                taga.className = "off";
                setTimeout("slowoff(\"" + menu.id + "\")", 10);
                /*hda1.style.display="";*/
            }
        }

        /*================
         实现菜单滑动的函数
         =================*/
        function slowoff(id) {/*这个实现菜单收起*/
            id = document.getElementById(id);
            var h = parseInt(id.style.height);
            if (isNaN(h))
                h = id.offsetHeight;
            /*if (h>0){
             */
            if (h - sp > 0) {
                id.style.height = (h - sp) + "px";
                setTimeout("slowoff(\"" + id.id + "\")", 5);/*}else */
            } else {
                id.style.height = "0px";
                id.style.display = "none";
                /*id.style.height="auto";*/
            }

        }

        function slowon(id) {/*这个实现菜单展开，初始条件必须是:菜单的高度="0px",不然没有效果*/
            var cld;
            id = document.getElementById(id);
            for (i = 0; i < id.childNodes.length; i++) {
                if (id.childNodes[i].nodeType == 1) {
                    cld = id.childNodes[i];
                    break;
                }
            }
            var h = id.offsetHeight;
            var h1 = cld.offsetHeight;
            id.style.height = parseInt(id.style.height) + sp + "px";
            if (h1 == 0 || h < h1)
                setTimeout("slowon(\"" + id.id + "\")", 5);
            else {
                id.style.height = "auto";
            }
        }

        /*=========================
         在菜单载入完成后隐藏起一些菜单项
         ============================*/
        function hidesth() {

            var arr = [2, 3, 4, 5, 6, 7, 8, 9, 10];
            for (i = 0; i < arr.length; i++)
                if (document.getElementById("menu" + arr[i] + "_a")) {
                    document.getElementById("menu" + arr[i] + "_child").style.display = "none";
                    document.getElementById("menu" + arr[i] + "_child").style.height = "0px";
                }

        }


        function getSay() {
            Refresh.getAllSay("mess", showSay);
        }

        function showSay(messageList) {
            var str = "";
            str += (messageList[messageList.length - 1] + "\r\n");
            document.getElementById("div1s").innerHTML = str;
            document.getElementById("div1s").style.display = "";
        }

        function hiddenDiv() {
            document.getElementById("div1s").style.display = "none";
        }

    </script>


    <link href="../styles/navbar2.0.css"
          rel="stylesheet" type="text/css"/>
</head>

<body onload="hidesth()">
<div onclick="hiddenDiv()" id="div1s"
     style="background-color: yellow; width: 100%; height: 100; position: fixed; left: 0px; bottom: 0; z-index: 8; display: none;">

</div>
<noscript title="系统提示">
    <div class="tit" id="menu0">
        <a href="" class="on" title="折叠菜单" name="nojs" id="nojs">系统提示</a>
    </div>
    <div class="list" id="menu0_child">
        <p>
            <strong>您的设备不支持js,不能使用菜的折叠功能</strong>
        </p>
    </div>
</noscript>

<div class="tit" id="menu2" title="菜单标题">
    <div class="titpic" id="pc1"></div>
    <a href="#nojs" title="折叠菜单" target="_self" class="on" id="menu2_a"
       tabindex="2" onclick="onoff(this);return false"
       onkeypress="onoff(this)">供应商管理</a>
</div>
<div class="list" id="menu2_child" title="菜单功能区">
    <ul>
        <li style="list-style-image: url(../images/ico/1.gif)">
            <a href="../files/gongyingshang.html" target="main"
            >供应商信息</a>
        </li>
        <li style="list-style-image: url(../images/ico/1.gif)">
            <a href="../files/kehufuwu.html" target="main">客户服务管理</a>
        </li>
        <li style="list-style-image: url(../images/ico/1.gif)">
            <a href="../files/xiaoshouhetong.html" target="main">销售合同管理</a>

        </li>

    </ul>
</div>
<div class="tit" id="menu3" title="菜单标题">
    <div class="titpic" id="pc4"></div>
    <a href="" title="折叠菜单" target="_self" class="on" id="menu3_a"
       tabindex="3" onclick="onoff(this);return false"
       onkeypress="onoff(this)">系统管理</a>
</div>
<div class="list" id="menu3_child" title="菜单功能区">
    <ul>
        <li style="list-style-image: url(../images/ico/1.gif)">
            <a href="../files/bumenguanli.html" target="main">部门管理</a>
        </li>
        <li style="list-style-image: url(../images/ico/1.gif)">
            <a href="../files/danweiguanli.html" target="main">单位管理</a>
        </li>
        <li style="list-style-image: url(../images/ico/1.gif)">
            <a href="../files/yonghuxinxi.html" target="main">用户信息</a>
        </li>
        <li style="list-style-image: url(../images/ico/2.gif)">
            <a href="${pageContext.request.contextPath}/pageRolesServlet" target="main">角色管理</a>
        </li>
    </ul>
</div>


<div class="tit" id="menu7" title="菜单标题">
    <div class="titpic" id="pc5"></div>
    <a href="" title="折叠菜单" target="_self" class="on" id="menu7_a"
       tabindex="7" onclick="onoff(this);return false"
       onkeypress="onoff(this)">客户管理</a>
</div>
<div class="list" id="menu7_child" title="菜单功能区">
    <ul>
        <li style="list-style-image: url(../images/ico/2.gif)">
            <a href="../files/kehuguanli.html" target="main">客户基本信息管理</a>
        </li>
        <li style="list-style-image: url(../images/ico/1.gif)">
            <a href="../files/chanpinguanli.html" target="main">产品信息管理</a>
    </ul>
</div>

<div class="tit" id="menu8" title="菜单标题">
    <div class="titpic" id="pc2"></div>
    <a href="#nojs" title="折叠菜单" target="_self" class="on" id="menu8_a"
       tabindex="8" onclick="onoff(this);return false"
       onkeypress="onoff(this)">考勤管理</a>
</div>
<div class="list" id="menu8_child" title="菜单功能区">
    <ul>
        <li style="list-style-image: url(../images/ico/1.gif)">
            <a href="../files/shangbanshijian.html" target="main">上下班时间管理</a>
        </li>
        <li style="list-style-image: url(../images/ico/1.gif)">
            <a href="../files/shangbanjilu.html" target="main">上下班记录管理</a>
        </li>

    </ul>
</div>


</body>
</html>

