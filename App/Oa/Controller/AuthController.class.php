<?php
namespace Oa\Controller;
use Think\Controller;
use Think\Auth;

/**
 * 权限判断核心文件
 * @author [杨圆建] <[624508914@qq.com]>
 */
class AuthController extends Controller{
	public function _initialize(){
		//用户登陆信息检测处理
		$sess_User = session('user');
		if(!is_array($sess_User)){
			$this->error('您还未登录 '.C('TITLE'),U('Login/index'));
		}
		session('login_time',time());
		//超级管理员免验证
		if($sess_User['info']['uid'] == C("ADMIN")){
			return true;
		}

		//检查普通用户权限
		$AuthModel = new Auth();
		if(!$AuthModel->check(CONTROLLER_NAME.'/'.ACTION_NAME,$sess_User['info']['uid'])){
			echo "<div style='padding:10px;'>没有权限</div>";
			exit;
		}
	}
}