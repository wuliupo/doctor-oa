/**
 * 公共方法
 */
;(function($){
	$.extend({
		/*Oa模块Js开始*/
		"Oa":{
			"tip": function(title,msg,icon,timeout,showType){
				$.messager.progress('close');
				var text = []
				text.push('<div class="messager-icon messager-');
				text.push(icon || 'info');
				text.push('"></div>');
				text.push('<div>' + msg + '</div>');
				$.messager.show({
					title: title || '提示信息',
					msg: text.join(''),
					timeout: timeout || 2000,
					showType: showType || 'slide'
				});
			},
			"sess_verify" : function(url,jumpurl){
		        $.post(url,'',function(data) {
		            if(!data.status){
		                location.href = jumpurl;
		            }
		        },'json');
			},
			"loading": function(msg){
				msg = msg || "正在努力加载中...";
				return "<div class='oa-loading'>"+msg+"</span>";
			},
			"removeLeftMenu": function(stop,titles){
				//加个判断，防止多次点击重复加载
				var options = $('body').layout('panel', 'west').panel('options');
				if(titles == options.title) return false;
				var leftmenu = $("#left").accordion("panels");
				$.each(leftmenu, function(i,n) {
					if(n){
						var t = n.panel("options").title;
						if(titles && titles.length){
							for(var k = 0; k < titles.length; k++){
								if(titles[k] == t) $("#left").accordion("remove", t);
							}
						}else{
							$("#left").accordion("remove", t);
						}
					}
				});
				var pp = $('#left').accordion('getSelected');
				if(pp) {
					var t = pp.panel('options').title;
					if(titles && titles.length){
						for(var k = 0; k < titles.length; k++){
							if(titles[k] == t) $("#left").accordion("remove", t);
						}
					}else{
						$("#left").accordion("remove", t);
					}
				}
				if(!stop){
					this.removeLeftMenu(true, titles);
				}
			},
			//显示打开内容
			'openUrl': function(node){
				if(node.type){
					if($("#oa-tabs").tabs('exists', node.text)){
						$('#oa-tabs').tabs('select', node.text);
					}else{
						$('#oa-tabs').tabs('add',{
							title: node.text,
							href: node.url,
							closable: true,
							cache: true,
							tools:[{
						        iconCls:'icon-mini-refresh',
						        handler:function(){
						            var tab = $("#oa-tabs").tabs("getSelected");
						            tab.panel("refresh",tab[0]['baseUrl']);
						        }
						    }]
						});
					}
				}
			}
		},
	});
})(jQuery);
