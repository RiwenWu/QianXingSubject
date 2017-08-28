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
      <@main_sidebar.sidebar "main"></@main_sidebar.sidebar>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            	后台主页
            <small>Optional description</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
            <li class="active">Here</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content container-fluid">

          <h1>这是后台主页</h1>

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
</body>

</html>