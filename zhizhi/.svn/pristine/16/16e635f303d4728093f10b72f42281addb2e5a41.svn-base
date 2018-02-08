package com.zhizhi.sys.system.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSONObject;
import com.jfinal.json.FastJson;
import com.jfinal.kit.HttpKit;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.zhizhi.sys.system.model.Dict;
import com.zhizhi.sys.system.service.DictionaryService;
import com.zhizhi.sys.table.model.MetaObject;
import com.zhizhi.common.annotation.controller.Controller;
import com.zhizhi.common.base.BaseController;
import com.zhizhi.sys.system.inputModel.*;
import com.zhizhi.sys.system.model.Dictionary;
import com.zhizhi.sys.system.service.DictionaryService;


/**字典管理 <br>
<pre>
id	int	110	-10字典ID				-1	0
version	bigint	20-1000	数据版本号			0
dictname	varchar	30-100	字典名称	utf8	utf8_general_ci	0
val	varchar	255-100	字典项值	utf8	utf8_general_ci	0
numbers	varchar	50-100	字典项编码	utf8	utf8_general_ci	0
parentid	int	11-100	父级字典			0
isparent	varchar	10-100	'false'是否父类	utf8	utf8_general_ci	0
levels	int	4-100	所在层级			0
state	int	2-100	1是否正常			0
<pre>
 */
@Controller(controllerKey="/system/dictionary")
public class DictionaryController extends BaseController {

	private static final Logger LOGGER = Logger.getLogger(DictionaryController.class);
	
	private DictionaryService service = new DictionaryService();
	
	//private static final DictionaryService dictService = new DictionaryService();
	/** 页面 的 路径  */
	//private static final String filePath = "/WEB-INF/view/sys/dict/";
	
	/*
	 * 
	 * 根据id查找字典信息
	 * */
	public void get() {
		try {
			String id = getPara("id");
			Dictionary dictionary = service.get(id);
			renderJson(dictionary);
		} catch (Exception e) {
			LOGGER.error("获取字典信息失败", e);
			System.out.println(e.toString());
		}
	}
	
	/*
	 * 根据父节点查找字典
	 * 
	 * */
	public void getChildren() {
		try {
			String jsonString = HttpKit.readData(getRequest());
			DictionaryGetModel model = FastJson.getJson().parse(jsonString, DictionaryGetModel.class);
			Page<Dictionary> results = service.getChildren(model);
			renderJson(results);
		}catch(Exception e) {
			LOGGER.error("获取字典信息失败", e);
			System.out.println(e.toString());
		}
		
	}
	
	 /* 
	 * 根据类别查找字典
	 * */
	public void getByCategory() {
		try {
			String jsonString = HttpKit.readData(getRequest());
			DictionaryGetModel model = FastJson.getJson().parse(jsonString, DictionaryGetModel.class);
			Page<Dictionary> results = service.getByCatetory(model);
			renderJson(results);
		}catch(Exception e) {
			LOGGER.error("获取字典信息失败", e);
			System.out.println(e.toString());
		}
	}
	
	/*
	 * 新增字典
	 * */
	public void add() {
		try {
			String jsonString = HttpKit.readData(getRequest());
			DictionaryCreateModel model = FastJson.getJson().parse(jsonString, DictionaryCreateModel.class);
			Boolean results = service.add(model);
			renderJson(results);
		}catch(Exception e) {
			LOGGER.error("新增字典信息失败", e);
			System.out.println(e.toString());
		}
	}
	
	
	/*
	 * 跟更新
	 * */
	public void update() {
		try {
			String jsonString = HttpKit.readData(getRequest());
			DictionaryUpdateModel model = FastJson.getJson().parse(jsonString, DictionaryUpdateModel.class);
			Boolean results = service.update(model);
			renderJson(results);
		}catch(Exception e) {
			LOGGER.error("更新字典信息失败", e);
			System.out.println(e.toString());
		}
	}
	
	/*
	 * 根据id删除
	 * */
	public void delete() {
		try {
			String id = getPara("id");
			Boolean results = service.delete(id);
			renderJson(results);
		}catch(Exception e) {
			LOGGER.error("删除字典信息失败", e);
			System.out.println(e.toString());
		}
		
	}
	
	/*
	 * 批量删除
	 * */
	public void deleteBulk() {
		try {
			Map<String, String[]> ids = getParaMap();
			Boolean results = service.deleteBulk(Arrays.asList((ids.get("ids"))));
			renderJson(results);
		}catch(Exception e) {
			LOGGER.error("删除字典信息失败", e);
			System.out.println(e.toString());
		}
		
	}
}
