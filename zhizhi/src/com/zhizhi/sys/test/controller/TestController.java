package com.zhizhi.sys.test.controller;

import org.apache.log4j.Logger;

import com.jfinal.plugin.activerecord.Record;
import com.zhizhi.common.annotation.controller.Controller;
import com.zhizhi.common.base.BaseController;
import com.zhizhi.common.util.JWT;
import com.zhizhi.common.util.ResponseData;
import com.zhizhi.sys.account.inputModel.LoginModel;
import com.zhizhi.sys.test.model.Test;
import com.zhizhi.sys.test.service.TestService;

@Controller(controllerKey = "/test")
public class TestController extends BaseController {

	private static final Logger logger = Logger.getLogger(TestController.class);
	
	private TestService service = new TestService();

	public void test() {
		renderText("测试一下啦");
	}
	
	public void index() {
		try {
			Record record = getSessionAttr("account_session");
//			if(Role.isStudent(record.getStr("roleids"))){
//				redirect("/account/backMain");
//			}else if(Role.isTeacher(record.getStr("roleids"))){
//				redirect("/account/backTeacher");
//			}else{
//				redirect("/main/index");
//			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	public void getPart() {
		int sid = getParaToInt(0);
		Test test = service.getPartById(sid);	
		setAttr("test", test);
		renderJsp("/account/test01.jsp");
	}
	public void add() {
		Test test = getModel(Test.class);
		boolean flag = service.add(test);
		if (flag) {
			renderHtml("保存成功");
		}
	}
	public void update() {
		boolean flag = service.update();
		if (flag) {
			renderHtml("修改成功");
		}
	}
	
}
