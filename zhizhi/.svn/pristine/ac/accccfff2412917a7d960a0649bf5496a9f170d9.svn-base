<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>登录界面</title>
		<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js" ></script>
		<!--引入LayUI库 2018/01/07 by gao-->
		<link rel="stylesheet" type="text/css" href="../content/styles/layui/css/layui.css"/>
		<link rel="stylesheet" type="text/css" href="../content/styles/css/login.css">
		<script type="text/javascript" src="../scripts/normal/login.js"></script>
	</head>
	<body>
		<div class="m-login">
			<div class="m-loginleftDiv">
				<img src="../content/img/logo_white.svg" /><br />
				<span class="u-loginlefttip1">懂教育，懂管理，更懂你。</span><br />
				<span class="u-loginlefttip2">知之是一款免费使用的教育机构管理系统。综合了教务、企业、财务、数据等管理模块，易上手，更轻便。</span><br />
				<span class="u-version">Ver 1.0.0 beta</span>
			</div>
			<div id="m-loginDiv">
				<span class="u-registertip">还没有账户?<a href="#">点击注册</a></span>
				<span class="u-logintitle">用户登录</span>
				<form class="layui-form" action="../account/doLogin" method="post">
					<div id="m-logintelDiv">
						<input type="text" id="u-logintel"  maxlength="11" name="phone" placeholder="手机号" autocomplete="off" class="layui-input u-logintel">
						<label id="u-loginteltip"></label>
					</div>
					<div id="m-loginpwdDiv">
						<input  type="password" name="password" placeholder="密码" autocomplete="off" class="layui-input u-loginpwd">
						<label id="u-loginpwdtip"></label>
					</div>
					<label class="u-loginfailtip"></label>
					<input type="submit" value="登录" class="layui-btn layui-btn-fluid u-submitbtn" />
				</form>
				<span class="u-forgetpwdtip">忘记密码?<a href="#">点击找回</a></span>
				<span class="u-luokuan">Powered by zhizhiyun.cn</span>
			</div>
		</div>
	</body>
</html>
