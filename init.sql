
CREATE TABLE `oa_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `title` char(100) NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0，关闭，1正常',
  `rules` text COMMENT '规则id',
  `sort` int(3) unsigned NOT NULL DEFAULT '50' COMMENT '排序id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `oa_auth_group` (`id`, `title`, `status`, `rules`, `sort`)
VALUES
	(1,'超级管理员',1,'',1),
	(2,'普通管理员',1,'1,4,5,6,7,2,8,9,10,11,12,13,14,15,16,17,18,74,52,56,57,58,59,75,20,24,19,68,70,69,71,72',2),
	(3,'测试管理员',1,'1,4,5,6,7,9,73,8,2,12,74,52,75,20,76,19,25,77,47,78,68,79,54,83,53,55,84,91,114,85,3',3);

CREATE TABLE `oa_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '角色id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `oa_auth_group_access` (`uid`, `group_id`)
VALUES
	(1,1),
	(2,3),
	(6,2);

CREATE TABLE `oa_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则ID',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '路径',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '名称',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型：1，url  2，菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，0，关闭，1开启',
  `condition` char(100) NOT NULL DEFAULT '' COMMENT '条件',
  `sort` int(3) unsigned NOT NULL DEFAULT '50' COMMENT '排序',
  `display` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '显示：0，隐藏，1，显示',
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级：0，顶级规则',
  `cls` varchar(50) NOT NULL COMMENT '样式',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `oa_auth_rule` (`id`, `name`, `title`, `type`, `status`, `condition`, `sort`, `display`, `rule_id`, `cls`)
VALUES
	(1,'Person','个人中心',1,1,'',1,1,0,'icons-folder-folder'),
	(2,'Core','系统中心',1,1,'',2,1,0,'icons-folder-folder'),
	(3,'Content','内容管理',1,1,'',3,1,0,'icons-folder-folder'),
	(5,'Person/MyProfiles','我的资料',1,1,'',1,1,4,'icons-group-group_gear'),
	(4,'Person/UserOp','用户操作',1,1,'',1,1,1,'icons-group-group_gear'),
	(6,'Person/LoginLog','登录日志',1,1,'',2,1,4,'icons-page-page_white_text'),
	(7,'Person/EditPass','密码修改',1,1,'',3,1,4,'icons-lock-lock_edit'),
	(8,'Core/CoreSet','后台设置',1,1,'',1,1,2,'icons-other-cog_go'),
	(9,'System/Setting','系统配置',1,1,'',1,1,8,'icons-other-cog'),
	(10,'System/editSetting','更新配置',1,1,'',2,1,9,'icons-other-cog_edit'),
	(11,'System/writeSetting','生成配置',1,1,'',3,1,9,'icons-other-cog_go'),
	(12,'Core/Rule','菜单管理',1,1,'',2,1,8,'icons-tag-tag_blue'),
	(13,'Core/addRule','添加菜单',1,1,'',1,1,12,'icons-tag-tag_blue_add'),
	(14,'Core/editRule','编辑菜单',1,1,'',3,1,12,'icons-tag-tag_blue_edit'),
	(15,'Core/delRule','删除菜单',1,1,'',4,1,12,'icons-tag-tag_blue_delete'),
	(16,'Core/imRule','导入菜单',1,1,'',5,1,12,'icons-other-cog'),
	(17,'Core/exRule','导出菜单',1,1,'',6,1,12,'icons-other-cog'),
	(18,'Core/sortRule','菜单排序',1,1,'',7,1,12,'icons-other-cog'),
	(19,'Core/UserSet','用户设置',1,1,'',2,1,2,'icons-other-bullet_wrench'),
	(20,'User/index','用户管理',1,1,'',1,1,19,'icons-user-user'),
	(21,'User/addUser','添加用户',1,1,'',2,1,20,'icons-other-cog'),
	(22,'User/editUser','编辑用户',1,1,'',3,1,20,'icons-other-cog'),
	(23,'User/delUser','删除用户',1,1,'',4,1,20,'icons-other-cog'),
	(24,'User/resetUserPass','重置密码',1,1,'',5,1,20,'icons-other-cog'),
	(25,'Core/Group','角色管理',1,1,'',2,1,19,'icons-user-user_female'),
	(26,'Core/addGroup','添加角色',1,1,'',2,1,25,'icons-other-cog'),
	(27,'Core/editGroup','编辑角色',1,1,'',3,1,25,'icons-other-cog'),
	(28,'Core/delGroup','删除角色',1,1,'',4,1,25,'icons-other-cog'),
	(29,'Core/setGroup','角色权限配置',1,1,'',5,1,25,'icons-other-cog'),
	(30,'Core/sortGroup','角色排序',1,1,'',6,1,25,'icons-other-cog'),
	(62,'Db','数据库管理',1,1,'',5,1,2,'icons-other-database_connect'),
	(70,'Job/editJob','编辑职务',1,1,'',3,1,68,'icons-other-cog'),
	(69,'Job/addJob','添加职务',1,1,'',2,1,68,'icons-other-cog'),
	(47,'Branch/index','部门管理',1,1,'',3,1,19,'icons-user-user_gray'),
	(48,'Branch/addBranch','添加部门',1,1,'',2,1,47,'icons-other-cog'),
	(49,'Branch/editBranch','编辑部门',1,1,'',3,1,47,'icons-other-cog'),
	(50,'Branch/delBranch','删除部门',1,1,'',4,1,47,'icons-other-cog'),
	(51,'Branch/sortBranch','部门排序',1,1,'',5,1,47,'icons-other-cog'),
	(52,'Panel/index','版块管理',1,1,'',3,1,8,'icons-application-application'),
	(53,'Core/LogSet','日志设置',1,1,'',4,1,2,'icons-script-script_link'),
	(54,'Log/LoginLog','登录日志',1,1,'',1,1,53,'icons-script-script_code'),
	(55,'Log/BehaviorLog','行为日志',1,1,'',2,1,53,'icons-script-script_code_red'),
	(56,'Panel/addPanel','添加版块',1,1,'',2,1,52,'icons-application-application_add'),
	(57,'Panel/editPanel','编辑版块',1,1,'',3,1,52,'icons-application-application_edit'),
	(58,'Panel/delPanel','删除版块',1,1,'',4,1,52,'icons-application-application_delete'),
	(59,'Panel/sorPanel','版块排序',1,1,'',5,1,52,'icons-arrow-arrow_merge'),
	(71,'Job/sortJob','职务排序',1,1,'',4,1,68,'icons-other-cog'),
	(60,'Log/delLoginLog','删除登录日志',1,1,'',2,1,54,'icons-other-cog'),
	(68,'Job/index','职务管理',1,1,'',4,1,19,'icons-user-user_edit'),
	(61,'Log/delBehaviorLog','删除行为日志',1,1,'',2,1,55,'icons-other-cog'),
	(63,'Db/backDb','备份数据',1,1,'',2,0,62,'icons-other-cog'),
	(64,'Db/restDb','还原数据',1,1,'',3,0,62,'icons-other-cog'),
	(65,'Db/seoDb','优化数据',1,1,'',4,0,62,'icons-other-cog'),
	(66,'Db/repairDb','修复数据',1,1,'',5,0,62,'icons-other-cog'),
	(67,'Db/index','查看数据表',1,1,'',1,1,62,'icons-other-cog'),
	(72,'Job/delJob','删除职务',1,1,'',5,1,68,'icons-other-cog'),
	(74,'Core/showRule','查看菜单',1,1,'',2,1,12,'icons-tag-tag_blue'),
	(75,'Core/showPanel','查看版块',1,1,'',1,1,52,'icons-other-cog'),
	(76,'Core/showUser','查看用户',1,1,'',1,1,20,'icons-other-cog'),
	(77,'Core/showGroup','查看角色',1,1,'',1,1,25,'icons-other-cog'),
	(78,'Core/showBranch','查看部门',1,1,'',1,1,47,'icons-other-cog'),
	(79,'Core/showJob','查看职务',1,1,'',1,1,68,'icons-other-cog'),
	(83,'Core/showLoginLog','查看登录日志',1,1,'',1,1,54,'icons-other-cog'),
	(84,'Core/showBehaviorLog','查看行为日志',1,1,'',1,1,55,'icons-other-cog'),
	(85,'Category','栏目管理',1,1,'',1,1,3,'icons-application-application_view_list'),
	(114,'Category/index','栏目列表',1,1,'',1,1,85,'icons-other-cog'),
	(115,'Category/add','添加栏目',1,1,'',2,1,85,'icons-other-cog'),
	(116,'Category/edit','编辑栏目',1,1,'',3,1,85,'icons-other-cog'),
	(117,'Category/del','删除栏目',1,1,'',4,1,85,'icons-other-cog');


CREATE TABLE `oa_behavior_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户行为日志id',
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `ip` varchar(250) NOT NULL COMMENT '用户行为ip',
  `date` datetime NOT NULL COMMENT '用户行为时间',
  `area` varchar(250) NOT NULL COMMENT '用户行为网络',
  `country` varchar(250) NOT NULL COMMENT '用户行为地区',
  `user_agent` text NOT NULL COMMENT '用户行为浏览器信息',
  `controller_name` varchar(250) NOT NULL COMMENT '用户行为方法名称',
  `controller_action` varchar(250) NOT NULL COMMENT '用户行为方法路径',
  `json_data` mediumtext NOT NULL COMMENT '用户行为方法参数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `oa_branch` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `title` varchar(250) NOT NULL COMMENT '名称',
  `sort` int(10) unsigned NOT NULL DEFAULT '50' COMMENT '排序',
  `branch_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级ID，0为顶级部门',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO `oa_branch` (`id`, `title`, `sort`, `branch_id`)
VALUES
	(2,'设备车间',2,0),
	(1,'技术科',1,0);


CREATE TABLE `oa_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(250) NOT NULL COMMENT '名称',
  `key` varchar(250) NOT NULL COMMENT 'key',
  `value` varchar(250) DEFAULT NULL COMMENT 'value',
  `default` varchar(250) DEFAULT NULL COMMENT '默认值',
  `editor` varchar(250) NOT NULL DEFAULT 'text' COMMENT '类型:编辑类型',
  `config_cate_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '所属分类',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO `oa_config` (`id`, `name`, `key`, `value`, `default`, `editor`, `config_cate_id`)
VALUES
	(1,'系统名称','TITLE','通用后台框架','动车OA管理系统','text',1),
	(2,'用户过期时间(分钟)','LOGIN_TIME','86400','10080','text',1),
	(3,'开启登录日志','LOGIN_LOG','true','true','text',1),
	(4,'开启行为日志','BEHAVIOR_LOG','true','true','text',1),
	(5,'S缓存有效期(秒)','S_TIME','3600','3600','text',1),
	(6,'到期提示时间(天)','EXPIRE_DATE','90','30','text',1);


CREATE TABLE `oa_config_cate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置分类ID',
  `title` varchar(250) NOT NULL COMMENT '名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO `oa_config_cate` (`id`, `title`)
