<%@ page contentType="text/html;charset=GB2312" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<HTML>
<HEAD>

    <META http-equiv="Content-Type" content="text/html; charset=gb2312">

    <meta name="language" content="zh-cn"/>
    <meta name="copyright" content="&copy;2005 lxbzj.com"/>
    <meta name="date" content="2005-10-21"/>
    <meta name="Reply-to" content="lxbzmy@163.com"/>
    <meta name="description" content="���ǹ��������˵�����ѭxhtml����������������ݣ�����DOM�Ľű���"/>
    <meta name="description" content="���Ѿ��������ĵ��Ļ�������ΪmainFrame,ʹ��ʱ�����Լ��޸ġ�"/>
    <meta name="robots" content="None"/>
    <meta name="Keywords" content="menu nabar"/>
    <meta name="pragma" content="no-cache"/>
    <meta name="document-class" content="Completed"/>
    <meta name="cache-control" content="Private"/>

    <title>�����˵�</title>

    <script language="JavaScript" type="text/JavaScript">

        var sp = 12;/*�������ٶȣ���λ�����أ�ֻ��д����*/

        /*==============
         ʵ�ֿ��ز˵��ĺ���
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
         ʵ�ֲ˵������ĺ���
         =================*/
        function slowoff(id) {/*���ʵ�ֲ˵�����*/
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

        function slowon(id) {/*���ʵ�ֲ˵�չ������ʼ����������:�˵��ĸ߶�="0px",��Ȼû��Ч��*/
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
         �ڲ˵�������ɺ�������һЩ�˵���
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
<noscript title="ϵͳ��ʾ">
    <div class="tit" id="menu0">
        <a href="" class="on" title="�۵��˵�" name="nojs" id="nojs">ϵͳ��ʾ</a>
    </div>
    <div class="list" id="menu0_child">
        <p>
            <strong>�����豸��֧��js,����ʹ�ò˵��۵�����</strong>
        </p>
    </div>
</noscript>

<div class="tit" id="menu2" title="�˵�����">
    <div class="titpic" id="pc1"></div>
    <a href="#nojs" title="�۵��˵�" target="_self" class="on" id="menu2_a"
       tabindex="2" onclick="onoff(this);return false"
       onkeypress="onoff(this)">��Ӧ�̹���</a>
</div>
<div class="list" id="menu2_child" title="�˵�������">
    <ul>
        <li style="list-style-image: url(../images/ico/1.gif)">
            <a href="../files/gongyingshang.html" target="main"
            >��Ӧ����Ϣ</a>
        </li>
        <li style="list-style-image: url(../images/ico/1.gif)">
            <a href="../files/kehufuwu.html" target="main">�ͻ��������</a>
        </li>
        <li style="list-style-image: url(../images/ico/1.gif)">
            <a href="../files/xiaoshouhetong.html" target="main">���ۺ�ͬ����</a>

        </li>

    </ul>
</div>
<div class="tit" id="menu3" title="�˵�����">
    <div class="titpic" id="pc4"></div>
    <a href="" title="�۵��˵�" target="_self" class="on" id="menu3_a"
       tabindex="3" onclick="onoff(this);return false"
       onkeypress="onoff(this)">ϵͳ����</a>
</div>
<div class="list" id="menu3_child" title="�˵�������">
    <ul>
        <li style="list-style-image: url(../images/ico/1.gif)">
            <a href="../files/bumenguanli.html" target="main">���Ź���</a>
        </li>
        <li style="list-style-image: url(../images/ico/1.gif)">
            <a href="../files/danweiguanli.html" target="main">��λ����</a>
        </li>
        <li style="list-style-image: url(../images/ico/1.gif)">
            <a href="../files/yonghuxinxi.html" target="main">�û���Ϣ</a>
        </li>
        <li style="list-style-image: url(../images/ico/2.gif)">
            <a href="${pageContext.request.contextPath}/pageRolesServlet" target="main">��ɫ����</a>
        </li>
    </ul>
</div>


<div class="tit" id="menu7" title="�˵�����">
    <div class="titpic" id="pc5"></div>
    <a href="" title="�۵��˵�" target="_self" class="on" id="menu7_a"
       tabindex="7" onclick="onoff(this);return false"
       onkeypress="onoff(this)">�ͻ�����</a>
</div>
<div class="list" id="menu7_child" title="�˵�������">
    <ul>
        <li style="list-style-image: url(../images/ico/2.gif)">
            <a href="../files/kehuguanli.html" target="main">�ͻ�������Ϣ����</a>
        </li>
        <li style="list-style-image: url(../images/ico/1.gif)">
            <a href="../files/chanpinguanli.html" target="main">��Ʒ��Ϣ����</a>
    </ul>
</div>

<div class="tit" id="menu8" title="�˵�����">
    <div class="titpic" id="pc2"></div>
    <a href="#nojs" title="�۵��˵�" target="_self" class="on" id="menu8_a"
       tabindex="8" onclick="onoff(this);return false"
       onkeypress="onoff(this)">���ڹ���</a>
</div>
<div class="list" id="menu8_child" title="�˵�������">
    <ul>
        <li style="list-style-image: url(../images/ico/1.gif)">
            <a href="../files/shangbanshijian.html" target="main">���°�ʱ�����</a>
        </li>
        <li style="list-style-image: url(../images/ico/1.gif)">
            <a href="../files/shangbanjilu.html" target="main">���°��¼����</a>
        </li>

    </ul>
</div>


</body>
</html>
