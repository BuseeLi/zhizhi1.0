<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>教务学生教师管理</title>
		<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js" ></script>
		<link rel="stylesheet" href="../content/styles/globalcss/global.css" />
		<link rel="stylesheet" href="../content/styles/globalcss/input.css" />
		<link rel="stylesheet" href="../content/styles/css/jw-stuteach.css" />
		<script type="text/javascript" src="../scripts/normal/input.js" ></script>
		<!--引入LayUI库 2018/01/07 by gao-->
		<link rel="stylesheet" type="text/css" href="../content/styles/layui/css/layui.css"/>
		<script src="../content/styles/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script src="../scripts/normal/jw-stuteach.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" href="../content/styles/css/jw-stuteach.css" />
		
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
		<!--教师管理中的删除按钮-->
		<div class="m-addteachDiv" id="m-scteachDiv" >
			<img id="u-teachscclosebtn" src="../content/img/Mtclosebtn.png" />
			<span id="u-scteacherspan1">确认删除教师？如果教师名下所绑定的课程或班级</span>
			<span id="u-scteacherspan2">则需要重新设置教师。</span>
			<button id="u-scteach-qxclosebtn">取消</button>
			<button id="u-scteach-confirmbtn">确认删除</button>
		</div>
		<!--添加教师模态框-->
		<div class="m-addteachDiv" id="m-addteachDiv">
			<div class="g-stumg-addstutitle">
				<span>添加教师</span>
				<img id="u-addteachtitle" src="../content/img/Mtclosebtn.png" />
			</div>
			<span id="u-addteach-name">姓名</span>
			<input type="text" class="u-addteach-ipt" id="u-addteach-nameipt"/>
			<span id="u-addteach-tel">手机</span>
			<input type="text" class="u-addteach-ipt" id="u-addteach-telipt" />
			<span id="u-addteach-sex">性别</span>
			<select class="u-addteach-ipt" id="u-addteach-sexipt">
				<option>男</option>
				<option>女</option>
			</select>
			<span id="u-addteach-salary">基础工资</span>
			<input type="text" class="u-addteach-ipt" id="u-addteach-salaryipt" />
			<span id="u-addteach-user">用户组</span>
			<select class="u-addteach-ipt" id="u-addteach-useript">
				<option>任课教师</option>
				<option>行政人员</option>
				<option>销售人员</option>
				<option>管理员</option>
			</select>
			<button class="u-qxclosebtn" id="u-addteach-qxclosebtn">取消</button>
			<button class="u-confirmbtn">确认添加</button>
		</div>
		<!--教师管理中的管理按钮-->
		<div class="m-addteachDiv" id="m-mgteachDiv">
			<div class="g-stumg-addstutitle">
				<span>添加教师</span>
				<img id="u-mgteachtitle" src="../content/img/Mtclosebtn.png" />
			</div>
			<span id="u-addteach-name">姓名</span>
			<input type="text" class="u-addteach-ipt" id="u-mgteach-nameipt"/>
			<span id="u-addteach-tel">手机</span>
			<input type="text" class="u-addteach-ipt" id="u-mgteach-telipt" />
			<span id="u-addteach-sex">性别</span>
			<input type="text" class="u-addteach-ipt" id="u-mgteach-sexipt" />
			<span id="u-addteach-salary">基础工资</span>
			<input type="text" class="u-addteach-ipt" id="u-mgteach-salaryipt" />
			<span id="u-addteach-user">用户组</span>
			<input type="text" class="u-addteach-ipt" id="u-mgteach-useript" />
			<button class="u-qxclosebtn" id="u-mgteach-qxclosebtn">取消</button>
			<button class="u-confirmbtn">确认添加</button>
		</div>
		<!--学生信息修改-->
		<div class="g-stumsg-updateDiv" id="g-stumsg-updateDiv">
			<div class="u-stumsg-updatetitle">
				<span>信息修改</span>
				<img id="u-stumsg-closebtn" src="../content/img/Mtclosebtn.png" />
			</div>
			<div class="m-stumsg-msgDiv">
				<span class="u-stumsg-nametitle">姓名</span>
				<input type="text" class="u-stumsg-nameipt" />
				<span class="u-stumsg-sextitle">性别</span>
				<input type="text" class="u-stumsg-sexipt" />
				<span class="u-stumsg-teltitle">手机</span>
				<input type="text" class="u-stumsg-telipt" />
				<span class="u-stumsg-birthtitle">出生日期</span>
				<input type="text" class="u-stumsg-birthipt" />
				<span class="u-stumsg-schooltitle">学校</span>
				<input type="text" class="u-stumsg-schoolipt" />
				<span class="u-stumsg-gradetitle">年级</span>
				<input type="text" class="u-stumsg-gradeipt" />
				<span class="u-stumsg-adrstitle">住址</span>
				<textarea class="u-stumsg-adrsipt"></textarea>
				<button class="u-stumsg-updatebtn u-stumsg-upqxbtn">取消</button>
				<button class="u-stumsg-updatebtn u-stumsg-upokbtn">保存修改</button>
			</div>
		</div>
		<!--学生表格管理按钮--学生基本信息界面-->
		<div class="m-stumsgDiv">
			<!--学生基本信息-->
			<div class="u-stumsgtopDiv">
				<div class="u-stutop-title">
					<button class="u-stumsg-backbtn" id="u-stumsg-backbtn">返回上页</button>
					<span class="u-stumsg-toptitle">学生基本信息</span>
					<span class="u-stumsg-sgs">给本页提建议</span>
				</div>
				<div class="u-stutop-main">
					<span class="u-stumg-stunametitle">学生姓名:</span>
					<span class="u-stumg-stunamespan">张伟</span>
					<span class="u-stumg-stusextitle">性别:</span>
					<span class="u-stumg-stusexspan">男</span>
					<span class="u-stumg-stuschooltitle">学校:</span>
					<span class="u-stumg-stuschoolspan">南京市鼓楼区第一小学</span>
					<span class="u-stumg-stugradetitle">年级:</span>
					<span class="u-stumg-stugradespan">小学一年级</span>
					<span class="u-stumg-stuteltitle">联系电话:</span>
					<span class="u-stumg-stutelspan">18270613397</span>
					<span class="u-stumg-stujoindatetitle">出生日期:</span>
					<span class="u-stumg-stujoindatespan">2018/3/1</span>
					<span class="u-stumg-stuadrstitle">住址:</span>
					<span class="u-stumg-stuadrsspan">江西省宜春市奉新县澡下镇澡下学校</span>
					<button class="u-stumg-xiugaibtn" id="u-stumg-xiugaibtn">点击修改</button>
				</div>
			</div>
			<!--报名课程-->
			<div class="u-stumsgbtmDiv">
				<ul  class="layui-nav u-ms-nav" id="m-stumgul" lay-filter="">
			        <li class="layui-nav-item layui-this" id="u-stumg-yibao"><a href="#">已报课程</a></li>
				    <li class="layui-nav-item" id="u-stumg-lishi"><a href="#">历史课程</a></li>
				</ul>
				<!--已报课程-->
				<div class="m-stumg-yibaocourseDiv">
					<table class="layui-table" >
						<thead>
						    <tr>
						      <th>课程名称</th>
						      <th>班级名称</th>
						      <th>总课时</th>
						      <th>剩余课时</th>
						      <th>课程有效期</th>
						      <th>相关操作</th>
						    </tr> 
					    </thead>
						<colgroup>
						    <col width="250">
						    <col width="250">
						    <col width="100">
						    <col width="100">
						    <col width="151">
						    <col width="151">
						</colgroup>
					   	<tbody>
					   		<tr>
						        <td>少儿JavaScript初级编程</td>
						        <td>一年级三班</td>
						        <td>60</td>
						        <td>42</td>
						        <td>2018/3/5</td>
						        <td>
						        	<span class="u-stumg-mgbtn">退课</span>
						        </td>
						     </tr>
					   	</tbody>
					</table>
				</div>
				<!--历史课程-->
				<div class="u-historycourseDiv">
					<table class="layui-table" >
						<thead>
						    <tr>
						      <th>课程名称</th>
						      <th>班级名称</th>
						      <th>总课时</th>
						      <th>剩余课时</th>
						      <th>课程有效期</th>
						      <th>相关操作</th>
						    </tr> 
					    </thead>
						<colgroup>
						    <col width="250">
						    <col width="250">
						    <col width="100">
						    <col width="100">
						    <col width="151">
						    <col width="151">
						</colgroup>
					   	<tbody>
					   		<tr>
						        <td>少儿JavaScript初级编程</td>
						        <td>一年级三班</td>
						        <td>60</td>
						        <td>42</td>
						        <td>2018/3/5</td>
						        <td>
						        	<span class="u-stumg-mgbtn">-</span>
						        </td>
						     </tr>
					   	</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="g-main">
			<ul  class="layui-nav u-ms-nav" id="m-stumgul" lay-filter="">
		        <li class="layui-nav-item layui-this" id="u-stumg-course-li"><a href="#">教师管理</a></li>
			    <li class="layui-nav-item" id="u-stumg-clsmg-li"><a href="#">学生管理</a></li>
			</ul>
			<!--教师管理界面-->
			<div class="m-teachmgDiv" >
				<form class="layui-form" action="">
					<div class="u-stumg-sltDiv u-stumg-globtnsty">
						<select name="quiz">
						    <option>教师姓名</option>
						    <option>手机号</option>
						</select>
					</div>
					<div class="u-stumg-iptDiv u-stumg-globtnsty">
						<input type="text" name="title"  autocomplete="off" class="layui-input"> 
					</div>
				</form>
				<button class="u-stumg-globtnsty" id="u-stumg-sehbtn">搜索</button>
				<button class="layui-btn u-stumg-globtnsty" id="u-stumg-addcus">添加教师</button>
				<button class="layui-btn layui-btn-primary u-stumg-scbtn  u-stumg-globtnsty" id="u-stumg-czsx">重置筛选</button>
				<div class="u-stumg-addcoursetabDiv">
					<table class="layui-table" >
						<thead>
						    <tr>
						      <th>教师姓名</th>
						      <th>手机号</th>
						      <th>性别</th>
						      <th>基础工资</th>
						      <th>本月课时</th>
						      <th>已上课时</th>
						      <th>用户组</th>
						      <th>相关操作</th>
						    </tr> 
					    </thead>
						<colgroup>
						    <col width="151">
						    <col width="151">
						    <col width="61">
						    <col width="101">
						    <col width="101">
						    <col width="101">
						    <col width="101">
						    <col width="151">
						</colgroup>
					   	<tbody>
					   		<tr>
						        <td>张伟</td>
						        <td>18270613397</td>
						        <td>男</td>
						        <td>1200</td>
						        <td>250</td>
						        <td>75</td>
						        <td>任课教师</td>
						        <td>
						        	<span class="u-stumg-cosmg-dmbtn">管理</span>
						        	<span class="u-stumg-cosmg-glbtn">删除</span>
						        </td>
						     </tr>
						     <tr>
						        <td>张伟</td>
						        <td>18270613397</td>
						        <td>男</td>
						        <td>1200</td>
						        <td>250</td>
						        <td>75</td>
						        <td>任课教师</td>
						        <td>
						        	<span class="u-stumg-cosmg-dmbtn">管理</span>
						        	<span class="u-stumg-cosmg-glbtn">删除</span>
						        </td>
						     </tr>
					   	</tbody>
					</table>
					<div id="u-ms-page2"></div>
				</div>
			</div>
			<!--学生管理界面-->
			<div class="m-stumgDiv">
				<form class="layui-form" action="">
					<div class="u-stumg-sltDiv u-stumg-globtnsty">
						<select name="quiz">
						    <option>学生姓名</option>
						    <option>手机号</option>
						</select>
					</div>
					<div class="u-stumg-iptDiv u-stumg-globtnsty">
						<input type="text" name="title" autocomplete="off" class="layui-input"> 
					</div>
				</form>
				<button class="u-stumg-globtnsty" id="u-stumg-sehbtn">搜索</button>
				<button class="layui-btn u-stumg-globtnsty" id="u-stumg-addcus">添加学生</button>
				<button class="layui-btn layui-btn-primary u-stumg-scbtn  u-stumg-globtnsty" id="u-stumg-czsx">重置筛选</button>
				<div class="g-stumg-stutabDiv">
					<table class="layui-table" >
						<thead>
						    <tr>
						      <th>学生姓名</th>
						      <th>手机号</th>
						      <th>性别</th>
						      <th>课程数量</th>
						      <th>添加来源</th>
						      <th>添加人</th>
						      <th>相关操作</th>
						    </tr> 
					    </thead>
						<colgroup>
						    <col width="151">
						    <col width="151">
						    <col width="61">
						    <col width="101">
						    <col width="151">
						    <col width="151">
						    <col width="151">
						</colgroup>
					   	<tbody>
					   		<tr>
						        <td>张伟</td>
						        <td>18270613397</td>
						        <td>男</td>
						        <td>4</td>
						        <td>销售转入</td>
						        <td>张销售</td>
						        <td>
						        	<span class="u-stumg-mgbtn">管理</span>
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
