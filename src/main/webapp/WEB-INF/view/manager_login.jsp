<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>卧龙信息管理后台</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <script type="text/javascript" src="static/login/js/jquery-1.5.1.min.js"></script>
    <link rel="stylesheet" href="static/login/bootstrap.min.css"/>
    <link rel="stylesheet" href="static/login/css/camera.css"/>
    <link rel="stylesheet" href="static/login/bootstrap-responsive.min.css"/>
    <link rel="stylesheet" href="static/login/matrix-login.css"/>
    <link rel="stylesheet" href="static/login/font-awesome.css"/>
    <style type="text/css">
        .cavs {
            z-index: 1;
            position: fixed;
            width: 95%;
            margin-left: 20px;
            margin-right: 20px;
        }
    </style>
    <script>
        var timer;

        function showfh() {
            fhi = 1;
            //关闭提示晃动屏幕，注释掉这句话即可
            timer = setInterval(xzfh2, 10);
        };
        var current = 0;

        function xzfh() {
            current = (current) % 360;
            document.body.style.transform = 'rotate(' + current + 'deg)';
            current++;
            if (current > 360) {
                current = 0;
            }
        };
        var fhi = 1;
        var current2 = 1;

        function xzfh2() {
            if (fhi > 50) {
                document.body.style.transform = 'rotate(0deg)';
                clearInterval(timer);
                return;
            }
            current = (current2) % 360;
            document.body.style.transform = 'rotate(' + current + 'deg)';
            current++;
            if (current2 == 1) {
                current2 = -1;
            } else {
                current2 = 1;
            }
            fhi++;
        };
    </script>
    <script>
        function laa() {
            $("#l1").html("<br>检测中……");
            var userName = $("#userName").val();
            if (userName == null || userName.trim() == "") {
                alert("请输入用户名");
                return;
            }
            $.ajax({
                type: "GET",
                url: 'wl/confirmUserName.do?userName=' + userName,
                success: function (data) {
                    if ("0" == data) {
                        $("#l1").html("<br>用户名不存在!!!");
                        $("#userName").val("");
                        return;
                    } else {
                        $("#l1").html("<br>用户存在!!!");
                    }
                }
            });
        }
    </script>
</head>
<body>
<div style="width:100%;text-align: center;margin: 0 auto;position: absolute;">
    <!-- 登录 -->
    <div id="windows1">
        <div id="loginbox">
            <form action="" method="post" name="loginForm" id="loginForm">
                <div class="control-group normal_text">
                    <a href="https://www.wolong.com"><img src="static/login/logo.jpg" alt="Logo"/></a>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
							<span class="add-on bg_lg">
							<i><img height="37" src="static/login/user.png"/></i>
							</span><input type="text" name="userName" id="userName" value="" onblur="laa()"
                                          placeholder="请输入用户名"/>
                            <span id="l1" style="color: red;font-size: 14px"></span>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
							<span class="add-on bg_ly">
							<i><img height="37" src="static/login/suo.png"/></i>
							</span><input type="password" name="password" id="password" placeholder="请输入密码"
                                          class="keypad" keypadMode="full" allowKeyboard="true" value=""/>
                        </div>
                    </div>
                </div>
                <div style="float:right;padding-right:10%;">
                    <div style="float: left;margin-top:3px;margin-right:2px;">
                        <font color="white" size="2px">记住密码</font>
                    </div>
                    <div style="float: left;">
                        <input name="form-field-checkbox" type="checkbox" id="rem" name="remFlag"
                               onclick="savePaw();" style="padding-top:0px;"/>
                    </div>
                </div>
                <div class="form-actions">
                    <div>
                        <span><a onclick="severCheck();" class="btn btn-info">登录</a></span>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<div id="templatemo_banner_slide" class="container_wapper">
    <div class="camera_wrap camera_emboss" id="camera_slide">
        <!-- 背景图片 -->
        <div data-src="static/login/images/wolong.jpg"></div>
        <div data-src="static/login/images/wolong2.jpg"></div>
        <div data-src="static/login/images/wolong.jpg"></div>
        <div data-src="static/login/images/wolong2.jpg"></div>
    </div>
    <!-- #camera_wrap_3 -->
</div>

