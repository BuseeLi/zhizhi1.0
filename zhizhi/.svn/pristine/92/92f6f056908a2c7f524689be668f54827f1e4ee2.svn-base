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
			/*关闭提示*/
			$(function(){
				$("#u-stumg-tipcls,#u-stumg-clsmgtip").click(function(){
					$(".u-stumg-tipDiv").css("display","none");
					$(".u-stumg-tipDiv1").css("display","inline-block");
				});
			});
			/*课程添加模态框*/
			$(function(){
				$("#u-stumg-addcus").click(function(){
					$("#g-stumg-addstuMt").css("display","block");
					$(".mark").css("display","block");
				});
				$("#u-stumg-addstuclosebtn,#u-stumg-addstuqxbtn").click(function(){
					$("#g-stumg-addstuMt").css("display","none");
					$(".mark").css("display","none");
				});
			});
			/*课程管理模态框*/
			$(function(){
				$("").click(function(){
					$("#g-stumg-upstuMt").css("display","block");
					$(".mark").css("display","block");
				});
				$("#u-stumg-addstuclosebtn,#u-stumg-upstuqxbtn").click(function(){
					$("#g-stumg-upstuMt").css("display","none");
					$(".mark").css("display","none");
				});
			})
			/*删除课程模态框*/
			$(function(){
				$("").click(function(){
					$(".g-stumg-scstuMt").css("display","block");
					$(".mark").css("display","block");
				});
				$("#u-stumg-scstuclosebtn,.u-stumg-scstuclbtn").click(function(){
					$(".g-stumg-scstuMt").css("display","none");
					$(".mark").css("display","none");
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
				});	
			});
			/*添加班级日期*/
			$(function(){
				layui.use('laydate', function(){
			  var laydate = layui.laydate;
			  //常规用法
			  laydate.render({
			    elem: '#addclsdata'
			  });
			   laydate.render({
			    elem: '#clsmgdata'
			  });
			   //时间范围
			  laydate.render({
			    elem: '#test9'
			    ,type: 'time'
			    ,range: true
			  });
			  laydate.render({
			    elem: '#test8'
			    ,type: 'time'
			    ,range: true
			  });
			});  
			});
			/*main-ul*/
			$(function(){
				$("#u-stumg-clsmg-li").click(function(){
					$(".m-stumg-coursemgDiv").css("display","none");
					$(".m-stumg-classmgDiv").css("display","block");
				});
				$("#u-stumg-course-li").click(function(){
					$(".m-stumg-coursemgDiv").css("display","block");
					$(".m-stumg-classmgDiv").css("display","none");
				});
			});
			/*添加班级模态框*/
			$(function(){
				$("#u-stumg-addcoursebtn").click(function(){
					$(".mark").css("display","block");
					$("#g-stumg-addclsMt").css("display","block");
				});
				$("#u-stumg-addclsclosebtn1,#u-stumg-addclsqxbtn").click(function(){
					$(".mark").css("display","none");
					$("#g-stumg-addclsMt").css("display","none");
				});
				$("#u-stumg-addcls-li1").click(function(){
					$("#m-stumg-clsmg-addcls").css("display","block");
					$("#m-stumg-clsmg-sksj").css("display","none");
					$("#u-stumg-addcls-li1").css("border-bottom","2px solid #4aa1ec");
					$("#u-stumg-addcls-li2").css("border-bottom","none");
				});
				$("#u-stumg-addcls-li2").click(function(){
					$("#m-stumg-clsmg-addcls").css("display","none");
					$("#u-stumg-addcls-li1").css("border-bottom","none");
					$("#m-stumg-clsmg-sksj").css("display","block");
					$("#u-stumg-addcls-li2").css("border-bottom","2px solid #4aa1ec");
				});
			});
			/*单击点名按钮*/
			$(function(){
				$(".u-stumg-cosmg-dmbtn").click(function(){
					$(".mark").css("display","block");
					$("#u-stumg-dmsjDiv").css("display","block");
				});
				$("#u-stumg-dmsjdclosebtn,.u-stumg-dmsjdclbtn").click(function(){
					$(".mark").css("display","none");
					$("#u-stumg-dmsjDiv").css("display","none");
				});
				/*点名框*/
				$("#u-dmsjdokbtn").click(function(){
					$(".mark").css("display","block");
					$("#g-stumg-estbdmDiv").css("display","block");
				});
				$("#u-stumg-dmclosebtn,.u-stumg-dmqxbtn").click(function(){
					$(".mark").css("display","none");
					$("#g-stumg-estbdmDiv").css("display","none");
					$("#u-stumg-dmsjDiv").css("display","none");
				});
			});
			/*已经点名信息框*/
			$(function(){
				$("#u-dmtime1").click(function(){
					$("#g-stumg-dmmsgkcDiv").css("display","block");
				});
				$("#u-stumg-dmmsgclosebtn,.u-stumg-dmmsgqxbtn").click(function(){
					$("#u-stumg-dmsjDiv").css("display","none");
					$("#g-stumg-dmmsgkcDiv").css("display","none");
					$(".mark").css("display","none");
				});
				$(".m-stumg-dmmsgdkstuDiv span").hover(function(){
					$(this).css("background-color","#40cb85").css("border","none").css("color","#fff").text("改为缺课");
				});
				$(".m-stumg-dmmsgdkstuDiv span").mouseleave(function(){
					$(this).css("background-color","#fff").css("border","1px solid #4aa1ec").css("color","#4aa1ec").text("高长浩");
				});
				$(".m-stumg-dmmsgqkstuDiv span").hover(function(){
					$(this).css("background-color","#40cb85").css("border","none").css("color","#fff").text("改为缺课");
				});
				$(".m-stumg-dmmsgqkstuDiv span").mouseleave(function(){
					$(this).css("background-color","#fff").css("border","1px solid #f88a8a").css("color","#f88a8a").text("高长浩");
				});
			});
			/*删除班级模态框*/
			$(function(){
				$(".u-stumg-cosmg-scbtn").click(function(){
					$(".mark").css("display","block");
					$("#g-stumg-scclsMt").css("display","block");
				});
				$("#u-stumg-scclsclosebtn,.u-stumg-scclsclbtn").click(function(){
					$("#g-stumg-scclsMt").css("display","none");
					$(".mark").css("display","none");
				});
			});
			/*点击管理按钮*/
			$(function(){
				$(".u-stumg-cosmg-glbtn").click(function(){
					$(".mark").css("display","block");
					$("#g-stumg-mangeDiv").css("display","block");
				});
				$("#u-stumg-mgclosebtn").click(function(){
					$("#g-stumg-mangeDiv").css("display","none");
					$(".mark").css("display","none");
				});
			});
			
			/*点击课程管理中的相关操作超链接*/
			$(function(){
				$(".u-coursemg-glbtn").click(function(){
					$("#g-stumg-upstuMt").css("display","block");
					$(".mark").css("display","block");
				});
				$(".u-coursemg-scbtn").click(function(){
					$("#g-stumg-scstuMt").css("display","block");
					$(".mark").css("display","block");
				});
			});