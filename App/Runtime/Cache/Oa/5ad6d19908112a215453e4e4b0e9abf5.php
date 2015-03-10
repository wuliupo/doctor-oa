<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title><?php echo (C("TITLE")); ?></title>
<script src="/Public/Framework/Easyui/jquery.min.js"></script>
<script src="/Public/Framework/Easyui/jquery.easyui.min.js"></script>
<script src="/Public/Framework/Easyui/plugins/jquery.portal.js"></script>
<script src="/Public/Framework/Easyui/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" href="/Public/Framework/Easyui/themes/default/easyui.css" id="theme">
<link rel="stylesheet" href="/Public/Framework/Easyui/themes/icon.css">
<link rel="stylesheet" href="/Public/Css/icons.css">
<script src="/Public/Js/jQuery.cookie.js"></script>
<script src="/Public/Js/jQuery.oa.js"></script>
<link rel="stylesheet" href="/Public/Css/main.css">
</head>

<body class="easyui-layout">
    <!--Top-->
    <div id="north" data-options="region: 'north',split:true" style="height:90px;">
        <div class="oa-logo"><?php echo (C("TITLE")); ?></div>
        <div class="oa-menu">
            <a href="javascript:void(0);" class="oa-menu-user" data-url="<?php echo U('Index/getLeftMenu',array('id'=>1));?>">个人中心</a>
            <a href="javascript:void(0);" class="oa-menu-system" data-url="<?php echo U('Index/getLeftMenu',array('id'=>2));?>">系统中心</a>
            <a href="javascript:void(0);" class="oa-menu-app" data-url="<?php echo U('Index/getLeftMenu',array('id'=>3));?>">应用中心</a>
        </div>
        <div class="oa-user">
            <img src="/Public/Images/user-face-default.jpg" width="83" height="83" />
            <div class="oa-user-select">
                <a href="javascript:void(0);" class="oa-user-select-title">用户操作</a>
                <p>
                    <a href="javascript:void(0);">修改密码</a>
                    <a href="javascript:$.messager.alert('问题反馈', '发送邮件到624508914@qq.com<br />加入官方QQ群：<a href=\'http://jq.qq.com/?_wv=1027&k=a99RHS\' target=\'_blank\'>点击加入</a> <br />进行提交问题反馈 谢谢！<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前版本：<?php echo (C("OA_VERSION")); ?>', 'info');">问题反馈</a>
                    <a href="<?php echo U('Login/logout');?>">退出登录</a>
                </p>
            </div>
        </div>
    </div>
    <!--Left-->
    <div id="west" data-options="region: 'west',split:true,title:'个人中心'" style="width:200px;">
        <div id="left" class="easyui-accordion" data-options="fit:true,border:false"></div>
    </div>
    <!--Center-->
    <div id="center" data-options="region:'center',split:true">
        <div id="oa-tabs">
            <div title="后台首页" href="<?php echo U('Index/main');?>" data-options="cache:false,tools:[{iconCls:'icon-mini-refresh',handler:function(){var tab = $('#oa-tabs').tabs('getSelected');tab.panel('refresh',tab[0]['baseUrl']);}}]"></div>
        </div>
    </div>
    <script type="text/javascript">
        setInterval('$.Oa.sess_verify(\"<?php echo U("Login/session_timeout");?>\",\"<?php echo U("Login/logout");?>\")',3000);
    </script>
    <script src="/Public/Js/main.js"></script>
</body>
</html>