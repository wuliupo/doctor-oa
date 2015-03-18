<?php
namespace Oa\Controller;
use ThinkController;

class CoreController extends AuthController{
	/**
	 * [Rule 菜单管理开始]
	 * ======================================================================
	 */
	public function Rule(){
		if(IS_POST){
			$table_Rules = M("AuthRule");
			$table_Rules = $table_Rules->field("id,title,name,sort,display,cls,rule_id")->order("sort asc")->select();
			$this->ajaxReturn(treeRule($table_Rules));
			exit;
		}
		$this->display();
	}

	public function sortRule(){
		$error_id = "";
		$status = true;
		$sortRule = I("sort");
		foreach($sortRule as $k => $v){
			$data = array(
				"id"=>$k,
				"sort"=>$v
			);
			$status = M("AuthRule")->save($data);
			if ($status === false){
				$error_id = $k;
				break;//当排序失败时，跳出循环
			}
		}
		if($status !== false){
			$data["status"] = true;
			$data["info"] = "菜单排序成功";
		} else {
			$data["status"] = false;
			$data["info"] = "菜单排序失败<br />发生错误的排序ID：$error_id";
		}
		$this->ajaxReturn($data);
	}

	public function exRule(){
		$type = I('download') ? I('download') : false;
		if($type){
			$table_Rule = M("AuthRule")->select();
			header("Content-type:application/data");
			header("Content-Disposition:attachment;filename='菜单管理.data'");
			exit(base64_encode(serialize($table_Rule)));
		} else {
			$sess_downRule = strtoupper(substr(md5(time().rand(10,10000)),5,10));
			session('downRule',$sess_downRule);
			$data['status'] = true;
			$data['info'] = "菜单导出成功";
			$data['url'] = U("Core/exRule",array("download"=>$sess_downRule));
			$this->ajaxReturn($data);
		}
	}

	public function imRule(){
		if(IS_POST){
			$fileTypes = array('data'); // File extensions
			$fileParts = pathinfo($_FILES['file']['name']);
			if (in_array($fileParts['extension'],$fileTypes)) {
				//获取临时上传文件路径
				$tempFile = $_FILES['file']['tmp_name'];
				$data_Rule = file_get_contents($tempFile);
				$data_Rule = unserialize(base64_decode($data_Rule));
				if(is_array($data_Rule)){
					M("AuthRule")->where("1")->delete();
					$status = M("AuthRule")->addAll($data_Rule);
					if($status > 0){
						$data['status'] = true;
						$data['info'] = '菜单导入成功';
					} else {
						$data['status'] = false;
						$data['info'] = '菜单数据导入失败，请手动恢复你备份的菜单数据';
					}
				} else {
					$data['status'] = false;
					$data['info'] = '非法数据';
				}
				$this->ajaxReturn($data);
			} else {
				echo 'Invalid file type.';
			}
		}
	}

	/**
	 * [EndRule 菜单管理结束]
	 */
}