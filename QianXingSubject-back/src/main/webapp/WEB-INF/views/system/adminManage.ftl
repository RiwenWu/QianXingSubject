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
                <@main_sidebar.sidebar "adminManage">
                </@main_sidebar.sidebar>
                <!-- Content Wrapper. Contains page content -->
                <div class="content-wrapper">
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
                    <section class="content container-fluid" id="app">
                        <div class="col-md">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <a href="javascript:myEdit(0);" class="box-btn btn-sm btn-info btn-flat pull-left">创建管理员</a>
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
                                                <td class="contentCenter" v-else="el.adminStatus==0">已删除</td>
                                                <td>
                                                    <input class="btn btn-success btn-xs" v-on:click="javascript:myEdit(el.id)" value="编辑" type="button" />
                                                    <input class="btn btn-danger btn-xs" v-on:click="deleteUser(el.id)" value="删除" type="button" />
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
                        </div>
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
        <!-- Bootstrap 3.3.7 -->
        <script src="static/plugins/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- AdminLTE App -->
        <script src="static/plugins/AdminLTE/dist/js/adminlte.min.js"></script>
        <!--vue-->
        <script src="static/plugins/vue/vue.min.js"></script>
        <!--layer-->
        <script src="static/plugins/layer/layer.js"></script>
        <script type="text/javascript">
        $(function() {
            getAllTag(0);
        });

        var vm = new Vue({
            el: '#app',
            data: {
                dataTag: {}
            },
            methods: {
                getAllTag: function(id) {
                    getAllTag(id);
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
        
        <!-- 新增/编辑 -->
		function myEdit(id){
			var loadIdx = parent.layer.load();
			var title = '添加用户';
			if(id != 0){
				title = '修改用户';
			}
			$.get('dialog/edit/'+id, {}, function(str){
				
				parent.layer.close(loadIdx);
				
				layer.open({
					title : title,
					type : 1,
					area : ['400px', '600px'],
					content : str,
					btn : ['确定', '取消'],
					yes : function(index, layero){
						$('#Admin-form').submit();
					},
					btn2 : function(index, layero){
					    layer.close(index);
					}
				});
			});
		}
        </script>
</body>

</html>