<script type="text/javascript">
    //服务器校验
    function severCheck() {
        if (check()) {
            var userName = $("#userName").val();
            var password = $("#password").val();
            $.ajax({
                type: "POST",
                url: 'wl/login.do',
                data: JSON.stringify({
                    userName: $("#userName").val(),
                    password: $("#password").val(),
                    remFlag: $("#rem").val()
                }),
                async: false,
                dataType: 'json',
                contentType: 'application/json',
                success: function (data) {
                    if ("-2" == data) {
                        $("#userName").tips({
                            side: 1,
                            msg: "用户名不存在",
                            bg: '#FF5080',
                            time: 15
                        });
                        $("#userName").focus();
                    } else if ("-1" == data) {
                        $("#password").tips({
                            side: 1,
                            msg: "密码错误",
                            bg: '#FF5080',
                            time: 15
                        });
                        $("#password").focus();
                    } else if (data == "0") {
                        window.location = "index.do";
                    } else {
                        window.location = "wl/manager/login.do";
                    }
                }
            });
        }
    }

    $(document).ready(function () {
        //记住密码功能
        var str = getCookie("loginInfo");
        str = str.substring(1, str.length - 1);
        var username = str.split(",")[0];
        var password = str.split(",")[1];

        //自动填充用户名和密码
        $("#userName").val(username);
        $("#password").val(password);

    });

    //获取cookie
    function getCookie(cname) {
        var name = cname + "=";
        var ca = document.cookie.split(';');
        for (var i = 0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) == ' ') c = c.substring(1);
            if (c.indexOf(name) != -1) return c.substring(name.length, c.length);
        }
        return "";
    }

    //清除cookie
    function RemoveCookie(cookieName) {
        var cookies = document.cookie.split(";");//将所有cookie键值对通过分号分割为数组
        //循环遍历所有cookie键值对
        for (var i = 0; i < cookies.length; i++) {
            //有些cookie键值对前面会莫名其妙产生一个空格，将空格去掉
            if (cookies[i].indexOf(" ") == 0) {
                cookies[i] = cookies[i].substring(1);
            }
            //比较每个cookie的名称，找到要删除的那个cookie键值对
            if (cookies[i].indexOf(cookieName) == 0) {
                var exp = new Date();//获取客户端本地当前系统时间
                exp.setTime(exp.getTime() - 60 * 1000);//将exp设置为客户端本地时间1分钟以前，将exp赋值给cookie作为过期时间后，就表示该cookie已经过期了, 那么浏览器就会将其立刻删除掉
                document.cookie = cookies[i] + ";expires=" + exp.toUTCString();//设置要删除的cookie的过期时间，即在该cookie的键值对后面再添加一个expires键值对，并将上面的exp赋给expires作为值(注意expires的值必须为UTC或者GMT时间，不能用本地时间），那么浏览器就会将该cookie立刻删除掉
                //注意document.cookie的用法很巧妙，在对其进行赋值的时候是设置单个cookie的信息，但是获取document.cookie的值的时候是返回所有cookie的信息

                break;//要删除的cookie已经在客户端被删除掉，跳出循环
            }
        }
    }

    $(document).keyup(function (event) {
        if (event.keyCode == 13) {
            $("#to-recover").trigger("click");
        }
    });

    function genTimestamp() {
        var time = new Date();
        return time.getTime();
    }

    function changeCode1() {
        $("#codeImg").attr("src", "code.do?t=" + genTimestamp());
    }

    function changeCode2() {
        $("#zcodeImg").attr("src", "code.do?t=" + genTimestamp());
    }

    //客户端校验
    function check() {
        var userName = $("#userName").val();
        var password = $("#password").val();
        if ($("#userName").val() == "") {
            $("#password").tips({
                side: 2,
                msg: '用户名不得为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#password").focus();
            return false;
        }

        if ($("#password").val() == "") {
            //alert(4);
            $("#password").tips({
                side: 2,
                msg: '密码不得为空',
                bg: '#AE81FF',
                time: 3
            });
            //showfh();
            $("#password").focus();
            return false;
        }
        //	alert(10);
        $("#loginbox").tips({
            side: 1,
            msg: '正在登录 , 请稍后 ...',
            bg: '#68B500',
            time: 10
        });
        //alert(11);
        return true;
    }

    function savePaw() {
        var remFlag = $("input[type='checkbox']").is(':checked');
        if (remFlag == true) { //如果选中设置remFlag为1
            //cookie存用户名和密码,回显的是真实的用户名和密码,存在安全问题.
            var conFlag = confirm("记录密码功能不宜在公共场所(如网吧等)使用,以防密码泄露.您确定要使用此功能吗?");
            if (conFlag) { //确认标志
                //alert(1);
                $("#rem").val("1");
            } else {
                $("input[type='checkbox']").removeAttr('checked');
                $("#rem").val("");
            }
        } else { //如果没选中设置remFlag为""
            RemoveCookie("loginInfo");
            //    alert(2);
            $("#rem").val("");
        }
    }

    function saveCookie() {
        if ($("#saveid").attr("checked")) {
            $.cookie('userName', $("#userName").val(), {
                expires: 7
            });
            $.cookie('password', $("#password").val(), {
                expires: 7
            });
        }
    }

    jQuery(function () {
        var userName = $.cookie('userName');
        var password = $.cookie('password');
        if (typeof (userName) != "undefined"
            && typeof (password) != "undefined") {
            $("#userName").val(userName);
            $("#password").val(password);
            $("#saveid").attr("checked", true);
            $("#code").focus();
        }
    });

    //邮箱格式校验
    function ismail(mail) {
        return (new RegExp(/^(?:[a-zA-Z0-9]+[_\-\+\.]?)*[a-zA-Z0-9]+@(?:([a-zA-Z0-9]+[_\-]?)*[a-zA-Z0-9]+\.)+([a-zA-Z]{2,})+$/).test(mail));
    }

    //js  日期格式
</script>
<script src="static/login/js/bootstrap.min.js"></script>
<script src="static/js/jquery-1.7.2.js"></script>
<script src="static/login/js/jquery.easing.1.3.js"></script>
<script src="static/login/js/jquery.mobile.customized.min.js"></script>
<script src="static/login/js/camera.min.js"></script>
<script src="static/login/js/templatemo_script.js"></script>
<script src="static/login/js/ban.js"></script>
<script type="text/javascript" src="static/js/jQuery.md5.js"></script>
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script type="text/javascript" src="static/js/jquery.cookie.js"></script>

<!-- 软键盘控件start -->
<script type="text/javascript" src="static/login/keypad/js/form/keypad.js"></script>
<script type="text/javascript" src="static/login/keypad/js/framework.js"></script>
<!-- 软键盘控件end -->
</body>

</html>