VALUES
	(1,'后台设置'),
	(2,'核心参数');


CREATE TABLE `oa_job` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '职务id',
  `title` varchar(100) NOT NULL COMMENT '职务名称',
  `sort` int(10) unsigned NOT NULL DEFAULT '50' COMMENT '职务排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO `oa_job` (`id`, `title`, `sort`)
VALUES
	(1,'超级管理员',1),
	(3,'普通管理员',2),
	(8,'后台编辑',3);


CREATE TABLE `oa_login_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户登陆日志id',
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `ip` varchar(250) NOT NULL COMMENT '用户登陆ip',
  `date` datetime NOT NULL COMMENT '用户登陆时间',
  `area` varchar(250) NOT NULL COMMENT '用户登陆网络',
  `country` varchar(250) NOT NULL COMMENT '用户登录地区',
  `user_agent` text NOT NULL COMMENT '用户浏览器信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `oa_panel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '版块id',
  `title` varchar(250) NOT NULL COMMENT '标题',
  `content` mediumtext COMMENT '内容',
  `sort` int(3) NOT NULL DEFAULT '50' COMMENT '排序id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO `oa_panel` (`id`, `title`, `content`, `sort`)
VALUES
	(2,'安全提示','&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;网站上线后建议在index.php中关闭DEBUG调试模式。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;',1),
	(3,'系统说明','&lt;p&gt;&lt;span style=&quot;font-size: 12px; font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;;&quot;&gt;基于ThinkPHP和EasyUI的通用后台管理 v1.0&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(255, 0, 0); font-size: 12px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color: rgb(255, 0, 0); font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;;&quot;&gt;本系统采用（ThinkPHP 3.2.3 + jQuery EasyUI 1.4.4）框架&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(255, 0, 0); font-size: 12px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color: rgb(255, 0, 0); font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;; font-size: 12px;&quot;&gt;开发二次开发参考手册：&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;a href=&quot;http://doc.thinkphp.cn/&quot; _src=&quot;http://doc.thinkphp.cn/&quot; style=&quot;font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;; text-decoration: underline; font-size: 12px;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;; font-size: 12px;&quot;&gt;http://doc.thinkphp.cn/&lt;/span&gt;&lt;/a&gt;&lt;/p&gt;&lt;p&gt;&lt;a href=&quot;http://jeasyui.com/documentation/&quot; _src=&quot;http://jeasyui.com/documentation/&quot; style=&quot;font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;; text-decoration: underline; font-size: 12px;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;; font-size: 12px;&quot;&gt;http://jeasyui.com/documentation/&lt;/span&gt;&lt;/a&gt;&lt;/p&gt;',2),
	(4,'asdasdsadsadads','&lt;p&gt;wdadadawdawdawdawdad&lt;/p&gt;',3);


