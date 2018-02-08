<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>日常课务</title>
		<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js" ></script>
		<link rel="stylesheet" href="../content/styles/globalcss/global.css" />
		<link rel="stylesheet" href="../content/styles/globalcss/input.css" />
		<script type="text/javascript" src="../scripts/normal/input.js" ></script>
		<!--引入LayUI库 2018/01/07 by gao-->
		<link rel="stylesheet" type="text/css" href="../content/styles/layui/css/layui.css"/>
		<script src="../content/styles/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script src="../scripts/normal/jw-dailykw.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" href="../content/styles/css/jw-dailykw.css" />
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
				      <dd><a href="jw-coursemg.html">课程班级</a></dd>
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
		<div class="mark" style="display:none;"></div>
		<div class="g-main">
			<ul  class="layui-nav u-ms-nav" id="m-stumgul" lay-filter="">
		        <li class="layui-nav-item layui-this" id="u-stumg-course-li"><a href="#">点名记录</a></li>
			    <li class="layui-nav-item" id="u-stumg-clsmg-li"><a href="#">缺课记录</a></li>
			</ul>
			<!--点名记录-->
			<div class="m-dmrcdDiv" id="m-dmrcdDiv">
				<form class="layui-form" action="">
					<div class="u-stumg-sltDiv u-stumg-globtnsty">
						<select name="quiz">
						    <option>班级名称</option>
						    <option>点名教师</option>
						</select>
					</div>
					<div class="u-stumg-iptDiv u-stumg-globtnsty">
						<input type="text" name="title"  autocomplete="off" class="layui-input"> 
					</div>
				</form>
				<button class="u-stumg-globtnsty" id="u-stumg-sehbtn">搜索</button>
				<form class="layui-form" action="">
					<div class="u-stumg-sltDiv u-stumg-globtnsty u-dailykw-datefwtitle">
						日期范围:
					</div>
					<div class="u-stumg-iptDiv u-stumg-globtnsty">
						<input type="text" class="layui-input" id="dmdaterecord" placeholder=" - ">
					</div>
				</form>
				<button class="layui-btn layui-btn-primary u-stumg-scbtn  u-stumg-globtnsty" id="u-stumg-czsx">重置筛选</button>
				<div class="u-stumg-addcoursetabDiv">
					<table class="layui-table" >
						<thead>
						    <tr>
						      <th>点名时间</th>
						      <th>点名教师</th>
						      <th>班级名称</th>
						      <th>应到人数</th>
						      <th>实到人数</th>
						      <th>状态</th>
						      <th>相关操作</th>
						    </tr> 
					    </thead>
						<colgroup>
						    <col width="151">
						    <col width="100">
						    <col width="252">
						    <col width="101">
						    <col width="101">
						    <col width="101">
						    <col width="151">
						</colgroup>
					   	<tbody>
					   		<tr>
						        <td>2018/06/03 19:30</td>
						        <td>张三丰</td>
						        <td>幼儿JavaScript编程</td>
						        <td>30</td>
						        <td>28</td>
						        <td>正常</td>
						        <td>
						        	<span class="u-dailykw-dmck">查看</span>
						        	<span class="u-dailykw-dmsc">删除</span>
						        </td>
						     </tr>
					   	</tbody>
					</table>
					<div id="u-ms-page2"></div>
				</div>
			</div>
			<!--缺课记录-->
			<div class="m-qkrcdDiv" id="m-qkrcdDiv">
				<form class="layui-form" action="">
					<div class="u-stumg-sltDiv u-stumg-globtnsty">
						<select name="quiz">
						    <option>班级名称</option>
						    <option>点名教师</option>
						</select>
					</div>
					<div class="u-stumg-iptDiv u-stumg-globtnsty">
						<input type="text" name="title"  autocomplete="off" class="layui-input"> 
					</div>
				</form>
				<button class="u-stumg-globtnsty" id="u-stumg-sehbtn2">搜索</button>
				<form class="layui-form" action="">
					<div class="u-stumg-sltDiv u-stumg-globtnsty u-dailykw-datefwtitle">
						日期范围:
					</div>
					<div class="u-stumg-iptDiv u-stumg-globtnsty">
						<input type="text" class="layui-input" id="dmdaterecord2" placeholder=" - ">
					</div>
				</form>
				<button class="layui-btn layui-btn-primary u-stumg-scbtn  u-stumg-globtnsty" id="u-stumg-czsx">重置筛选</button>
				<div class="u-stumg-addcoursetabDiv">
					<table class="layui-table" >
						<thead>
						    <tr>
						      <th>点名时间</th>
						      <th>点名教师</th>
						      <th>班级名称</th>
						      <th>应到人数</th>
						      <th>实到人数</th>
						      <th>状态</th>
						      <th>相关操作</th>
						    </tr> 
					    </thead>
						<colgroup>
						    <col width="151">
						    <col width="100">
						    <col width="252">
						    <col width="101">
						    <col width="101">
						    <col width="101">
						    <col width="151">
						</colgroup>
					   	<tbody>
					   		<tr>
						        <td>2018/06/03 19:30</td>
						        <td>张三丰</td>
						        <td>幼儿JavaScript编程</td>
						        <td>30</td>
						        <td>28</td>
						        <td>缺课</td>
						        <td>
						        	<span class="u-dailykw-bk">补签</span>
						        </td>
						     </tr>
					   	</tbody>
					</table>
					<div id="u-ms-page3"></div>
				</div>
			</div>
		</div>
	</body> 
</html>
