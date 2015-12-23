
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

                    <form class="form-horizontal m-t" id="commentForm">

                        <div class="form-group">
                            <label class="col-sm-2 control-label">姓名：</label>
                            <div class="col-sm-4">
                                <input id="name" name="name" minlength="2" type="text" class="form-control" required="" aria-required="true">
                            </div>
                            <label class="col-sm-2 control-label">性别：</label>
                            <div class="col-sm-4 form-inline">
                                <div class="radio">
                                    <label>
                                        <input id="man" type="radio" value="0" name="sex">
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
                            <label class="col-sm-2 control-label">身高：</label>
                            <div class="col-sm-4">
                                <input id="height" name="height" minlength="2" type="text" class="form-control" required="" aria-required="true">
                            </div>
                            <label class="col-sm-2 control-label">体重：</label>
                            <div class="col-sm-4">
                                <input id="weight" name="weight" minlength="2" type="text" class="form-control" required="" aria-required="true">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">心率：</label>
                            <div class="col-sm-4">
                                <input id="heartRate" name="heartRate" minlength="2" type="text" class="form-control" required="" aria-required="true">
                            </div>
                            <label class="col-sm-2 control-label">肺活量：</label>
                            <div class="col-sm-4">
                                <input id="pulmonary" name="pulmonary" minlength="2" type="text" class="form-control" required="" aria-required="true">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">籍贯：</label>
                            <div class="col-sm-4">
                                <div class="input-group">
                                    <input id="nativePlace" name="nativePlace" minlength="2" type="text"
                                           class="form-control" required="" aria-required="true" onclick="showCity();">
                                    <span class="input-group-addon " onclick="showCity();">
                                        <span class="fa fa-circle-o-notch"></span>
                                    </span>
                                </div>

                            </div>

                            <label class="col-sm-2 control-label">食物习惯：</label>
                            <div class="col-sm-4">
                               <select class="form-control m-b" name="foot">
                                   <option>辣</option>
                                   <option>甜</option>
                                   <option>咸</option>
                                   <option>淡</option>
                               </select>
                            </div>
                        </div>


                        <div class="modal" id="modal" tabindex="-1" role="dialog"  aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content animated bounceInRight">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                        <h4 class="modal-title">城市选择</h4>
                                        <small>请选择您所在的城市。</small>
                                    </div>
                                    <div class="modal-body">
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
                                <textarea id="ccomment" name="comment" class="form-control" required="" aria-required="true"></textarea>
                            </div>
                        </div>



                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-3">
                                <button class="btn btn-default" type="submit">
                                    <i class="fa fa-check"></i>
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

    <!-- jQuery Validation plugin javascript-->
    <script src="../../js/plugins/validate/jquery.validate.min.js"></script>
    <script src="../../js/plugins/validate/messages_zh.min.js"></script>

    <!-- 树状js-->
    <script src="../../js/plugins/treeview/bootstrap-treeview.js"></script>
    <script  type="text/javascript">
        $(function(){
            var e;
            $.ajax({
                url: "/city/list.do",
                type: "get",
                dataType: "json",
                timeout: 120e3,
                success:function(data){
                    e = data;
                },
                error:function(data){
                    alert("加载失败");
                }
            });
           /* var e = [{
                text: "中国",
                nodes:[{
                    text: "湖南"
                },
                    {
                        text: "湖北"
                    }
                ]
            },
                {
                    text: "欧洲",
                    nodes:[{
                        text: "东欧"
                    },
                        {
                            text: "西欧"
                        }
                    ]
                }
            ]*/

            $("#treeview").treeview({
                levels: 1,
                color: "#428bca",
                data: e,
                onNodeSelected: function(e,o) {
                    $("#nativePlace").val(o.text);
                    $("#modal").modal('hide');
                }
            });
        });

        function showCity(){
            $('#modal').modal('show');
        }
    </script>
</body>
</html>
