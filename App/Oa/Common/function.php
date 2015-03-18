<?php
function do_LoginSession(){
	$sess_Uid = session('uid');
	$table_User = M('User')->find($sess_Uid);
	$sess_User['info'] = $table_User;
	session('login_time',time());//记录登录时间戳，方便后台判断
	session('user',$sess_User);
}
function treeLeftMenu($data,$rule_id){
	$tree = array();
	foreach($data as $v){
		if($v['rule_id'] == $rule_id){
			$v['children'] = treeLeftMenu($data,$v['id']);
			$tree[] = $v;
		}
	}
	return $tree;
}
function treeRule($data,$rule_id = '0'){
	$tree = array();
	foreach($data as $v){
		if($v['rule_id'] == $rule_id){
			$v['children'] = treeRule($data,$v['id']);
			$tree[] = $v;
		}
	}
	return $tree;
}
function upload_mkdir($path)
{
	$dirs = explode("/", $path);
	$current_dir = "";
	foreach($dirs as $dir)
	{
		$current_dir .= $dir."/";
		if(!file_exists($current_dir))
		{
		        @mkdir($current_dir, 0755);
		}
	}
}