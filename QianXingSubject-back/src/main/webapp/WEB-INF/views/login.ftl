<!DOCTYPE html>
<html lang="UTF-8">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title登陸</title>
</head>

<body>
    <form id="login-form" action="do_login" method="post">
        <div class="form-group has-feedback">
            <input type="text" class="form-control" name="adminName" placeholder="請輸入賬號" autocomplete="off">
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
        </div>
        <div class="form-group has-feedback">
            <input type="password" class="form-control" name="adminPwd" placeholder="請輸入密碼" autocomplete="off">
            <span class="glyphicon glyphicon-cog form-control-feedback"></span>
        </div>
       <!--  <div class="form-group code-group">
            <input type="text" id="code" name="code" class="form-control" maxlength="6" placeholder="楠岃瘉鐮�" autocomplete="off">
            <img id="code-img" src="../admin/code.jpg" width="100%" height="34" alt="楠岃瘉鐮�" title="鐐瑰嚮鏇存崲楠岃瘉鐮�" />
        </div> -->
        <button type="submit" class="btn btn-success btn-block btn-flat">登陸</button>
    </form>
</body>

</html>