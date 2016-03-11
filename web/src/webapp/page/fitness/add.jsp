
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>个人信息管理</title>
    <link href="../../css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="../../css/font-awesome.min.css?v=4.3.0" rel="stylesheet">
    <link href="../../css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="../../css/plugins/steps/jquery.steps.css" rel="stylesheet">
    <link href="../../css/animate.min.css" rel="stylesheet">
    <link href="../../css/style.min.css?v=3.2.0" rel="stylesheet">
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox">
                    <div class="ibox-content">
                        <h2>
                            健身信息向导
                        </h2>

                        <form id="form" action="form_wizard.html#" class="wizard-big">
                            <h1>健身行为</h1>
                            <fieldset>
                                <h2>健身行为录入</h2>
                                <div class="row">
                                    <div class="col-sm-8">
                                        <div class="form-group">
                                            <label>行为名称 *</label>
                                            <input id="userName" name="userName" type="text" class="form-control required">
                                        </div>
                                        <div class="form-group">
                                            <label>行为类型 *</label>
                                            <input id="password" name="password" type="text" class="form-control required">
                                        </div>
                                        <div class="form-group">
                                            <label>行为适用人群 *</label>
                                            <input id="confirm" name="confirm" type="text" class="form-control required">
                                        </div>
                                        <div class="form-group">
                                            <label>消耗卡路里 *</label>
                                            <input id="" name="confirm" type="text" class="form-control required">
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="text-center">
                                            <div style="margin-top: 20px">
                                                <i class="fa fa-sign-in" style="font-size: 180px;color: #e5e5e5 "></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </fieldset>
                            <h1>健身行为详情</h1>
                            <fieldset>
                                <h2>行为详情录入</h2>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>姓名 *</label>
                                            <input id="name" name="major" type="text" class="form-control required">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Email *</label>
                                            <input id="email" name="email" type="text" class="form-control required email">
                                        </div>
                                        <div class="form-group">
                                            <label>地址 *</label>
                                            <input id="address" name="nativePlace" type="text" class="form-control">
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>天气 *</label>
                                            <input id="" name="email" type="text" class="form-control required email">
                                        </div>
                                        <div class="form-group">
                                            <label>气温 *</label>
                                            <input id="" name="nativePlace" type="text" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </fieldset>

                            <h1>警告</h1>
                            <fieldset>
                                <div class="text-center" style="margin-top: 120px">
                                    <h2>你是火星人 :-)</h2>
                                </div>
                            </fieldset>

                            <h1>完成</h1>
                            <fieldset>
                                <h2>条款</h2>
                                <input id="acceptTerms" name="acceptTerms" type="checkbox" class="required">
                                <label for="acceptTerms">我同意注册条款</label>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 全局js -->
    <script src="../../js/jquery-2.1.1.min.js"></script>
    <script src="../../js/bootstrap.min.js?v=3.4.0"></script>
    <!-- 自定义js -->
    <script src="../../js/content.min.js?v=1.0.0"></script>
    <!-- Steps -->
    <script src="../../js/plugins/staps/jquery.steps.min.js"></script>
    <!-- Jquery Validate -->
    <script src="../../js/plugins/validate/jquery.validate.min.js"></script>
    <script src="../../js/plugins/validate/messages_zh.min.js"></script>


    <script>
        $(document).ready(function(){
            $("#wizard").steps();
            $("#form").steps({
                bodyTag:"fieldset",
                onStepChanging:function(d,a,b){
                    if(a>b){
                        return true
                    }
                    if(b===3&&Number($("#age").val())<18){
                        return false
                    }
                    var c=$(this);
                    if(a<b){
                        $(".body:eq("+b+") label.error",c).remove();
                        $(".body:eq("+b+") .error",c).removeClass("error")
                    }
                    c.validate().settings.ignore=":disabled,:hidden";
                    return c.valid()},onStepChanged:function(b,a,c){
                    if(a===2&&Number($("#age").val())>=18){
                        $(this).steps("next")}
                    if(a===2&&c===3){
                        $(this).steps("previous")
                    }},
                onFinishing:function(c,a){
                    var b=$(this);
                    b.validate().settings.ignore=":disabled";
                    return b.valid()},
                onFinished:function(c,a){
                    var b=$(this);b.submit()}}).validate({
                errorPlacement:function(a,b){
                    b.before(a)},
                rules:{
                    confirm:{
                        equalTo:"#password"
                }
                }
            })
        });
    </script>




</body>
</html>