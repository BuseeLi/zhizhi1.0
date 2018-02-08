/*layui左侧导航栏效果*/
$(function(){
	//注意：导航 依赖 element 模块，否则无法进行功能性操作
	layui.use('element', function(){
	  var element = layui.element;
	  
	  //…
	});
});
/*顶部个人中心弹出框*/
$(function(){
	$(".u-owncenter").mouseover(function(){
		$('.m-owncenterDiv').css("display",'block');
	});
	$(".m-owncenterDiv").mouseover(function(){
		$('.m-owncenterDiv').css("display",'block');
	});
	$(".u-owncenter").mouseleave(function(){
		$('.m-owncenterDiv').css("display",'none');
	});
	$(".m-owncenterDiv").mouseleave(function(){
		$('.m-owncenterDiv').css("display",'none');
	});
});
/*调用分页*/
$(function(){
		layui.use(['laypage', 'layer'], function(){
		    var laypage = layui.laypage
		    ,layer = layui.layer;
		    laypage.render({
			    elem: 'u-ms-page2'
			    ,count: 100
			    ,theme: '#40cb85'
			});
			laypage.render({
			    elem: 'u-ms-page3'
			    ,count: 100
			    ,theme: '#40cb85'
			});
		});	
	});
/*下拉列表*/
$(function(){
	//Demo
	layui.use('form', function(){
	  var form = layui.form;
	});
});
/*添加班级日期*/
$(function(){
layui.use('laydate', function(){
	  var laydate = layui.laydate;
	   //时间范围
	  laydate.render({
	    elem: '#dmdaterecord'
	    ,type: 'time'
	    ,range: true
	  });
	  laydate.render({
	    elem: '#dmdaterecord2'
	    ,type: 'time'
	    ,range: true
	  });
	});  
}); 
/*点名记录和缺课记录的切换*/
$(function(){
	$("#u-stumg-course-li").click(function(){
		$("#m-dmrcdDiv").css("display","block");
		$("#m-qkrcdDiv").css("display","none");
	});
	$("#u-stumg-clsmg-li").click(function(){
		$("#m-dmrcdDiv").css("display","none");
		$("#m-qkrcdDiv").css("display","block");
	});
});