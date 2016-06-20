<?php
namespace Oa\Model;
use Think\Model\RelationModel;

class UserModel extends RelationModel{
	protected $_validate = array(
		array('code','checkCode','验证码错误',0,'callback'),
		array('name','checkName','用户名不存在',4,'callback'),
		array('pass','checkPass','密码错误',4,'callback')
	);
	public function checkCode(){
		$verify = new \Think\Verify();
		return $verify->check(I('code'));
	}
	public function checkName(){
		$table_User = M("User")->where(array("name"=>I("name")))->find();
		if(!is_array($table_User)) return false;
	}
	public function checkPass(){
		$table_User = M("User")->where(array("name"=>I("name"),"pass"=>I("pass",0,'md5')))->find();
		if(!is_array($table_User)) return false;
		//登录成功过后记录用户uid
		session('uid',$table_User['uid']);
	}
}