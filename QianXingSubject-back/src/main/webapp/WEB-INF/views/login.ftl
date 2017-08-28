<!DOCTYPE html>
<html lang="UTF-8">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title登陸</title>
    
     <!-- Bootstrap -->
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrapValidator -->
    <link rel="stylesheet" href="static/plugins/bootstrap-validator/css/bootstrapValidator.min.css">
    <!-- Lobibox -->
    <link rel="stylesheet" href="static/plugins/lobibox/css/lobibox.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="static/css/AdminLTE.min.css">
    <!-- animate -->
    <link rel="stylesheet" href="static/plugins/animate/animate.css">

    <style>
        body {
            background: #ecf0f5;
        }
        .login-box {
            width: 360px;
            margin: auto;
            padding-top: 100px;
        }
        @media (max-width: 768px) {
            .login-box {
                width: 90%;
            }
        }
        .login-logo a {
            font-size: 30px;
            text-decoration: none;
            color: #666;
        }
        .login-body {
            width: 100%;
            margin-top: 30px;
            padding: 15px;
            background: #fff;
        }
        .code-group {
            display: flex;
        }
        #code {
            max-width: 160px;
        }

        #code-img {
            margin-left: 12px;
        }
        .code-group small {
            position: absolute;
            display: flex;
            margin-top: 33px;
        }
        #login-form > button {
            margin-top: 25px;
        }
    </style>
    
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	
	<div class="login-box animated bounce">
        <div class="login-logo">
            <a href="#"><b></b></a>
        </div>
        <div class="login-body">

            <p class="login-box-msg"> </p>
            
		    <form id="login-form" method="post">
		        <div class="form-group has-feedback">
		            <input type="text" class="form-control" name="adminName" placeholder="请输入账号" autocomplete="off">
		            <span class="glyphicon glyphicon-user form-control-feedback"></span>
		        </div>
		        <div class="form-group has-feedback">
		            <input type="password" class="form-control" name="adminPassword" placeholder="请输入密码" autocomplete="off">
		            <span class="glyphicon glyphicon-cog form-control-feedback"></span>
		        </div>
		        
		        <button type="submit" class="btn btn-success btn-block btn-flat">登陆</button>
		    </form>
		    
		    <br>

            <div class="clearfix"></div>

        </div>
        
    </div>
    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="static/plugins/jQuery/jquery-3.2.1.min.js"></script>
    <script src="static/plugins/jQueryForm/jquery.form.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="static/js/bootstrap.min.js"></script>
    <script src="static/plugins/lobibox/js/lobibox.min.js"></script>
    <!-- bootstrapValidator -->
    <script src="static/plugins/bootstrap-validator/js/bootstrapValidator.min.js"></script>
    <script src="static/js/common.js"></script>
	<script>
	    $("#code-img").click(function () {
	        $(this).attr("src", "../admin/code.jpg");
	    });
	
	    function deletMSG(type , msg) {
	        Lobibox.notify(type, {
	            size: 'mini',
	            soundPath: 'static/plugins/lobibox/sounds/',
	            position: 'center bottom',
	            msg: msg
	        });
	    }
	
	    $(document).ready(function() {
	        $('#login-form').bootstrapValidator({
	                    fields: {
	                        userLogin: {
	                            validators: {
	                                notEmpty: {
	                                    message: '账号不能为空'
	                                }
	                            }
	                        },
	                        userPass: {
	                            validators: {
	                                notEmpty: {
	                                    message: '密码不能为空'
	                                }
	                            }
	                        }
	                    }
	                }).on('success.form.bv', function(e) {
	                    e.preventDefault();
	                    ajaxSubmitForm("/qianxingsubject-back/admin/do_login", $(this).serialize(),
	                        function (data) {
	                            if (data.success) {
	                                window.location="/qianxingsubject-back/admin/index.html";
	                            } else {
                                deletMSG('error', data.msg);
                            }
	                        },
	                        function (data) {
	                            deletMSG('error', '不造哪里错了');
	                        }
	                    );
	                });
	    });
	</script>
</body>

</html>