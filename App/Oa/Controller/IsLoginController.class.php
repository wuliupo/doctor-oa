<?php
namespace Oa\Controller;
use Think\Controller;

class IsLoginController extends Controller{
	public function _initialize(){
		//用户登陆信息检测处理
		$sess_User = session('user');
		if(!is_array($sess_User)){
			$this->error('您还未登录 '.C('TITLE'),U('Login/index'));
		}
		session('login_time',time());
	}
}