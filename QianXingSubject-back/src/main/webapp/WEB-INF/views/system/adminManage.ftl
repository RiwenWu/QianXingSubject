<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>后台首页</title>
    <!-- Select2 -->
    <link rel="stylesheet" href="static/plugins/select2/dist/css/select2.min.css">
    
    <#include "/path/head_css_js.ftl">
</head>

<body class="hold-transition skin-blue sidebar-mini">
    <#import "/path/main-sidebar.ftl" as main_sidebar>
        <div class="wrapper">
            <!-- Main Header -->
            <#include "/path/main-header.ftl">
                <!-- Left side column. contains the logo and sidebar -->
                <@main_sidebar.sidebar "adminManage">
                </@main_sidebar.sidebar>
                <!-- Content Wrapper. Contains page content -->
                <div class="content-wrapper" id="app">
                    <!-- Content Header (Page header) -->
                    <section class="content-header">
                        <h1>
                管理员列表
            <small>Admin Manage</small>
          </h1>
                        <ol class="breadcrumb">
                            <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
                            <li class="active">Here</li>
                        </ol>
                    </section>
                    <!-- Main content -->
                    <section class="content container-fluid">
                        <div class="col-md">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <a href="javascript:open_create();" class="box-btn btn-sm btn-info btn-flat pull-left">创建管理员</a>
                                    <div class="box-tools">
                                        <div class="input-group input-group-sm" style="width: 150px;">
                                            <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">
                                            <div class="input-group-btn">
                                                <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.box-tools -->
                                </div>
                                <div class="box-body no-padding">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>用户名</th>
                                                <th>昵称</th>
                                                <th>邮箱</th>
                                                <th>权限</th>
                                                <th>创建时间</th>
                                                <th>状态</th>
                                                <th>操作</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-for="el in dataTag.list" :id="el.id">
                                                <td class="contentCenter">{{el.adminName}}</td>
                                                <td class="contentCenter">{{el.adminNicename}}</td>
                                                <td class="contentCenter">{{el.adminEmail}}</td>
                                                <td class="contentCenter" v-if="el.userRight==1">管理员</td>
                                                <td class="contentCenter" v-else="el.userRight==0">用户</td>
                                                <td class="contentCenter">{{el.adminRegistered}}</td>
                                                <td class="contentCenter" v-if="el.adminStatus==1">正常</td>
                                                <td class="contentCenter" v-else="el.adminStatus==0">禁用</td>
                                                <td>
                                                    <input class="btn btn-success btn-xs" v-on:click="editUser(el.id, el)" value="编辑" type="button" />
                                                </td>
                                            </tr>
                                            <tr v-show="">
                                                <td colspan="9" align="center" style="vertical-align:middle;padding-top: 10px;padding-bottom: 10px;">暂无数据</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="box-footer clearfix">
                                <ul class="pagination no-margin pull-right">
                                    <li v-if="!dataTag.isFirstPage"><a href="javscript:;" v-on:click="getAllTag(dataTag.prePage)">«</a></li>
                                    <li v-if="dataTag.isFirstPage" class="disabled"><a href="javscript:;">«</a></li>
                                    <li v-for="item in dataTag.navigatepageNums" :class="item == dataTag.pageNum? 'active':''"><a href="javascript:void(0);" v-text="item" v-on:click="getAllTag(item)"></a></li>
                                    <li v-if="!dataTag.isLastPage"><a href="javscript:;" v-on:click="getAllTag(dataTag.nextPage)">»</a><b></b></li>
                                    <li v-if="dataTag.isLastPage" class="disabled"><a href="javscript:;">»</a></li>
                                </ul>
                            </div>
                            <div>
                                <h4><strong>注：</strong><br></h4>
                                <p>删除用户不会删除彻底删除数据</p>
                            </div>
                            <div class="form-group has-feedback">
								<label>角色：</label>
								<select class="form-control select2" style="width: 100%;"  multiple="multiple">
									<option v-for="el in roleList.queryResult" :value="el.roleId">{{el.roleName}}</option>
								</select>
							</div>
                        </div>
                        <!-- 新增 & 编辑  的模态框 -->
						<#include "dialog/admin_create.ftl">
						<#include "dialog/admin_edit.ftl">
                    </section>
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
		<!--layer-->
		<script src="static/plugins/layer/layer.js"></script>
		<script src="static/plugins/lobibox/js/lobibox.min.js"></script>
		<!-- bootstrapValidator -->
		<script src="static/plugins/bootstrap-validator/js/bootstrapValidator.min.js"></script>
	    <!-- Bootstrap 3.3.7 -->
        <script src="static/plugins/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- AdminLTE App -->
        <script src="static/plugins/AdminLTE/dist/js/adminlte.min.js"></script>
        <!--vue-->
        <script src="static/plugins/vue/vue.min.js"></script>
        <script src="static/js/common.js"></script>
		<!-- Select2 -->
		<script src="static/plugins/select2/dist/js/select2.full.min.js"></script>
        
        <script type="text/javascript">
	
			$(document).ready(function() {
			  $(".select2").select2();
			});
        
	        $(function() {
	            getAllTag(0);
	            getRoleList();
	        });
	
	        var vm = new Vue({
	            el: '#app',
	            data: {
	                dataTag: {},
	                roleList: {}
	            },
	            methods: {
		            editUser: function(id, admininfo) {
		                open_container(id, admininfo);
		            },
		            createUser: function() {
		            	open_create();
		            }
	            }
	        });
	
	        <!--查询所有用户信息-->
	        function getAllTag(id) {
	            $.get("findAdminlist/" + id, function(result) {
	                // console.log(JSON.stringify(result));
	                vm.dataTag = result.obj;
	            });
	        }
	        
	        <!-- 查询所有角色 -->
		 	function getRoleList() {
		 		$.get("../role/findRoleList", function(result) {
		 			vm.roleList = result;
		 		});
		 	}
	        
	        <!-- 新增 -->
	        function open_create(){
			    $('#createModal').modal('show');
			    submit(0, '#admin_create_form');
	        }
	        
	        <!-- 编辑 -->
	        function open_container(id, obj) {
			    var title = '编辑';
			    
			    $("#Name").val(obj.adminName);
        		$("#Nicename").val(obj.adminNicename);
        		$("#Password").val(obj.adminPassword);
        		$("#RePassword").val(obj.adminPassword);
        		
			    document.getElementById('editModalLabel').innerHTML = title;
			    $('#editModal').modal('show');
			    submit(id,'#admin_edit_form');
			}
			    function submit(id,str){
			        $(str).bootstrapValidator({
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
			            ajaxSubmitForm("addOrupdata/" + id, $(this).serialize(),
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
			    
			}
	 	
	 	</script>
</body>

</html>