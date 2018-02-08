	$(function(){
			$("#u-logintel").blur(function(){
				if($("#u-logintel").val()!=""){
					$("#u-loginteltip").text("");
				}
			});
			$(".u-loginpwd").blur(function(){
				if($("#u-loginpwd").val()!=""){
					$("#u-loginpwdtip").text("");
				}
			});
			$(".u-submitbtn").click(function(){
				var tel=$(".u-logintel").val();
				  if(!(/^1[345789]\d{9}$/.test(tel))){ 
				  		$("#u-loginteltip").text("请输入有效号码！");
				        return false; 
				    }
				if($("#u-logintel").val()==""){
					$("#u-loginteltip").text("请输入手机号码！");
					return false;
				}
				if($(".u-loginpwd").val()==""){
					$("#u-loginpwdtip").text("请输入密码！");
					return false;
				}
				/*发送请求给后台*/
				var form = $(".layui-form");
				ajaxHelper("post", loginPath, form.serialize(), successHandler, errorHandler);
				return false;
			});
		});
		function successHandler(data){
			
		}