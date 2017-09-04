<!-- Modal form-->
<div class="modal fade bs-example-modal-sm" id="myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel"></h4>
            </div>
            
            <form id="Admin-form" method="post" role="form">
                <div class="modal-body" id="modal-bodyku">
                    <div class="form-group has-feedback">
                        <label for="adminName">用户名：</label>
                        <input type="text" class="form-control" name="adminName" id="Name" placeholder="请输入用户名" autocomplete="off">
                        <span class="glyphicon glyphicon-user form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="adminNicename">昵称：</label>
                        <input type="text" class="form-control" name="adminNicename" id="Nicename" placeholder="请输入昵称" autocomplete="off">
                        <span class="glyphicon glyphicon-cog form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="adminPassword">设置密码：</label>
                        <input type="password" class="form-control" name="adminPassword" id="Password" placeholder="请输入新密码" autocomplete="off">
                        <span class="glyphicon glyphicon-cog form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="renewPwd">再次确认：</label>
                        <input type="password" name="renewPwd" class="form-control"  id="RePassword" placeholder="请再次确认新密码" autocomplete="off">
                        <span class="glyphicon glyphicon-cog form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="adminEmail">邮箱：</label>
                        <input type="text" name="adminEmail" class="form-control" placeholder="请输入邮箱地址" autocomplete="off">
                        <span class="glyphicon glyphicon-cog form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="adminStatus">状态：</label>
                        <div class="form-group">
		                  <div class="radio">
		                    <label>
		                      <input type="radio" name="adminStatus" id="optionsRadios1" value="1" checked="">
		                     	 正常
		                    </label>
		                  </div>
		                  <div class="radio">
		                    <label>
		                      <input type="radio" name="adminStatus" id="optionsRadios2" value="0">
		                     	 禁用
		                    </label>
		                  </div>
	                </div>
                    </div>
                </div>
                <div class="modal-footer" id="modal-footerq">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- end of modal ------------------------------>
<!-- REQUIRED JS SCRIPTS -->
<!-- jQuery 3.2.1 -->
<script src="static/plugins/jQuery/jquery-3.2.1.min.js"></script>
<!--layer-->
<script src="static/plugins/layer/layer.js"></script>
<script src="static/plugins/lobibox/js/lobibox.min.js"></script>
<!-- bootstrapValidator -->
<script src="static/plugins/bootstrap-validator/js/bootstrapValidator.min.js"></script>
<script language="javascript">

function deletMSG(type , msg) {
	Lobibox.notify(type, {
		size: 'mini',
	    soundPath: 'static/plugins/lobibox/sounds/',
	    position: 'center bottom',
	    msg: msg
	});
}
 
</script>