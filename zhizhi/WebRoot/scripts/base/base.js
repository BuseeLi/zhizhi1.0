var apiPath = "http://localhost:8080/";

/*
 * 一般ajax请求函数
 * */
function ajaxHelper(type, url, data, successHandler, errorHandler)	{
	$.ajax({
		type:type,
		url:url,
		data:data,
		dataType:"json",
		success:function(data){
			successHandler(data);
		},
		error:function(error){
			errHandler();
		}
	})
}

/*
 * json提交
 * 
 * */
function jsonPost(url, data, successHandler, errorHandler){
	$.ajax({
		type:"POST",
		url:url,
		data:data,
		dataType:"aplication/json;charset=UTF-8",
		contentType:"application/json; charset=UTF-8",
		success:function(data){
			successHandler(data);
			
		},
		error:function(error){
			errorHandler(error);
		}
	});
}

/*
 * 一般错误处理函数
 * */
function errorHandler(error){
	console.log(error);
	alert(error);
	
}

function errHandler(error){
	console.log(error);
	alert(error);
	
}

function ok(){
	alert("jguagsd");
}
