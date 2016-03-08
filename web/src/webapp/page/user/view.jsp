
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>用户个人信息录入</title>
    <link href="../../css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="../../css/font-awesome.min.css?v=4.3.0" rel="stylesheet">
    <link href="../../css/animate.min.css" rel="stylesheet">
    <link href="../../css/style.min.css?v=3.2.0" rel="stylesheet">
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox-content">
                <form class="form-horizontal m-t" id="commentForm" action="/user/create.do">

                    <div class="form-group">
                        <label class="col-sm-2 control-label">专项：</label>
                        <div class="col-sm-4 single">
                            <input id="major" name="major" type="text" class="form-control">
                        </div>
                        <label class="col-sm-2 control-label">性别：</label>
                        <div class="col-sm-4 form-inline">
                            <div class="radio">
                                <label>
                                    <input id="man" type="radio" value="0" name="sex" checked>
                                    男
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input id="woman" type="radio" value="1" name="sex">
                                    女
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">姓名：</label>
                        <div class="col-sm-4 single">
                            <input id="name" name="height" type="text" class="form-control">
                        </div>

                        <label class="col-sm-2 control-label">生日：</label>
                        <div class="col-sm-4 single">
                            <input  placeholder="YYYY-MM-DD hh:mm:ss" class="form-control layer-date" onclick="laydate()">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">身高：</label>
                        <div class="col-sm-4 single">
                            <input id="height" name="height" type="text" class="form-control">
                        </div>
                        <label class="col-sm-2 control-label">体重：</label>
                        <div class="col-sm-4 single">
                            <input id="weight" name="weight" type="text" class="form-control">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">心率：</label>
                        <div class="col-sm-4 single">
                            <input id="heartRate" name="heartRate"  type="text" class="form-control">
                        </div>
                        <label class="col-sm-2 control-label">肺活量：</label>
                        <div class="col-sm-4 single">
                            <input id="pulmonary" name="pulmonary"  type="text" class="form-control" >
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">籍贯：</label>
                        <div class="col-sm-4 single">
                            <div class="input-group">
                                <input id="nativePlace" name="nativePlace"  type="text"
                                       class="form-control"  onclick="showCity();">
                                    <span class="input-group-addon " onclick="showCity();">
                                        <span class="fa fa-circle-o-notch"></span>
                                    </span>
                            </div>

                        </div>

                        <label class="col-sm-2 control-label">食物习惯：</label>
                        <div class="col-sm-4">
                            <select class="form-control m-b" name="foodHabits">
                                <option value="0">辣</option>
                                <option value="1">甜</option>
                                <option value="2">咸</option>
                                <option value="3">淡</option>
                            </select>
                        </div>
                    </div>


                    <div class="modal" id="modal" tabindex="-1" role="dialog"  aria-hidden="true" >
                        <div class="modal-dialog">
                            <div class="modal-content animated bounceInRight">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                    <h4 class="modal-title">城市选择</h4>
                                    <small>请选择您所在的城市。</small>
                                </div>
                                <div class="modal-body" style="overflow: scroll;height: 400px;overflow-x: hidden">
                                    <div class="ibox-content">
                                        <div id="treeview" class="test"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>



                    <div class="form-group">
                        <label class="col-sm-2 control-label">说明：</label>
                        <div class="col-sm-10">
                            <textarea id="ccomment" name="describe" class="form-control" ></textarea>
                        </div>
                    </div>



                    <div class="form-group">
                        <div class="col-sm-4 ">
                            <button class="btn btn-default"  onclick="window.history.go(-1)"  >
                                取消</button>
                        </div>
                        <div class="col-sm-4 ">
                            <button class="btn btn-primary" type="submit">
                                <i class="fa fa-check"></i>
                                提交</button>
                        </div>
                    </div>
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

</body>
</html>
