<!-- Modal form-->
<div class="modal fade bs-example-modal-sm" id="editModal" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="editModalLabel"></h4>
            </div>
            
            <form id="admin_edit_form" method="post" role="form">
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
                    <div class="form-group has-feedback">
						<label>角色：</label>
						<select class="form-control select2" style="width: 100%;" name="roleId">
							<option v-for="el in roleList.queryResult" :value="el.roleId">{{el.roleName}}</option>
						</select>
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