CREATE TABLE `oa_session` (
  `session_id` varchar(255) NOT NULL,
  `session_expire` int(11) NOT NULL,
  `session_data` blob,
  UNIQUE KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `oa_session` (`session_id`, `session_expire`, `session_data`)
VALUES
	('5b0fe7cc1939987e87c8b6d598dba5ce',1458100104,X'7569647C733A313A2231223B6C6F67696E5F74696D657C693A313435383039383537393B757365727C613A313A7B733A343A22696E666F223B613A31323A7B733A333A22756964223B733A313A2231223B733A343A226E616D65223B733A353A2261646D696E223B733A343A2270617373223B733A33323A226531306164633339343962613539616262653536653035376632306638383365223B733A353A227469746C65223B733A31353A22E8B685E7BAA7E7AEA1E79086E59198223B733A363A226A6F625F6964223B733A313A2231223B733A353A2270686F6E65223B733A31313A223138313739363132323735223B733A323A227171223B733A363A22363132303132223B733A353A227669736974223B733A313A2231223B733A363A22737461747573223B733A313A2231223B733A31303A22646174615F6C6576656C223B733A313A2231223B733A393A226272616E63685F6964223B733A313A2231223B733A31313A226372656174655F64617465223B733A31393A22323031342D31322D30312030303A30303A3030223B7D7D');


CREATE TABLE `oa_unit` (
  `un_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '单位id',
  `unitname` varchar(20) NOT NULL COMMENT '单位名称',
  PRIMARY KEY (`un_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='单位名称表';


INSERT INTO `oa_unit` (`un_id`, `unitname`)
VALUES
	(1,'上海动车段'),
	(2,'上海动车段杭州地区'),
	(4,'上海动车段上海地区'),
	(5,'上海动车段南京地区'),
	(6,'上海动车段合肥地区');


CREATE TABLE `oa_user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(20) NOT NULL COMMENT '登录名',
  `pass` varchar(32) NOT NULL COMMENT '登录密码',
  `title` varchar(20) NOT NULL DEFAULT '0' COMMENT '昵称',
  `job_id` tinyint(1) unsigned NOT NULL DEFAULT '6' COMMENT '职务id',
  `phone` varchar(11) NOT NULL DEFAULT '0' COMMENT '电话',
  `qq` varchar(15) NOT NULL DEFAULT '0' COMMENT 'QQ',
  `visit` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '回访权限：0，禁用，1，回访',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态：0，禁用，1，正常',
  `data_level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '数据管理：0，普通，1，管理',
  `branch_id` int(10) unsigned NOT NULL COMMENT '部门id',
  `create_date` datetime NOT NULL COMMENT '创建用户时间',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `UNIQUE` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO `oa_user` (`uid`, `name`, `pass`, `title`, `job_id`, `phone`, `qq`, `visit`, `status`, `data_level`, `branch_id`, `create_date`)
VALUES
	(1,'admin','e10adc3949ba59abbe56e057f20f883e','超级管理员',1,'18179612275','612012',1,1,1,1,'2014-12-01 00:00:00'),
	(2,'guest','e10adc3949ba59abbe56e057f20f883e','测试账号',8,'18016496198','612012',0,1,0,1,'2015-02-14 10:33:19'),
	(6,'link','e10adc3949ba59abbe56e057f20f883e','link',3,'18016496198','612012',1,1,0,1,'0000-00-00 00:00:00');


CREATE TABLE `oa_user_hosp` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `hosp_id` int(10) unsigned NOT NULL COMMENT '医院id',
  UNIQUE KEY `UNIQUE` (`uid`,`hosp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO `oa_user_hosp` (`uid`, `hosp_id`)
VALUES
	(2,1),
	(2,2),
	(3,1),
	(3,2);