<?php
namespace Oa\Controller;
use Think\Controller;

class LoginController extends Controller{
	/**
	 * [index 登录首页]
	 * @return [type] [description]
	 */
	public function index(){
		$sess_User = session('user');
		if(is_array($sess_User)){
			$this->success('您已登录'.C('TITLE'),U('Index/index'));
			exit;
		}
		if(IS_POST){
			$table_User = D("User");
			if(!$table_User->create($_POST,4)){//登陆失败
				$msg['info'] = $table_User->getError();
				$msg['status'] = false;
				$this->ajaxReturn($msg);
			} else {
				$msg['info'] = "成功登陆，正在跳转会员中心！";
				$msg['status'] = "success";
				$msg['url'] = U("Index/index");
				do_LoginSession();
				$this->ajaxReturn($msg);
			}
			$this->ajaxReturn($msg);
			exit;
		}
		$this->display();
	}
	/**
	 * [code 验证码显示]
	 * @return [type] [description]
	 */
	public function code(){
		$config =    array(
			'fontSize'	=>	40,	 // 字体大小
		    'length'    =>  4,     // 验证码位数
		    'useCurve'	=>	false, // 是否使用混淆曲线
		    'useNoise'  =>	false, // 是否使用噪点
		    'bg'		=>	array(255,255,255),
		);
		$verify = new \Think\Verify($config);
		$verify->entry();
	}
	/**
	 * [logout 退出登录操作]
	 * @return [type] [description]
	 */
	public function logout(){
		session(null);
		$this->success("成功退出，正在转向登陆页面！",U('Login/index'));
	}
	/**
	 * [session_timeout 判断是否登录超时]
	 * @return [type] [description]
	 */
	public function session_timeout(){
		$sess_LoginTime = session('login_time');
		$conf_LoginTime = C('LOGIN_TIME');
		if(time()-$sess_LoginTime >= ($conf_LoginTime * 60)){
			$data['status'] = false;
		} else {
			$data['status'] = true;
		}
		$this->ajaxReturn($data);
	}
}