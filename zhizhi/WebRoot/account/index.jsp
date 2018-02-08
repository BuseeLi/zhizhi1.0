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
		<title>后台首页</title>
		<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js" ></script>
		<script src="http://cdn.bootcss.com/blueimp-md5/1.1.0/js/md5.js"></script>
		<script src="../scripts/normal/circle-progress.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="../scripts/normal/echarts.js" ></script>
		<script src="../content/styles/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script src="../scripts/normal/index.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" href="../content/styles/globalcss/global.css" />
		<!--引入LayUI库 2018/01/07 by gao-->
		<link rel="stylesheet" type="text/css" href="../content/styles/layui/css/layui.css"/>
		<link rel="stylesheet" type="text/css" href="../content/styles/css/index.css">
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
		<!--快捷功能-->
		<div class="g-kuaijie">
			<span class="u-kj-title">快捷功能</span>
			<span class="u-kj-mg">管理</span><br />
			<div class="u-kj-btndiv">
				<div id="" class="u-kj-btn"><img src="../content/img/huiyuan-adduser.svg" /><span>员工管理</span></div>
				<div class="u-kj-btn"><img/ src="../content/img/huiyuanmange.svg"><span>权限划分</span></div>
				<div class="u-kj-btn"><img/ src="../content/img/tip.svg"><span>发布通知</span></div>
				<div class="u-kj-btn"><img/ src="../content/img/xunzhang.svg"><span>机构展示</span></div>
			</div>
		</div>
		<!--运营数据-->
		<div class="g-yunyingdata">
			<span class="u-kj-title">运营数据</span>
			<span class="u-kj-title u-yy-futitle">数据统计到昨日</span>
			<span id="u-yy-alldata" class="u-kj-mg">查看全部数据</span><br />
			<div class="u-yy-btndiv">
				<div id="" class="u-yy-data">
					<p>收入</p>
					<p>122088.00</span>元
				</div>
				<div id="" class="u-yy-data">
					<p>支出</p>
					<p>112458.00</span>元
				</div>
				<div id="" class="u-yy-data">
					<p>退课率</p>
					<p>23</span>%
				</div>
				<div id="" class="u-yy-data">
					<p>学生数量</p>
					<p>568</span>人
				</div>
			</div>
		</div>
		<!--销售数据-->
		<div class="g-saledata">
			<span class="u-kj-title">销售数据</span>
			<span class="u-kj-title u-yy-futitle">本月数据截止到昨日</span>
			<div class="u-saledata-echart" id="u-saledata-echart"></div>
		</div>
		<!--网盘-->
		<div class="g-wangpan">
			<span class="u-kj-title">网盘情况</span>
			<span class="u-kj-title u-yy-futitle">实时数据</span>
			<span id="u-wp-alldata" class="u-kj-mg">查看全部数据</span><br />
			<div class="u-wp-detail">
				<span id="u-wp-canvas"></span>
				<span id="u-wp-pec"><span>65</span><span>%</span></span>
				<span class="u-wp-dataspan">
					<span>容量：<span>1024.72</span>MB / <span>2048.00</span>MB</span><br />
					<span class="u-wp-alruse">已经使用<span>50</span>%</span>
					<span class="u-wp-weiuse">未使用<span>50</span>%</span>
				</span> 
				<span id="u-shiyong"></span>
				<span id="u-weishiyong"></span>
				<span id="u-wp-kuorong">点击扩容</span>
			</div>
		</div>
		<!--销售排名-->
		<div class="g-salerank">
			<span class="u-kj-title">销售排名</span>
			<span class="u-sr-week">周</span>
			<span class="u-sr-month">月</span>
			<span id="u-sr-detaildata" class="u-kj-mg">查看详细数据</span><br />
			<div class="u-sr-list">
				<span class="u-sr-listmod">
					<div style="float: left;"><img src="../content/img/guanjun.png" /></div>
					<div class="u-sr-listmod-data"><span>张大王</span><br/><span>160544.00</span>元</div>
				</span>
				<span class="u-sr-listmod">
					<div style="float: left;"><img src="../content/img/yajun.png" /></div>
					<div class="u-sr-listmod-data"><span>张中王</span><br/><span>160544.00</span>元</div>
				</span>
				<span class="u-sr-listmod">
					<div style="float: left;"><img src="../content/img/jijun.png" /></div>
					<div class="u-sr-listmod-data"><span>张中王</span><br/><span>160544.00</span>元</div>
				</span>
			</div>
		</div>
		<!--销售漏斗-->
		<div class="g-saleloudou">
			<span class="u-kj-title">销售漏斗</span>
			<span class="u-kj-title u-yy-futitle">本月数据截止到昨日</span>
			<span id="u-sl-detaildata" class="u-kj-mg">查看详细数据</span><br />
			<div class="u-sl-div">
				<div class="u-sl-dataDiv">
					<p>本月数据</p>
					<img class="u-sl-img1" src="../content/img/ld-zongkehu.png" />&nbsp;<span>50</span>人
					<img class="u-sl-img2" src="../content/img/ld-genjin.png"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>98</span>人
					<img class="u-sl-img3" src="../content/img/ld-yishixiao.png"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>98</span>人
					<img class="u-sl-img4" src="../content/img/ld-yibaoming.png"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>98</span>人
				</div>
				<div class="u-sl-dataDiv">
					<p>上月数据</p>
					<img class="u-sl-img1" src="../content/img/ld-zongkehu.png" />&nbsp;<span>124</span>人
					<img class="u-sl-img2" src="../content/img/ld-genjin.png"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>93</span>人
					<img class="u-sl-img3" src="../content/img/ld-yishixiao.png"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>12</span>人
					<img class="u-sl-img4" src="../content/img/ld-yibaoming.png"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>8</span>人
				</div>
			</div>
		</div>
	</body>
</html>
