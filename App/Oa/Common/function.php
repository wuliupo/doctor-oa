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