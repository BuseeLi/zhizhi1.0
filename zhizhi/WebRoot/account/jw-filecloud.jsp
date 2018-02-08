<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>文件云盘</title>
		<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js" ></script>
		<link rel="stylesheet" href="../content/styles/globalcss/global.css" />
		<link rel="stylesheet" href="../content/styles/globalcss/input.css" />
		<link rel="stylesheet" href="../content/styles/css/jw-filecloud.css" />
		<script type="text/javascript" src="../scripts/normal/input.js" ></script>
		<!--引入LayUI库 2018/01/07 by gao-->
		<link rel="stylesheet" type="text/css" href="../content/styles/layui/css/layui.css"/>
		<script src="../content/styles/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="../scripts/normal/jw-filecloud.js"></script>
		<link rel="stylesheet" href="../content/styles/css/jw-filecloud.css" />
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
				      <dd><a href="">学生管理</a></dd>
				      <dd><a href="">教师管理</a></dd>
				      <dd><a href="">班级管理</a></dd>
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
			<!--文件云盘上-->
			<div class="m-file-topDiv">
				<form class="layui-form" action="">
					<div class="u-stumg-sltDiv u-stumg-globtnsty">
						<select name="quiz">
						    <option>文件名称</option>
						    <option>格式</option>
						</select>
					</div>
					<div class="u-stumg-iptDiv u-stumg-globtnsty">
						<input type="text" name="title"  autocomplete="off" class="layui-input"> 
					</div>
				</form>
				<button class="u-stumg-globtnsty" id="u-stumg-sehbtn">搜索</button>
				<!--进度条-->
				<div class="u-processDiv">
					<div class="layui-progress u-myprocess1">
					  <div class="layui-progress-bar u-myprocess2" lay-percent="20%"></div>
					</div>
					<span>120.5</span><span>Mb/</span><span>512.0</span><span>Mb</span>
					<span class="u-krbtn">点击扩容</span>
				</div>
				<div class="u-suggest">给本页提建议</div>
			</div>
			<!--文件云盘下-->
			<div class="m-file-btmDiv">
				<button class="u-file-btn u-file-fileup" >文件上传</button>
				<button class="u-file-btn u-file-newfile" >新建文件</button>
				<div class="u-file-filecount">
					本页共<span>5</span>个文件（文件夹）
				</div>
				<div class="u-file-main">
					<div class="u-file-maintitle">全部文件</div>
					<div class="u-detailfileDiv">
						<img src="../content/img/foldericon.png" />
						<div>我的文件</div>
					</div>
					<div class="u-detailfileDiv">
						<img src="../content/img/execlicon.png" />
						<div>学生名单</div>
					</div>
					<div class="u-detailfileDiv">
						<img src="../content/img/execlicon.png" />
						<div>学生名单</div>
					</div>
					<div class="u-detailfileDiv">
						<img src="../content/img/execlicon.png" />
						<div>学生名单</div>
					</div>
					<div class="u-detailfileDiv">
						<img src="../content/img/execlicon.png" />
						<div>学生名单</div>
					</div>
					<div class="u-detailfileDiv">
						<img src="../content/img/execlicon.png" />
						<div>学生名单</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
