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
		/*下拉列表*/
		$(function(){
			//Demo
			layui.use('form', function(){
			  var form = layui.form;
			});
		});
		/*教师界面和学生界面切换*/
		$(function(){
			$("#u-stumg-clsmg-li").click(function(){
				$(".m-teachmgDiv").css("display","none");
				$(".m-stumgDiv").css("display","block");
			});
			$("#u-stumg-course-li").click(function(){
				$(".m-teachmgDiv").css("display","block");
				$(".m-stumgDiv").css("display","none");
			});
		});
		/*班级管理调用分页*/
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
		/*添加教师模态框*/
		$(function(){
			$("#u-stumg-addcus").click(function(){
				$(".mark").css("display","block");
				$("#m-addteachDiv").css("display","block");
			});
			$("#u-addteachtitle,#u-addteach-qxclosebtn").click(function(){
				$(".mark").css("display","none");
				$("#m-addteachDiv").css("display","none");
			});
			$(".u-stumg-cosmg-dmbtn").click(function(){
				$(".mark").css("display","block");
				$("#m-mgteachDiv").css("display","block");
			});
			$("#u-mgteachtitle,#u-mgteach-qxclosebtn").click(function(){
				$(".mark").css("display","none");
				$("#m-mgteachDiv").css("display","none");
			});
			$(".u-stumg-cosmg-glbtn").click(function(){
				$(".mark").css("display","block");
				$("#m-scteachDiv").css("display","block");
			});
			$("#u-teachscclosebtn,#u-scteach-qxclosebtn").click(function(){
				$(".mark").css("display","none");
				$("#m-scteachDiv").css("display","none");
			});
		});
		/*单击学生管理表格管理按钮*/
		$(function(){
			$(".u-stumg-mgbtn").click(function(){
				$(".g-main").css("display","none");
				$(".m-stumsgDiv").css("display","block");
			});
			$("#u-stumsg-backbtn").click(function(){
				$(".g-main").css("display","block");
				$(".m-stumsgDiv").css("display","none");
			});
			$("#u-stumg-yibao").click(function(){
				$(".m-stumg-yibaocourseDiv").css("display","block");
				$(".u-historycourseDiv").css("display","none");
			});
			$("#u-stumg-lishi").click(function(){
				$(".m-stumg-yibaocourseDiv").css("display","none");
				$(".u-historycourseDiv").css("display","block");
			});
			/*点击学生管理按钮里面的点击修改按钮*/
			$("#u-stumg-xiugaibtn").click(function(){
				$(".mark").css("display","block");
				$("#g-stumsg-updateDiv").css("display","block");
			});
			$("#u-stumsg-closebtn,.u-stumsg-upqxbtn").click(function(){
				$(".mark").css("display","none");
				$("#g-stumsg-updateDiv").css("display","none");
			});
		});