<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>健身信息系统 - 登录</title>
    <link href="/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="css/font-awesome.min.css?v=4.3.0" rel="stylesheet">

    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css?v=3.2.0" rel="stylesheet">
    <link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>
</head>
<body class="gray-bg">
<div>
<%--    <img src="img/profile.jpg" height="600px" width="600px">--%>
    <div class="middle-box text-center loginscreen  animated fadeInDown">
        <div>
            <div>
                <h1 class="logo-name">H+</h1>
            </div>
            <h3>欢迎使用 健身信息系统</h3>
            <form class="m-t" role="form" id="form">
                <div class="form-group">
                    <input type="text" name="englishName" class="form-control" placeholder="用户名" required="required">
                </div>
                <div class="form-group">
                    <input type="password" name="password" class="form-control" placeholder="密码">
                </div>
                <div class="form-group">
                    <input type="text" name="verification" class="form-control" placeholder="验证码">
                </div>
                <div class="form-group" >
                    <img src="/verification/crimg.do" onclick="changeImg()" id="validateCodeImg"
                         style="height: 65px;width: 220px" >
                    <a href="javascript:void(0)" onclick="changeImg()">换一张</a>
                </div>
                <button type="button" class="btn btn-primary block full-width m-b" onclick="ajaxSubmit()">登 录</button>
            </form>
        </div>
    </div>
</div>



<!-- 全局js -->
<script src="js/jquery-2.1.1.min.js"></script>
<script src="js/bootstrap.min.js?v=3.4.0"></script>
<!-- Sweet alert -->
<script src="js/plugins/sweetalert/sweetalert.min.js"></script>
<script>
    function changeImg(){
        var a=document.getElementById("validateCodeImg").src="/verification/crimg.do?a="+Math.random();
    }

    <!-- 异步请求表单提交-->
    function ajaxSubmit() {
        var url = "/login/login.do";
        $.ajax({
            type: "post",
            url: url,
            dataType: "json",
            data: $('#form').serialize(),
            async: false,
            success: function (data) {
                if (data.success) {
                    window.location.href = "index2.jsp";
                } else {
                    swalError(data);
                    changeImg();
                }
            },
            error: function () {
                swal("请求异常!");
            }
        });
    }

    <!-- 成功 异常弹出框-->
    function swalSuccess(data) {
        swal({
                    title: "成功",
                    text: data.description,
                    type: "success",
                    howCancelButton: false,
                    closeOnConfirm: false,
                    showLoaderOnConfirm: true
                },
                function () {
                    window.location.href = "/login/authorithy.do";
                });
    }
    function swalError(data) {
        swal({
                    title: "登陆错误",
                    text: data.description,
                    type: "info",
                    showCancelButton: false,
                    closeOnConfirm: false,
                    showLoaderOnConfirm: true
                });
    }
</script>

</body>
</html>
