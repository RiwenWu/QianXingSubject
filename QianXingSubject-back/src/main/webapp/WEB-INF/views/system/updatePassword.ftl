<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>后台首页</title>
    <#include "/path/head_css_js.ftl">
</head>

<body class="hold-transition skin-blue sidebar-mini">
    <#import "/path/main-sidebar.ftl" as main_sidebar>
        <div class="wrapper">
            <!-- Main Header -->
            <#include "/path/main-header.ftl">
                <!-- Left side column. contains the logo and sidebar -->
                <@main_sidebar.sidebar "updatePassword">
                </@main_sidebar.sidebar>
                <!-- Content Wrapper. Contains page content -->
                <div class="content-wrapper">
                    <!-- Content Header (Page header) -->
                    <section class="content-header">
                        <h1>
            				修改密码
			            	<small>Optional description</small>
			          	</h1>
                        <ol class="breadcrumb">
                            <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
                            <li class="active">Here</li>
                        </ol>
                    </section>
                    <!-- Main content -->
                    <div class="col-md-9">
	                    <section class="content container-fluid">
	                        <form id="updatePwd-form" method="post">
	                            <div class="form-group has-feedback">
	                                <label for="adminPassword">原密码：</label>
	                                <input type="password" class="form-control" name="adminPassword" placeholder="请输入原密码" autocomplete="off">
	                                <span class="glyphicon glyphicon-user form-control-feedback"></span>
	                            </div>
	                            <div class="form-group has-feedback">
	                                <label for="newPwd">新密码：</label>
	                                <input type="password" class="form-control" name="newPwd" placeholder="请输入新密码" autocomplete="off">
	                                <span class="glyphicon glyphicon-cog form-control-feedback"></span>
	                            </div>
	                            <div class="form-group has-feedback">
	                                <label for="renewPwd">再次确认：</label>
	                                <input type="password" name="renewPwd" class="form-control" placeholder="请再次确认新密码" autocomplete="off">
	                                <span class="glyphicon glyphicon-cog form-control-feedback"></span>
	                            </div>
	                            <button type="submit" class="btn btn-success btn-block btn-flat">确定</button>
	                        </form>
	                    </section>
	                </div>
                    <!-- /.content -->
                </div>
                <!-- /.content-wrapper -->
                <!-- Main Footer -->
                <#include "/path/main-footer.ftl">
                    <!-- Control Sidebar -->
                    <#include "/path/control-sidebar.ftl">
        </div>
        <!-- ./wrapper -->
        <!-- REQUIRED JS SCRIPTS -->
        <!-- jQuery 3.2.1 -->
        <script src="static/plugins/jQuery/jquery-3.2.1.min.js"></script>
        <!-- Bootstrap 3.3.7 -->
        <script src="static/plugins/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- AdminLTE App -->
        <script src="static/plugins/AdminLTE/dist/js/adminlte.min.js"></script>

        <script src="static/plugins/lobibox/js/lobibox.min.js"></script>
        <!-- bootstrapValidator -->
        <script src="static/plugins/bootstrap-validator/js/bootstrapValidator.min.js"></script>
        <script src="static/js/common.js"></script>
        <script>
        
        function deletMSG(type, msg) {
            Lobibox.notify(type, {
                size: 'mini',
                soundPath: 'static/plugins/lobibox/sounds/',
                position: 'center bottom',
                msg: msg
            });
        }

        $(document).ready(function() {
            $('#updatePwd-form').bootstrapValidator({
                fields: {
                    adminPassword: {
                        validators: {
                            notEmpty: {
                                message: '不能为空'
                            }
                        }
                    },
                    newPwd: {
                        message:'密码无效',
                        validators: {
                            notEmpty: {
                                message: '不能为空'
                            },
                            stringLength: {
                                min: 6,
                                max: 30,
                                message: '长度必须在6到30之间'
                            }
                        }
                    },
                    renewPwd: {
                        message:'密码无效',
                        validators: {
                            notEmpty: {
                                message: '不能为空'
                            },
                            identical: {//相同
                              field: 'newPwd', //需要进行比较的input name值
                              message: '两次密码不一致'
                           }
                        }
                    }
                }
            }).on('success.form.bv', function(e) {
                e.preventDefault();
                ajaxSubmitForm("updatePwd", $(this).serialize(),
                    function(data) {
                        if (data.success) {
                            window.location = "/qianxingsubject-back/admin/login";
                        } else {
                            deletMSG('error', data.msg);
                        }
                    },
                    function(data) {
                        deletMSG('error', '不造哪里错了');
                    }
                );
            });
        });
        </script>
</body>

</html>