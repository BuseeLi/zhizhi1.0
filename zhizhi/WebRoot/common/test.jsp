<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>后台员工首页</title>
		<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js" ></script>
		<script src="http://cdn.bootcss.com/blueimp-md5/1.1.0/js/md5.js"></script>
		<script src="../scripts/normal/circle-progress.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="../scripts/normal/echarts.js" ></script>
		<link rel="stylesheet" type="text/css" href="../content/styles/fullcalendar.css">
		<script type="text/javascript" src='../scripts/normal/jquery-ui-1.10.2.custom.min.js'></script>
		<script type="text/javascript" src='../scripts/normal/fullcalendar.min.js'></script>
		<style type="text/css">
			*{margin: 0;padding: 0;font-size: 100%;list-style: none;text-decoration: none;font-family: "微软雅黑";}
			body{background-color: #F7F7F7;overflow: auto;height: 100%;}
			#g-header{top: 0px; background-color:#F7F7F7; width: 100%;height: 80px;box-shadow: 1px 1px 1px #CDCDCD;position: fixed;z-index: 1000!important;}
			#u-hdlogo{height: 60px;width: 6%;margin-top: 10px;margin-left: 1.2%;float: left;}
			#u-hdweijiaru{font-size: 14px;font-family: "微软雅黑";float: left;line-height: 80px;color: #000;margin-left: 4%;}
			#u-hdweijiaru:after{content: " | 北京松果互联信息科技有限公司";color: #666;}
			#u-hdkuaijieslt{ font-size: 14px;border: none; font-family: "微软雅黑";height: 30px;width: 95px;outline: none;margin-left: 60px;appearance: none;-moz-appearance:none; -webkit-appearance:none;  
			background: url(img/selectIcon.png) no-repeat 80px center; color: #1E8AE8;margin-top: 25px; background-color: #F7F7F7;padding-left:10px;}
			#u-hdcancle{float: right;margin-right: 4%;margin-top:30px; height: 20px;width: 20px;}
			#u-hdhelp{float: right;margin-right: 2%;margin-top:30px; height: 20px;width: 20px;}
			#u-hdmess{float: right;margin-right: 2%;margin-top:30px; height: 20px;width: 20px;}
			#u-hduser{float: right;margin-right: 7%;line-height: 80px;font-size: 14px;font-family: "微软雅黑";color: #666;}
			#u-hduser:after{content: " | 员工";}
			/*教务左边第一个导航栏*/
			.banner1{width:8.3%;height: 100%;font-family: "微软雅黑";background-color: #1E8AE8;position: fixed;left:0;top:80px;z-index: 999;}
			.banner1 a{text-decoration: none;}
			.banner1 li{ width: 100%;height: 60px;color: white;font-size: 16px;line-height: 60px;list-style: none;text-align: center;}
			#currChooseBanner1{background-color: #7DB5E8 !important;}
			/*实现导航栏1的效果*/
			.banner1 a li:hover {text-decoration: none;background-color: #7DB5E8 !important;}
			.banner1 a li:visited{text-decoration: none;background-color: #7DB5E8 !important;}
			.banner1 a li:active{text-decoration: none;background-color: #7DB5E8 !important;}
			#g-main{ z-index: 994!important; top: 80px; height: 800px;width:91.6%;position: relative;left: 8.3%;}
			/*统计数据div*/
			#m-tongjishujuDiv{position: absolute; height: 120px;width: 637px;left: 40px; top: 20px;}
			#u-keswcdDiv{float: left; height: 90px;width: 199px;margin-top: 15px; background-color: #fff;box-shadow: 0px 0px 0.3px 0.3px #fff;}
			#u-keswcdtitle{font-size: 14px;color: #666;margin-left: 8px;}
			#u-keswcd-zhou{font-size: 12px;color: #999;float: right;margin-right: 5px;margin-top: 5px;}
			#u-keswcd-yangshi{float: left; height: 40px;width: 4px;background: linear-gradient(to bottom,#fdb39d,#fe8580);margin-left: 10px;margin-top: 10px;}
			#u-keswcd-data{font-size: 30px;text-align: center;color: #333; float: left;margin-left: 10px;margin-top: 7px; height:40px;width: 30px;}
			#u-keswcd-zengjia{font-size: 18px;text-align: center;color: #41c951;line-height: 40px; float: left;margin-left:10px;margin-top: 7px; height:40px;width: 30px;}
			#u-keswcd-circle{float: left;margin-left:25px; height:50px;width:50px;}
			#u-keswcd-perc{font-size: 14px;color: #333; top: 54px;left: 133px;height: 20px;width: 20px;position: absolute;}
			#u-renwwcdDiv{float: left; height: 90px;width: 199px;margin-top: 15px; margin-left: 20px; background-color: #fff;box-shadow: 0px 0px 0.3px 0.3px #fff;}
			#u-renwwcd-yangshi{float: left; height: 40px;width: 4px;background: linear-gradient(to bottom,#02e092,#81efff);margin-left: 10px;margin-top: 10px;}
			#u-renwwcd-data{font-size: 30px;text-align: center;color: #333; float: left;margin-left: 10px;margin-top: 7px; height:40px;width: 30px;}
			#u-renwwcd-zengjia{font-size: 18px;text-align: center;color: #41c951;line-height: 40px; float: left;margin-left:10px;margin-top: 7px; height:40px;width: 30px;}
			#u-renwwcd-circle{float: left;margin-left:25px; height:50px;width:50px;}
			#u-renwwcd-perc{font-size: 14px;color: #333; top: 54px;left: 350px;height: 20px;width: 20px;position: absolute;}
			#u-kehslhgjdDiv{float: left; height: 90px;width: 199px;margin-top: 15px; margin-left: 20px; background-color: #fff;box-shadow: 0px 0px 0.3px 0.3px #fff;}
			#u-kehslgjd-yangshi{float: left; height: 40px;width: 4px;background: linear-gradient(to bottom,#d593fa,#81efff);margin-left: 10px;margin-top: 10px;}
			#u-kehslgjd-data{font-size: 30px;text-align: center;color: #333; float: left;margin-left: 10px;margin-top: 7px; height:40px;width: 30px;}
			#u-kehslgjd-zengjia{font-size: 18px;text-align: center;color: #41c951;line-height: 40px; float: left;margin-left:10px;margin-top: 7px; height:40px;width: 30px;}
			#u-kehslgjd-circle{float: left;margin-left:25px;height:50px;width:50px;}
			#u-kehslgjd-perc{font-size: 14px;color: #333; top: 54px;left: 571px;height: 20px;width: 20px;position: absolute;}
			
			/*上课安排div*/
			#m-shangkeanpaiDiv{background-color: #fff; position: absolute; height: 400px;width: 420px;left:697px;top:35px;}
			#u-shangkaptitle{display: inline-block;margin-left: 10px; font-size: 14px;color: #333;height: 20px;margin-top:1px; }
			#u-shangkapaddbtn{position: relative;outline: none; top: 4px;right: 10px; float: right; height: 25px;border-radius: 20px;font-size: 12px;color: #cd99fb; border:1px solid #cd99fb;background-color: #fff; width: 50px;}
			#calendar{ height: 372px;width: 100%;margin-top: 15px;background-color: #fff;}
			#calendar div{font-size: 14px;}
			#calendar div::-webkit-scrollbar{ width: 10px; background-color: white;}
			#calendar div::-webkit-scrollbar-thumb{ border-radius: 10px; background-color: #E5E5E5;}			
			
			#m-daibanshixiangDiv{ background-color: #fff; position: absolute; height: 305px; width: 637px;left: 40px;top: 140px;}
			.u-daibsxslt{cursor: pointer; background:url(img/selecticongray.png) no-repeat 60px center; line-height: 25px;font-size: 12px;color: #666; width: 80px;height: 25px;}
			.u-daibsxslt li{background-color: #eee;border-bottom: 1px solid #fff;}
			#u-daibsxsltallcls{position: absolute;left: 120px;top: 0px;}
			#u-daibsxsltallstu{position: absolute;left: 210px;top: 0px;}
			#u-daibsxsltalltime{position: absolute;left: 300px;top: 0px;}
			#u-daibsxmain{width: 100%;height: 270px;margin-top: 10px;overflow: auto;}
			#u-daibsxmain::-webkit-scrollbar{ width: 10px; background-color: white;}
			#u-daibsxmain::-webkit-scrollbar-thumb{ border-radius: 10px; background-color: #E5E5E5;}
			#u-daibsxmain ul li{height: 45px;margin-top: 10px;}
			#u-daibsxmain img:nth-child(1){height: 28px;width: 28px;margin-top: 2px;margin-left: 5px;float: left; }
			#u-daibsxmain div{height: 32px;margin-left: 38px; }
			#u-daibsxmain div p:nth-child(1){font-size: 12px;color: #666;display: block;}
			#u-daibsxmain div p:nth-child(2){font-size: 12px;color: #999;}
			#u-daibsxmain div p:nth-child(2) span:nth-child(1){display: inline-block;width:320px;}
			#u-daibsxmain div p:nth-child(2) span:nth-child(2){float: right;margin-right: 50px;}
			#u-daibsxyiwugengduo{font-size: 12px;text-align: center;color: #999;}
			
			#m-pingfentongjiDiv{background-color: #fff; position: absolute;height: 270px;width: 637px;left: 40px;top:465px ;}
			#u-pingftjtitle{font-size: 14px;color: #666;margin-left: 10px;margin-top: 5px;}
			#u-pingftjecharts{height: 230px;margin-top:10px;width: 100%;}
			
			
			#m-duoweipingceDiv{position: absolute; height: 270px;width: 420px;left:697px;top: 450px;}
			#u-duowpctitle{font-size: 16px;color: #333;}
			#u-duowpcmain{height: 270px; width: 100%;margin-top: 15px;background-color: #fff;}
			#u-duowpcdate{float: right;font-size: 12px;color: #999;margin-right: 10px;margin-top: 10px;}
			#u-duowpcecharts{height: 240px;width:300px;position: absolute;left: 50px;top: 45px;}
			#u-duowpc-pingfen{position: absolute;left: 10px;top: 20px;font-size: 14px;color: #666;}
			#u-duowpc-pingfendata{font-size: 14px;color: #3ac7c8; position: absolute;left: 100px;top: 20px;}
		</style>
		
		<script>
			/*calendar*/
			$(function() {
				var date = new Date();
				var d = date.getDate();
				var m = date.getMonth();
				var y = date.getFullYear();
				$('#calendar').fullCalendar({
					header: {
						left: '',
						right: ''
					},
					defaultView:'agendaWeek',
					firstDay:1,
					weekends:true,
					height:372,
					allDaySlot:false,
					minTime:8,
					maxTime:20,
					editable: false,
					aspectRatio:1,
					/*单击已有的事件*/
					eventClick:function(event){
						$("#calendar").fullCalendar('removeEvents',event.id);
					},
					/*单击添加事件*/
					dayClick:function(event){
						$.ajax({
							type:"post",
							url:"",
							async:true
						});
					},
					eventBackgroundColor:"#D4EED3",
					eventBorderColor:"#D4EED3",
					eventTextColor:"#666",
					timeFormat: 'H:mm',
					axisFormat: 'H:mm',
					events:function(start, end, callback){
						var events=[];
						$.ajax({
							type:'post',
							url:'http://localhost:8080/zhizhi/account/readAgenda',
							dataType:'json',
							success:function(data){
								for(var i=0;i<data.length;i++){
							     	var ev=data[i];
							    	var title=ev.TITLE;
							    	var startStr=ev.STARTDATE;
							    	var start=new Date(startStr.replace("-", "/").replace("-", "/"));
							    	alert(start);
							    	var endStr=ev.ENDDATE; 
							    	var end=new Date(endStr.replace("-", "/").replace("-", "/"));
							    	alert(end);
							    	events.push({
							    		title: title,
										start: start,
										end:end,
										allDay: false
							    	});
							    } 
								callback(events);
							},
							error:function() {  
		                        alert('sdf')  
		                    }  
						});
						
						/*var events=[];
							events.push({
							title:'1111111',
							start: new Date(y, m, d+1, 8, 30),
						});
						return events;*/
					}
				});
			});
			function callback(arr){
			    alert(arr);
			}
			
			/*日程event*/
		/*	function richeng(){
					
			}*/
			
			
			
			/*canvas*/
			$(function(){
				$('#u-keswcd-circle').circleProgress({
					value: 0.9,
					size: 55,
					fill: {
						gradient: ["#fdb39d", "#fe8580"]
					}
				});
				
				$('#u-renwwcd-circle').circleProgress({
					value: 0.5,
					size: 55,
					fill: {
						gradient: ["#02e092", "#00aee3"]
					}
				});
				
				$('#u-kehslgjd-circle').circleProgress({
					value: 0.5,
					size: 55,
					fill: {
						gradient: ["#d594fa", "#81efff"]
					}
				});
			});
			/*图表*/
			$(function(){
					duoweidata(5,7,9,1,5);
			}); 
			
			function duoweidata(gongzuoqiangdudata,zonghedefendata,attitudedata,xiaolvdata,zhixingablitydata){
				var myChart = echarts.init(document.getElementById('u-duowpcecharts'));
			    var option = {
			            title : {
			
			            },
			            tooltip : {
			                trigger: 'item',
			                extraCssText:'width:90px;height:110px;background:#666;line-height:16px; '
			            },
			            calculable : true, 	
			            polar : [
			                {
			                    name: { show: true,textStyle:{fontSize:16,color:"#32cd32"}},
			                    indicator : [
			                        {text : '工作强度', max  : 10},
			                        {text : '综合得分', max  : 10},
			                        {text : '态度', max  : 10},
			                        {text : '效率', max  : 10},
			                        {text : '执行能力', max  : 10},
			                    ],center : ['50%','50%'],
			                    radius : 85 //半径，可放大放小雷达图
			                }
			            ],
			            series : [
			                {
			                    name:'',
			                    type: 'radar',//图表类型 radar为雷达图
			                    itemStyle: {
			                        normal: {
			                        	color:"#3ac7c8", /*Rader point color*/
			                            lineStyle: {
			                                color :"#65f2d9",
			                                width : 2
			                            },
			                            areaStyle: {
			                                color:"#60fbc8",
			                                type: 'default'
			                            }
			                           
			                        }
			                    },
			                    symbolSize :6.5,
			                    
			                  data : [{ value:[gongzuoqiangdudata,zonghedefendata,attitudedata,xiaolvdata,zhixingablitydata]}]  
			                    
			                }
			            ]
			        };
			        myChart.setOption(option); 
			    }
		
			/*模拟下拉列表框*/
			$(function(){
				/*所有分类*/
				$("#u-daibsxslttitle").click(function(){
					$("#u-daibsxsltallcls ul").show();
				});
				$("#u-daibsxsltallcls ul li").click(function(){
					$("#u-daibsxsltallcls ul").css("display","none");
					$("#u-daibsxslttitle").text($(this).text());
				});
				/*所有状态*/
				$("#u-daibsxslttitle2").click(function(){
					$("#u-daibsxsltallstu ul").show();
				});
				$("#u-daibsxsltallstu ul li").click(function(){
					$("#u-daibsxsltallstu ul").css("display","none");
					$("#u-daibsxslttitle2").text($(this).text());
				});
				/*所有时间*/
				$("#u-daibsxslttitle3").click(function(){
					$("#u-daibsxsltalltime ul").show();
				});
				$("#u-daibsxsltalltime ul li").click(function(){
					$("#u-daibsxsltalltime ul").css("display","none");
					$("#u-daibsxslttitle3").text($(this).text());
				});
			
				document.onclick=function(e){
						var o=e.target||e.srcElement;
						if(o.id!="u-daibsxslttitle"){
							$("#u-daibsxsltallcls ul").css("display","none");
						}
						if(o.id!="u-daibsxslttitle2"){
							$("#u-daibsxsltallstu ul").css("display","none");
						}
						if(o.id!="u-daibsxslttitle3"){
							$("#u-daibsxsltalltime ul").css("display","none");
						}
							
				}
			});
			
			/*最近十五天数据*/
			$(function(){
				var myChart = echarts.init(document.getElementById('u-pingftjecharts'));
				var data = [1, 2, 6, 7, 9, 8, 9, 7, 9, 7, 1, 1, 4,8, 7];
				var yMax = 10;
				var dataShadow = [];
				option = {
				    title: {
				    },
				    tooltip : {
				         trigger: 'axis',
				        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
				            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
				        }
				    },
				     xAxis : {
				        axisLine: {
				            show: false
				        },
				        axisTick: {
				            show: false
				        },
				        type : 'category',
				        data : ['1', '2', '3', '4', '5', '6', '7','8','9','10','11','12','13','14','15'],
				        axisLabel: {
				            textStyle: {
				                color: '#999'
				            }
				        }
				    },
				    yAxis: {
				        axisLine: {
				            show: false
				        },
				        axisTick: {
				            show: false
				        },
				        axisLabel: {
				            textStyle: {
				                color: '#999'
				            }
				        }
				    },
				    series: [
				        { // For shadow
				            type: 'bar',
				            itemStyle: {
				                normal: {color: 'rgba(0,0,0,0.8)'}
				            },
				            barGap:'-70%',
				            barCategoryGap:'40%',
				            data: dataShadow,
				            animation: false
				        },
				        {
				        	name:'当前数据',
				            type: 'bar',
				            itemStyle: {
				                normal: {
				                    color: new echarts.graphic.LinearGradient(
				                        0, 0, 0,0.8,
				                        [
				                            {offset: 0, color: '#6fddff'},
				                            {offset: 0.5, color: '#67eee1'},
				                            {offset: 1, color: '#60fbc8'}
				                        ]
				                    )
				                },
				            },
				            data: data
				        }
				    ]
				};
				myChart.setOption(option); 
			});
			
		</script>
	</head>
	<body>
		<header id="g-header">
			<img id="u-hdlogo" src="img/logo_blue.svg"/>
			<p id="u-hdweijiaru">松果教育</p>
			<select id="u-hdkuaijieslt">
				<option value="">快捷功能</option>
				<option value=""></option>
			</select>
			<img id="u-hdcancle" src="img/Cancel.png" />
			<img id="u-hdhelp" src="img/helpicon.png"/>
			<img id="u-hdmess" src="img/message.png"/>
			<p id="u-hduser">18270613396</p>
		</header>
		<!--教务教师管理-->
		<div class="banner1">
			<ul>
    			<a href="#"><li id="currChooseBanner1">首页</li></a>
    			<a href="#"><li>教务</li></a>
    			<a href="#"><li>办公</li></a>
    			<a href="#"><li>运营</li></a>
    			<a href="#"><li>数据</li></a>
    			<a href="#"><li>扩展</li></a>
    			<a href="#"><li>设置</li></a>
    		</ul>
		</div>
		<div id="g-main">
			<div id="m-tongjishujuDiv">
				<div id="u-keswcdDiv"">
					<span id="u-keswcdtitle">课时完成度</span>
					<span id="u-keswcd-zhou">周</span><br/>
					<div id="u-keswcd-yangshi"></div>
					<div id="u-keswcd-data">13</div>
					<div id="u-keswcd-zengjia">+10</div>
					<div id="u-keswcd-circle"></div>
					<div id="u-keswcd-perc">85%</div>
				</div>
				<div id="u-renwwcdDiv">
					<span id="u-keswcdtitle">任务完成度</span>
					<span id="u-keswcd-zhou">周</span><br/>
					<div id="u-renwwcd-yangshi"></div>
					<div id="u-renwwcd-data">13</div>
					<div id="u-renwwcd-zengjia">+10</div>
					<div id="u-renwwcd-circle"></div>
					<div id="u-renwwcd-perc">65%</div>
				</div>
				<div id="u-kehslhgjdDiv">
					<span id="u-keswcdtitle">客户数量和跟进度</span>
					<span id="u-keswcd-zhou">周</span><br/>
					<div id="u-kehslgjd-yangshi"></div>
					<div id="u-kehslgjd-data">15</div>
					<div id="u-kehslgjd-zengjia">+10</div>
					<div id="u-kehslgjd-circle"></div>
					<div id="u-kehslgjd-perc">55%</div>
				</div>
			</div>
			<div id="m-shangkeanpaiDiv">
				<p id="u-shangkaptitle">工作安排</p>
				<button id="u-shangkapaddbtn">添加</button><br />
				<div id="calendar" style=""></div>
			</div>
			<div id="m-daibanshixiangDiv">
				<span id="u-keswcdtitle">任务和通知</span>
				<!--模拟下拉按钮-->
				<div class="u-daibsxslt" id="u-daibsxsltallcls">
					<div id="u-daibsxslttitle">所有分类</div>
					<ul hidden>
						<li>所有分类</li>
						<li>北京</li>
						<li>上海</li>
						<li>南昌</li>
					</ul>
				</div>
				<div class="u-daibsxslt" id="u-daibsxsltallstu">
					<div id="u-daibsxslttitle2">所有状态</div>
					<ul hidden>
						<li>所有状态</li>
						<li>完成</li>
						<li>未完成</li>
					</ul>
				</div>
				<div class="u-daibsxslt" id="u-daibsxsltalltime">
					<div id="u-daibsxslttitle3">所有时间</div>
					<ul hidden>
						<li>所有时间</li>
						<li>今天</li>
						<li>明天</li>
					</ul>
				</div>
				<div id="u-daibsxmain">
					<ul>
						<li>
							<img src="img/renwuicon.png"/>
							<div>
								<p>
									<span>任务提醒</span>
									<img src="img/tixing3.png" style="height: 10px;width: 10px;"/>
								</p>
								<p>
									<span>高小浩：书画故事都会公司登记设计公司结构施工技</span>
									<span>2017/12/14  09:33</span>
								</p>
							</div>
						</li>
						<li>
							<img src="img/neibutongzhiicon.png"/>
							<div>
								<p>内部通知</p>
								<p>
									<span>高小浩：书画故事都会公司登记设计公司结构施工技</span>
									<span>2017/12/14  09:33</span>
								</p>
							</div>
						</li>
						<li>
							<img src="img/xitongtongzhiicon.png"/>
							<div>
								<p>系统通知</p>
								<p>
									<span>高小浩：书画故事都会公司登记设计公司结构施工技</span>
									<span>2017/12/14  09:33</span>
								</p>
							</div>
						</li>
						<li>
							<img src="img/xitongtongzhiicon.png"/>
							<div>
								<p>系统通知</p>
								<p>
									<span>高小浩：书画故事都会公司登记设计公司结构施工技</span>
									<span>2017/12/14  09:33</span>
								</p>
							</div>
						</li>
						<li>
							<img src="img/xitongtongzhiicon.png"/>
							<div>
								<p>系统通知</p>
								<p>
									<span>高小浩：书画故事都会公司登记设计公司结构施工技</span>
									<span>2017/12/14  09:33</span>
								</p>
							</div>
						</li>
						<li>
							<img src="img/xitongtongzhiicon.png"/>
							<div>
								<p>系统通知</p>
								<p>
									<span>高小浩：书画故事都会公司登记设计公司结构施工技</span>
									<span>2017/12/14  09:33</span>
								</p>
							</div>
						</li>
						<li>
							<img src="img/xitongtongzhiicon.png"/>
							<div>
								<p>系统通知</p>
								<p>
									<span>高小浩：书画故事都会公司登记设计公司结构施工技</span>
									<span>2017/12/14  09:33</span>
								</p>
							</div>
						</li>
					</ul>
					<p id="u-daibsxyiwugengduo">已无更多...</p>
				</div>
			</div>
			<div id="m-pingfentongjiDiv">
				<p id="u-pingftjtitle">评分统计</p>
				<div id="u-pingftjecharts"></div>
				
			</div>
			<div id="m-duoweipingceDiv">
				<div id="u-duowpcmain">
					<span id="u-duowpcdate">昨日</span>
					<div id="u-duowpcecharts"></div>
					<span id="u-duowpc-pingfen">昨日综合评分</span>
					<span id="u-duowpc-pingfendata">6.5</span>
				</div>
			</div>
		</div>
	</body>
</html>
