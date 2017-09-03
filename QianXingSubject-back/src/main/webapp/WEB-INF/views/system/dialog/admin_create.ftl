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
	                    <input type="text" class="form-control" name="adminName" placeholder="请输入用户名" autocomplete="off">
	                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
	                </div>
	                <div class="form-group has-feedback">
	                    <label for="adminNicename">昵称：</label>
	                    <input type="text" class="form-control" name="adminNicename" placeholder="请输入昵称" autocomplete="off">
	                    <span class="glyphicon glyphicon-cog form-control-feedback"></span>
	                </div>
	                <div class="form-group has-feedback">
	                    <label for="adminPassword">设置密码：</label>
	                    <input type="password" class="form-control" name="adminPassword" placeholder="请输入新密码" autocomplete="off">
	                    <span class="glyphicon glyphicon-cog form-control-feedback"></span>
	                </div>
	                <div class="form-group has-feedback">
	                    <label for="renewPwd">再次确认：</label>
	                    <input type="password" name="renewPwd" class="form-control" placeholder="请再次确认新密码" autocomplete="off">
	                    <span class="glyphicon glyphicon-cog form-control-feedback"></span>
	                </div>
	                <div class="form-group has-feedback">
	                    <label for="adminEmail">邮箱：</label>
	                    <input type="text" name="adminEmail" class="form-control" placeholder="请输入邮箱地址" autocomplete="off">
	                    <span class="glyphicon glyphicon-cog form-control-feedback"></span>
	                </div>
	                <div class="form-group has-feedback">
	                    <label for="adminRight">权限：</label>
	                    <input type="text" name="adminRight" class="form-control" placeholder="请选择权限" autocomplete="off">
	                    <span class="glyphicon glyphicon-cog form-control-feedback"></span>
	                </div>
	                <div class="form-group has-feedback">
	                    <label for="adminStatus">状态：</label>
	                    <input type="text" name="adminStatus" class="form-control" placeholder="请选择状态" autocomplete="off">
	                    <span class="glyphicon glyphicon-cog form-control-feedback"></span>
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
        <!-- bootstrapValidator -->
	    <script src="static/plugins/bootstrap-validator/js/bootstrapValidator.min.js"></script>
	    <script src="static/js/common.js"></script>
 		<script language="javascript">
			function open_container(id) {
			    var title = '新增管理员';
			    if(id != 0){
				title = '修改';
			}
			    document.getElementById('myModalLabel').innerHTML = title;
			    $('#myModal').modal('show');
			}
			$(document).ready(function() {
				$(function() {
				    $('#Admin-form').bootstrapValidator({
				        fields: {
				            adminName: {
				                validators: {
				                    notEmpty: {
				                        message: '不能为空'
				                    }
				                    /*
				                    ,
				                    threshold: 6, //有6字符以上才发送ajax请求，（input中输入一个字符，插件会向服务器发送一次，设置限制，6字符以上才开始）
				                    remote: { //ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}  
				                        url: 'exist2.do', //验证地址
				                        message: '用户已存在', //提示消息
				                        delay: 2000, //每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
				                        type: 'POST' //请求方式
				                        /**自定义提交数据，默认值提交当前input value
				                         *  data: function(validator) {
				                              return {
				                                  password: $('[name="passwordNameAttributeInYourForm"]').val(),
				                                  whatever: $('[name="whateverNameAttributeInYourForm"]').val()
				                              };
				                           }
				                    }
				                    regexp: {
				                        regexp: /^[a-zA-Z0-9_\.]+$/,
				                        message: '用户名由数字字母下划线和.组成'
				                    }
				                    */
				                }
				            },
				            adminNicename: {
				                validators: {
				                    notEmpty: {
				                        message: '不能为空'
				                    }
				                }
				            },
				            adminPassword: {
				                message: '密码无效',
				                validators: {
				                    notEmpty: {
				                        message: '不能为空'
				                    },
				                    stringLength: {
				                        min: 6,
				                        max: 30,
				                        message: '长度必须在6到30之间'
				                    },
				                    different: { //不能和用户名相同
				                        field: 'adminName',
				                        message: '不能和用户名相同'
				                    }
				                }
				            },
				            renewPwd: {
				                message: '密码无效',
				                validators: {
				                    notEmpty: {
				                        message: '不能为空'
				                    },
				                    identical: { //相同
				                        field: 'adminPassword', //需要进行比较的input name值
				                        message: '两次密码不一致'
				                    }
				                }
				            }
				        }
				    }).
				    on('success.form.bv', function(e) {
				        e.preventDefault();
				        ajaxSubmitForm("save", $(this).serialize(),
				            function(data) {
				                if (data.success) {
				                    window.location.reload();
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
			});
		</script>