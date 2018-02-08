package com.zhizhi.sys.system.controller;

import com.zhizhi.common.annotation.controller.Controller;
import com.zhizhi.common.base.BaseController;

@Controller(controllerKey="main")
public class SystemController extends BaseController {

	public void index() {
		renderJsp("/main/index.jsp");
	}
}
