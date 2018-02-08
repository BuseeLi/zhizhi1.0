<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
+ request.getServerName() + ":" + request.getServerPort()
+ path + "/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>课程班级</title>
		<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js" ></script>
		<link rel="stylesheet" href="../content/styles/globalcss/global.css" />
		<link rel="stylesheet" href="../content/styles/globalcss/input.css" />
		<script type="text/javascript" src="../scripts/normal/input.js" ></script>
		<!--引入LayUI库 2018/01/07 by gao-->
		<link rel="stylesheet" type="text/css" href="../content/styles/layui/css/layui.css"/>
		<script src="../content/styles/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script src="../scripts/normal/jw-coursemg.js"	type="text/javascript" charset="utf-8"></script> 
		<link rel="stylesheet" href="../content/styles/css/jw-coursemg.css" />
	</head>
	<body>
		<!--侧边导航栏-->
		<div class="g-sidenav">
			<div class="m-logoDiv">
				<img src="../content/img/logo_white.svg" />
			</div>
			<ul class="layui-nav layui-nav-tree layui-inline" lay-filter="demo" style="margin-right: 10px;">
				<li class="layui-nav-item"><a href="#">后台首页</a></li>
			  	<li class="layui-nav-item">
				    <a href="javascript:;">教务管理</a>
				    <dl class="layui-nav-child">
				      <dd><a href="<%=basePath%>course/courseJsp">课程班级</a></dd>
				      <dd><a href="jw-stuteach.html">学生教师</a></dd>
				      <dd><a href="jw-dailykw.html">日常课务</a></dd>
				      <dd><a href="jw-filecloud.html">文件云盘</a></dd>
				    </dl>
			  	</li>
				<li class="layui-nav-item">
				    <a href="javascript:;">运营管理</a>
				    <dl class="layui-nav-child">
				      <dd><a href="">客户管理</a></dd>
				      <dd><a href="">续费提醒</a></dd>
				      <dd><a href="">机构展示</a></dd>
				      <dd><a href="">教育直播</a></dd>
				    </dl>
			  	</li>
			  	<li class="layui-nav-item">
				    <a href="javascript:;">财务管理</a>
				    <dl class="layui-nav-child">
				      <dd><a href="">选项一</a></dd>
				      <dd><a href="">选项二</a></dd>
				      <dd><a href="">选项三</a></dd>
				    </dl>
			  	</li>
			  	<li class="layui-nav-item">
				    <a href="javascript:;">数据中心</a>
				    <dl class="layui-nav-child">
				      <dd><a href="">选项一</a></dd>
				      <dd><a href="">选项二</a></dd>
				      <dd><a href="">选项三</a></dd>
				    </dl>
			  	</li>
				<li class="layui-nav-item"><a href="">设置</a></li>
			</ul>
		</div>	
		<!--顶部bar-->
		<div class="g-header">
			<span class="u-hdcurrjigou">超级未来教育</span>
			<span class="u-xiaoquchoose">切换</span>
			<span class="u-owncenter"><span>高长浩</span><img src="../content/img/xiangxia.svg"/></span>
			<span class="u-hd-kuaijie">
				<ul>
					<li><img src="../content/img/calendar.svg"/></li>
					<li><img src="../content/img/tip.svg"/></li>
					<li><img src="../content/img/helpcenter.svg"/></li>
					<li><img src="../content/img/more.svg"/></li>
				</ul>
			</span>
		</div>
		<!--hd的个人中心弹出的下拉框-->
		<div class="m-owncenterDiv layui-anim" data-anim="layui-anim-upbit">
			<ul>
				<li>个人资料</li>
				<li>退出登录</li>
			</ul>
		</div>
		<div class="mark" style="display: none;"></div>
		<!--添加课程模态框-->
		<div class="g-stumg-addstuMt" id="g-stumg-addstuMt">
			<div class="g-stumg-addstutitle">
				<span>课程添加</span>
				<img id="u-stumg-addstuclosebtn" src="../content/img/Mtclosebtn.png" />
			</div>
			<form class="layui-form" action="">
				<span>课程名称</span>
			    <div class="layui-input-inline">
			        <input type="text"  required  oninvalid="setCustomValidity('填写课程！');" oninput="setCustomValidity('');"  autocomplete="off" class="layui-input u-stumg-addcourseipt" />
			    </div>
			    <span>课时数量</span>
			    <div class="layui-input-inline">
			        <input type="text"   required oninvalid="setCustomValidity('输入数量！');" oninput="setCustomValidity('');" autocomplete="off" class="layui-input u-stumg-coursecountipt">
			    </div>
				<span>价格</span>
				<div class="layui-input-inline">
			        <input type="text" required oninvalid="setCustomValidity('输入价格！');" oninput="setCustomValidity('');"   placeholder="输入课程价格" autocomplete="off" class="layui-input u-stumg-coursecountipt">
			    </div>
			    <span>备注信息</span>
			    <div class="layui-input-inline">
			        <textarea type="text"  autocomplete="off" class="layui-input u-stumg-addstumark"></textarea>
			    </div>
				<div class="layui-form-item u-stumg-addstusmt">
					<input type="button" class="layui-btn" id="u-stumg-addstuqxbtn" value="取消"/>
				    <button class="layui-btn" id="u-stumg-addstucsmtbtn" lay-submit="" lay-filter="demo2">确认添加</button>
				</div>
			</form>
		</div>
		<!--课程管理模态框-->
		<div class="g-stumg-addstuMt"  id="g-stumg-upstuMt">
			<div class="g-stumg-addstutitle">
				<span>课程管理</span>
				<img id="u-stumg-addstuclosebtn" src="../content/img/Mtclosebtn.png" />
			</div>
			<form class="layui-form" action="">
				<span>课程名称</span>
			    <div class="layui-input-inline">
			        <input type="text"  required    autocomplete="off" class="layui-input u-stumg-addcourseipt" />
			    </div>
			    <span>课时数量</span>
			    <div class="layui-input-inline">
			        <input type="text"  required  autocomplete="off" class="layui-input u-stumg-coursecountipt">
			    </div>
				<span>价格</span>
				<div class="layui-input-inline">
			        <input type="text" required  autocomplete="off" class="layui-input u-stumg-coursecountipt">
			    </div>
			    <span>备注信息</span>
			    <div class="layui-input-inline">
			        <textarea type="text"  autocomplete="off" class="layui-input u-stumg-addstumark"></textarea>
			    </div>
				<div class="layui-form-item u-stumg-addstusmt">
					<input type="button" class="layui-btn" id="u-stumg-upstuqxbtn" value="取消"/>
				    <button class="layui-btn" id="u-stumg-upstucsmtbtn" lay-submit="" lay-filter="demo2">确认修改</button>
				</div>
			</form>
		</div>
		<!--点击删除课程按钮-->
		<div class="g-stumg-scstuMt" id="g-stumg-scstuMt">
			<img id="u-stumg-scstuclosebtn" src="../content/img/Mtclosebtn.png" />
			<p>课程删除将影响和该课程绑定的班级，确认删除吗？</p>
			<button class="layui-btn layui-btn-primary u-stumg-scstuclbtn">取消</button>
			<button class="layui-btn layui-btn-primary u-stumgscstuokbtn">确认删除</button>
		</div>
		<!--点击班级管理的添加班级-->
		<div class="g-stumg-addstuMt" id="g-stumg-addclsMt">
			<div class="g-stumg-addstutitle g-stumg-addclstitle">
				<span id="u-stumg-addcls-li1">添加班级</span>
				<span id="u-stumg-addcls-li2">排课信息</span>
				<img  id="u-stumg-addclsclosebtn1" src="../content/img/Mtclosebtn.png" />
			</div>
			<!--班级管理-- 添加班级-->
			<form class="layui-form" id="m-stumg-clsmg-addcls" action="" >
				<span>所属课程</span>
			    <div class="layui-input-inline">
			        <input type="text"  required   oninvalid="setCustomValidity('填写课程！');" oninput="setCustomValidity('');"  autocomplete="off" class="layui-input u-stumg-addcourseipt" />
			    </div>
			    <span>班级名称</span>
			    <div class="layui-input-inline">
			        <input type="text"  required    oninvalid="setCustomValidity('填写班级名称！');" oninput="setCustomValidity('');"  autocomplete="off" class="layui-input u-stumg-addcourseipt" />
			    </div>
			    <span>任课教师</span>
			    <div class="layui-input-inline">
			        <input type="text" required oninvalid="setCustomValidity('输入教师名！');" oninput="setCustomValidity('');" autocomplete="off" class="layui-input u-stumg-coursecountipt">
			    </div>
				<span class="u-stumg-clscounttitle">班级容量</span>
				<div class="layui-input-inline">
			        <input type="text" required oninvalid="setCustomValidity('班级容量！');" oninput="setCustomValidity('');"   autocomplete="off" class="layui-input u-stumg-coursecountipt">
			    </div>
			     <span>上课教室</span>
			    <div class="layui-input-inline">
			        <input type="text"  required oninvalid="setCustomValidity('输入教师名！');" oninput="setCustomValidity('');" autocomplete="off" class="layui-input u-stumg-coursecountipt">
			    </div>
				<span class="u-stumg-clscounttitle">课时数量</span>
				<div class="layui-input-inline">
			        <input type="text" required oninvalid="setCustomValidity('班级容量！');" oninput="setCustomValidity('');"  autocomplete="off" class="layui-input u-stumg-coursecountipt">
			    </div>
			    <span>开班日期</span>
			      <div class="layui-input-inline">
			        <input type="text" class="layui-input" id="addclsdata" placeholder="yyyy-MM-dd">
			      </div>
				<div class="layui-form-item u-stumg-addstusmt">
					<input type="button" class="layui-btn" id="u-stumg-addclsqxbtn" value="取消"/>
				    <button class="layui-btn" id="u-stumg-addclscsmtbtn" lay-submit="" lay-filter="demo2">下一步</button>
				</div>
			</form>
			<!--班级管理-- 上课时间-->
			<form class="layui-form m-stumg-sktimefom" id="m-stumg-clsmg-sksj" action="" >
				<span class="u-stumg-skeveweektitle">每周</span>
				<input type="checkbox" name="" title="一" lay-skin="primary" />
				<input type="checkbox" name="" title="二" lay-skin="primary" />
				<input type="checkbox" name="" title="三" lay-skin="primary" />
				<input type="checkbox" name="" title="四" lay-skin="primary" />
				<input type="checkbox" name="" title="五" lay-skin="primary" />
				<input class="u-stumg-ck6" type="checkbox" name="" title="六" lay-skin="primary" />
				<input type="checkbox" name="" title="日" lay-skin="primary" /><br />
				<span class="u-stumg-evedaytitle">每天</span>
				<div class="u-stumg-sltDiv u-stumg-globtnsty u-stumg-skslt">
					<select name="quiz">
					    <option>1</option>
					    <option>2</option>
					</select>
				</div>
				<span  class="u-stumg-evedaytitle">节</span>
				<span  class="u-stumg-sksj">时间</span>
				<div class="u-stumg-sksjDiv">
					 <input  type="text" class="layui-input" id="test9" placeholder=" - ">
					 <input  type="text" class="layui-input" id="test9" placeholder=" - ">
					 <input  type="text" class="layui-input" id="test9" placeholder=" - ">
					 <input  type="text" class="layui-input" id="test9" placeholder=" - ">
				</div>
				<div class="layui-form-item u-stumg-addstusmt">
					<input type="button" class="layui-btn" id="u-stumg-skqxbtn" value="上一步"/>
				    <button class="layui-btn" id="u-stumg-skmtbtn" lay-filter="">确认添加</button>
				</div>
			</form>
			
		</div>
		<!--点击点名按钮-->
		<div class="u-stumg-dmsjdDiv" id="u-stumg-dmsjDiv" >
			<span class="u-stumg-dmsjdtitle">请选择您要点名的时间段</span>	
			<img id="u-stumg-dmsjdclosebtn" src="../content/img/Mtclosebtn.png" />
			<div class="m-stumg-dmsjdchoose">
				<form class="layui-form" action="">
					<input type="radio" name="time" value="" title="17:35~18:00" checked="">
					<input type="radio" name="time" value="" title="19:25~20:35">
					<span id="u-dmtime1">点击查看点名信息</span><span id="u-dmtime2">点击查看点名信息</span><br />
					<input type="radio" name="time" value="" title="20:45~21:20">
					<input type="radio" name="time" value="" title="20:45~21:20">
					<span id="u-dmtime3">点击查看点名信息</span><span id="u-dmtime4">点击查看点名信息</span>
				</form>
			</div>
			<button class="layui-btn layui-btn-primary u-stumg-dmsjdclbtn">取消</button>
			<button class="layui-btn layui-btn-primary u-dmsjdokbtn" id="u-dmsjdokbtn">确认点名</button>
		</div>	
		<!--确认点名-->
		<div class="g-stumg-estbdmDiv" id="g-stumg-estbdmDiv">
			<div class="g-stumg-dmtitleDiv">
				<span>点名</span>
				<img id="u-stumg-dmclosebtn" src="../content/img/Mtclosebtn.png" />
			</div>
			<div class="u-stumg-laststu">丁二牛</div>
			<div class="u-stumg-currstu">张三丰</div>
			<div class="u-stumg-nextstu">王大狗</div>
			<div class="u-stumg-ajbtn" id="u-stumg-W">W</div>
			<div class="u-stumg-ajbtn" id="u-stumg-S">S</div>
			<div class="u-stumg-ajbtn" id="u-stumg-A">A</div>
			<div class="u-stumg-ajbtn" id="u-stumg-D">D</div>
			<span class="u-stumg-ajbtntitle" id="u-stumg-Wtitle">到课</span>
			<span class="u-stumg-ajbtntitle" id="u-stumg-Stitle">缺课</span>
			<span class="u-stumg-ajbtntitle" id="u-stumg-Atitle">上一个</span>
			<span class="u-stumg-ajbtntitle" id="u-stumg-Dtitle">下一个</span>
			<span class="u-stumg-ajexplain">(请用键盘上的WSAD按键控制)</span>
			<span class="u-stumg-qkstutitle">缺课学生</span>
			<div class="u-stumg-qkstuDiv">
				<span>高哈哈</span>
				<span>高哈哈</span>
				<span>高哈哈</span>				
				<span>高哈哈</span>
				<span>高哈哈</span>
			</div>
			<button class="layui-btn layui-btn-primary u-stumg-dmqxbtn">取消</button>
			<button class="layui-btn layui-btn-primary u-stumg-finishdmbtn">完成点名</button>
		</div>
		<!--点击点名后查看点名信息查看-->
		<div class="g-stumg-estbdmDiv" id="g-stumg-dmmsgkcDiv">
			<div class="g-stumg-dmtitleDiv">
				<span>点名信息查看</span>
				<img id="u-stumg-dmmsgclosebtn" src="../content/img/Mtclosebtn.png" />
			</div>
			<span class="u-stumg-dmmsgdkstutitle">到课学生</span>
			<div class="m-stumg-dmmsgdkstuDiv">
				<span>高长浩</span>
				<span>高长浩</span>
				<span>高长浩</span>
				<span>高长浩</span>
				<span>高长浩</span>
				<span>高长浩</span>
			</div>
			<span class="u-stumg-dmmsgqktitle">改为缺课</span>
			<div class="m-stumg-dmmsgqkstuDiv">
				<span>高长浩</span>
				<span>高长浩</span>
				<span>高长浩</span>
				<span>高长浩</span>
				<span>高长浩</span>
				<span>高长浩</span>
			</div>
			<button class="layui-btn layui-btn-primary u-stumg-dmmsgqxbtn">取消</button>
			<button class="layui-btn layui-btn-primary u-stumg-dmmsgfinishdmbtn">保存退出</button>
		</div>
		<!--点击班级管理管理按钮-->
		<div class="g-stumg-mangeDiv" id="g-stumg-mangeDiv" style="display: none;">
			<div class="m-stumg-mgtitle">
				<span>班级管理</span>
				<img id="u-stumg-mgclosebtn" src="../content/img/Mtclosebtn.png" />
			</div>
			<div class="u-stumg-mgleftDiv">
				<form class="layui-form" id="u-stumg-mgleftfom" action="" >
					<span>所属课程</span>
				    <div class="layui-input-inline">
				        <input type="text"   autocomplete="off" class="layui-input u-stumg-addcourseipt" />
				    </div>
				    <span>班级名称</span>
				    <div class="layui-input-inline">
				        <input type="text"   autocomplete="off" class="layui-input u-stumg-addcourseipt" />
				    </div>
				    <span>任课教师</span>
				    <div class="layui-input-inline">
				        <input type="text" autocomplete="off" class="layui-input u-stumg-coursecountipt">
				    </div>
					<span class="u-stumg-mgclscounttitle" style="margin-left: 3px!important;">班级容量</span>
					<div class="layui-input-inline">
				        <input type="text"   autocomplete="off" class="layui-input u-stumg-coursecountipt">
				    </div>
				     <span>上课教室</span>
				    <div class="layui-input-inline">
				        <input type="text" autocomplete="off" class="layui-input u-stumg-coursecountipt">
				    </div>
					<span class="u-stumg-mgclscounttitle" style="margin-left: 3px!important;">课时数量</span>
					<div class="layui-input-inline">
				        <input type="text" autocomplete="off" class="layui-input u-stumg-coursecountipt">
				    </div>
				    <span>开班日期</span>
				      <div class="layui-input-inline">
				        <input type="text" class="layui-input" id="clsmgdata" placeholder="yyyy-MM-dd">
				      </div>
				</form>
			</div>
			<div class="u-stumg-mgrigthDiv">
				<form class="layui-form m-stumg-mgbtnfom"  action="" >
					<span class="u-stumg-skeveweektitle">每周</span>
					<input type="checkbox" name="" title="一" lay-skin="primary" />
					<input type="checkbox" name="" title="二" lay-skin="primary" />
					<input type="checkbox" name="" title="三" lay-skin="primary" />
					<input type="checkbox" name="" title="四" lay-skin="primary" />
					<input type="checkbox" name="" title="五" lay-skin="primary" />
					<input class="u-stumg-ck6" type="checkbox" name="" title="六" lay-skin="primary" />
					<input type="checkbox" name="" title="日" lay-skin="primary" /><span class="u-stumg-dategai">改</span><br />
					<div class="u-stumg-mgclssksjDiv">
						<div class="u-stumg-mgclskeshi">
							<span class="u-stumg-djjks">第一节</span> 
							<input type="text" class="layui-input" id="test9" placeholder=" - ">
							<span class="u-stumg-ksgai">改</span>
							<span class="u-stumg-ksshan">删</span>
						</div>
						<div class="u-stumg-mgclskeshi">
							<span class="u-stumg-djjks">第二节</span> 
							<input type="text" class="layui-input" id="test9" placeholder=" - ">
							<span class="u-stumg-ksgai">改</span>
							<span class="u-stumg-ksshan">删</span>
						</div>
						<div class="u-stumg-mgclskeshi">
							<span class="u-stumg-djjks">第三节</span> 
							<input type="text" class="layui-input" id="test9" placeholder=" - ">
							<span class="u-stumg-ksgai">改</span>
							<span class="u-stumg-ksshan">删</span>
						</div>
						<div class="u-stumg-mgclskeshi">
							<span class="u-stumg-djjks">第四节</span> 
							<input type="text" class="layui-input" id="test9" placeholder=" - ">
							<span class="u-stumg-ksgai">改</span>
							<span class="u-stumg-ksshan">删</span>
						</div>
					</div>
				</form>
			</div>
			<button class="layui-btn layui-btn-primary u-stumg-mgbtnclbtn">取消</button>
			<button class="layui-btn layui-btn-primary u-dmsjdokbtn" id="u-mgbtnokbtn">保存修改</button>
		</div>
		<!--点击班级办理删除按钮-->
		<div class="g-stumg-scclsMt" id="g-stumg-scclsMt">
			<img id="u-stumg-scclsclosebtn" src="../content/img/Mtclosebtn.png" />
			<p>确定删除该班级吗？</p>
			<button class="layui-btn layui-btn-primary u-stumg-scclsclbtn">取消</button>
			<button class="layui-btn layui-btn-primary u-stumgscclsokbtn">确认删除</button>
		</div>
		<!--main-->
		<div class="g-main">
			<ul  class="layui-nav u-ms-nav" id="m-stumgul" lay-filter="">
		        <li class="layui-nav-item layui-this" id="u-stumg-course-li"><a href="#">课程管理</a></li>
			    <li class="layui-nav-item" id="u-stumg-clsmg-li"><a href="#">班级管理</a></li>
			</ul>
			<!--课程管理模态框-->
			<div class="m-stumg-coursemgDiv">
				<button class="layui-btn layui-btn-primary u-stumg-scbtn u-stumg-globtnsty">批量删除</button>
				<form class="layui-form" action="">
					<div class="u-stumg-sltDiv u-stumg-globtnsty">
						<select name="quiz">
						    <option>课程名称</option>
						    <option>课程价格</option>
						</select>
					</div>
					<div class="u-stumg-iptDiv u-stumg-globtnsty">
						<input type="text" name="title" required lay-verify="required" placeholder="输入搜索词" autocomplete="off" class="layui-input"> 
					</div>
				</form>
				<button class="u-stumg-globtnsty" id="u-stumg-sehbtn">搜索</button>
				<button class="layui-btn u-stumg-globtnsty" id="u-stumg-addcus">添加课程</button>
				<button class="layui-btn layui-btn-primary u-stumg-scbtn  u-stumg-globtnsty" id="u-stumg-czsx">重置筛选</button>
				<div class="u-stumg-tipDiv">
					<div id="u-stumg-tipcls">关闭</div>
					<div class="u-stumg-content">添加完课程后，才能添加班级哟。</div>
				</div>
				<div class="u-stumg-tipDiv1">
				</div>
				<!--数据表格-->
				<div class="u-stumg-tabDiv">
					<table class="layui-table" >
						<thead>
						    <tr>
						      <th>课程名称</th>
						      <th>价格</th>
						      <th>课时</th>
						      <th>班级数</th>
						      <th>在读(人)</th>
						      <th>课程创建时间</th>
						      <th>相关操作</th>
						    </tr> 
					    </thead>
						<colgroup>
						    <col width="250">
						    <col width="100">
						    <col width="100">
						    <col width="100">
						    <col width="100">
						    <col width="150">
						    <col width="150">
						</colgroup>
					   	<tbody>
					   		<tr>
						        <td>上海交通大学JavaScript编程</td>
						        <td>2500</td>
						        <td>60</td>
						        <td>4</td>
						        <td>150</td>
						        <td>2018/01/07 19:34</td>
						        <td>
						        	<span class="u-coursemg-glbtn">管理</span>
						        	<span class="u-coursemg-scbtn">删除</span>
						        </td>
						     </tr>
						     <tr>
						        <td>上海交通大学JavaScript编程</td>
						        <td>2500</td>
						        <td>60</td>
						        <td>4</td>
						        <td>150</td>
						        <td>2018/01/07 19:34</td>
						        <td>
						        	<span class="u-stumg-cosmg-glbtn">管理</span>
						        	<span class="u-stumg-cosmg-scbtn">删除</span>
						        </td>
						     </tr>
						     <tr>
						        <td>上海交通大学JavaScript编程</td>
						        <td>2500</td>
						        <td>60</td>
						        <td>4</td>
						        <td>150</td>
						        <td>2018/01/07 19:34</td>
						        <td>
						        	<span class="u-stumg-cosmg-glbtn">管理</span>
						        	<span class="u-stumg-cosmg-scbtn">删除</span>
						        </td>
						     </tr>
					   	</tbody>
				</table>
				</div>
			</div>
			<!--班级管理模态框-->
			<div class="m-stumg-classmgDiv">
				<form class="layui-form" action="">
					<div class="u-stumg-sltDiv u-stumg-globtnsty u-stumg-addcoursesehtitle">
						课程名称
					</div>
					<div class="u-stumg-iptDiv u-stumg-globtnsty">
						<input type="text" name="title" id="" lay-verify="required" placeholder="输入搜索词" autocomplete="off" class="layui-input"> 
					</div>
				</form>
				<button class="u-stumg-globtnsty u-stumg-clsmgsehbtn" id="" >搜索</button>
				<button class="layui-btn u-stumg-globtnsty" id="u-stumg-addcoursebtn">添加课程</button>
				<button class="layui-btn layui-btn-primary u-stumg-scbtn  u-stumg-globtnsty" id="u-stumg-czsx">重置筛选</button>
				<div class="u-stumg-tipDiv" id="u-stumg-clsmgtip">
					<div id="u-stumg-tipcls">关闭</div>
					<div class="u-stumg-content">添加完课程后，才能添加班级哟。</div>
				</div>
				<div class="u-stumg-tipDiv1">
				</div>
				<div class="u-stumg-addcoursetabDiv">
					<table class="layui-table" >
						<thead>
						    <tr>
						      <th>班级名称</th>
						      <th>课程名称</th>
						      <th>任课老师</th>
						      <th>班级容量</th>
						      <th>上课进度</th>
						      <th>相关操作</th>
						    </tr> 
					    </thead>
						<colgroup>
						    <col width="220">
						    <col width="220">
						    <col width="100">
						    <col width="100">
						    <col width="100">
						    <col width="260">
						</colgroup>
					   	<tbody>
					   		<tr>
						        <td>班级名称最多15个字</td>
						        <td>课程名称最多15个字</td>
						        <td>鹿心社</td>
						        <td>20/60</td>
						        <td>20/60</td>
						        <td>
						        	<span class="u-stumg-cosmg-dmbtn">点名</span>
						        	<span class="u-stumg-cosmg-glbtn">管理</span>
						        	<span class="u-stumg-cosmg-scbtn">删除</span>
						        </td>
						     </tr>
						     <tr>
						        <td>班级名称最多15个字</td>
						        <td>课程名称最多15个字</td>
						        <td>鹿心社</td>
						        <td>20/60</td>
						        <td>20/60</td>
						        <td>
						        	<span class="u-stumg-cosmg-dmbtn">点名</span>
						        	<span class="u-stumg-cosmg-glbtn">管理</span>
						        	<span class="u-stumg-cosmg-scbtn">删除</span>
						        </td>
						     </tr>
						     <tr>
						        <td>班级名称最多15个字</td>
						        <td>课程名称最多15个字</td>
						        <td>鹿心社</td>
						        <td>20/60</td>
						        <td>20/60</td>
						        <td>
						        	<span class="u-stumg-cosmg-dmbtn">点名</span>
						        	<span class="u-stumg-cosmg-glbtn">管理</span>
						        	<span class="u-stumg-cosmg-scbtn">删除</span>
						        </td>
						     </tr>
					   	</tbody>
				</table>
				<div id="u-ms-page2"></div>
				</div>
			</div>	
		</div>
	</body>
	<script>
	</script>
</html>