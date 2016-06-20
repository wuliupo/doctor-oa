<?php
namespace Oa\Controller;
use Think\Controller;
use Think\Auth;

class IndexController extends IsLoginController {
    public function index(){
        $this->display();
    }
    public function main(){
    	$this->sess_User = session('user');
    	$this->display();
    }
    public function getLeftMenu(){
    	$sess_Uid = session('uid');

    	$Auth = new Auth();
		$AuthGroups = $Auth->getGroups($sess_Uid);
		foreach($AuthGroups as $v){
			$AuthRules[] = $v['rules'];
		}
		$AuthRules = implode(',', $AuthRules);
		$where = array(
			'rule_id'=>I('id','','int'),
			'display'=>1
		);
		$table_AuthRule = M("AuthRule")->where($where)->order("sort asc")->field("id,title")->select();
		foreach($table_AuthRule as $k => $v){
			$where = array(
				'rule_id'=>$v['id'],
				'display'=>1
			);
			$table_AuthRule_son = M("AuthRule")->where($where)->order("sort asc")->field("id,title as text,cls,name as url")->select();
			foreach($table_AuthRule_son as $k2 => $v2){
				$table_AuthRule_son[$k2]['url'] = __MODULE__."/".$v2['url'];
				$table_AuthRule_son[$k2]['type'] = true;
				$table_AuthRule_son[$k2]['iconCls'] = $v2['cls'];
			}
			$table_AuthRule[$k]['children'] = $table_AuthRule_son;
		}

		$this->ajaxReturn($table_AuthRule);
    }
}