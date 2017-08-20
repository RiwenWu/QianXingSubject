<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<title>Insert title here</title>

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
</head>

<body>
	<%-- 
	<strong>${message }</strong>
	<form action="do_login">
		<label>AdminName:<input name="adminName"></label><br/>
		<label>AdminPwd:<input name="adminPwd"></label><br/>
		<button type="submit">login</button>
	</form>
	 --%>
	 
	 <div class="login-body">

            <p class="login-box-msg"> </p>

            <form id="login-form" action="do_login" method="post">
                <div class="form-group has-feedback">
                    <input type="text" class="form-control" name="userLogin" placeholder="賬號" autocomplete="off">
                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" class="form-control" name="userPass" placeholder="密碼" autocomplete="off">
                    <span class="glyphicon glyphicon-cog form-control-feedback"></span>
                </div>
                <div class="form-group code-group">
                    <input type="text" id="code" name="code" class="form-control" maxlength="6" placeholder="楠岃瘉鐮�" autocomplete="off">
                    <img id="code-img" src="../admin/code.jpg" width="100%" height="34" alt="楠岃瘉鐮�" title="鐐瑰嚮鏇存崲楠岃瘉鐮�" />
                </div>
                <button type="submit" class="btn btn-success btn-block btn-flat">登陸</button>
            </form>

            <br>

            <div class="clearfix"></div>

        </div>
</body>
</html>