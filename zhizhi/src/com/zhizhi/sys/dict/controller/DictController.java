package com.zhizhi.sys.dict.controller;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.jfinal.json.FastJson;
import com.jfinal.kit.HttpKit;
import com.jfinal.kit.StrKit;
import com.zhizhi.sys.dict.inputModel.*;
import com.zhizhi.sys.dict.model.Dict;
import com.zhizhi.sys.dict.service.DictService;
import com.zhizhi.sys.system.inputModel.DictionaryCreateModel;
import com.zhizhi.sys.table.model.MetaObject;
import com.zhizhi.common.annotation.controller.Controller;
import com.zhizhi.common.base.BaseController;

@Controller(controllerKey="/system/dict")
public class DictController extends BaseController {

	private static final DictService dictService = new DictService();
	/** 页面 的 路径  */
	//private static final String filePath = "/WEB-INF/view/sys/dict/";
	
	/** 字典列表 */
	public void list(){
		List<Dict> dictList = Dict.dao.queryTableNodeRoot();
		renderJson(dictList);
		//setAttr("dictlist",dictList);
		//renderJsp(filePath + "listTree.jsp");
	}
	
	/**字典树*/
	public void treeTable(){
		List<Dict> treeTableData = dictService.treeTable(getPara("pId"));
		renderJson(treeTableData);
		//renderText(treeTableData);
	}
	
	/**添加字典**/
//	public void addDict(){
//		setAttr("operatorType","add");
//		renderJsp(filePath + "layer_adddict.jsp");
//	}
	
	/** 选择父级字典 */
	public void choiceParentDict(){
		//setAttr("dictId","dictId");
		//setAttr("dictName","dictName");
		String checkedId = getPara("checkedIds");
		//String checkedIds = "";
		//String checkedName = "";
		if(StrKit.notBlank(checkedId)){
			Dict dict = Dict.dao.cacheGet(checkedId);
			if(dict!=null){
				//checkedIds = dict.getPrimaryKeyValue().toString();
				//checkedName = dict.getStr("dictname");
				renderJson(dict);
			}
			renderJson("");
		}
		
		//setAttr("checkedIds",checkedIds);
		//setAttr("checkedName",checkedName);
		//renderJsp(filePath + "layer_radio.jsp");
		
	}
	
	/**字典树取值*/
	public void treeData(){
		List<JSONObject> treeDataJsonList = dictService.childTreeData( getPara("id") );
		renderJson(treeDataJsonList);
	}
	
	/**查重 */
	public void checkExit(){
		renderJson(MetaObject.dao.queryCheckExcludeId("pt_dict", "numbers", getPara("numbers"), getPara("dictid")));
	}
	
	/**保存字典*/
	public void save(){
		String jsonString = HttpKit.readData(getRequest());
		DictCreateModel model = FastJson.getJson().parse(jsonString, DictCreateModel.class);
		renderJson(dictService.saveDict(model));
		//renderJson(dictService.saveDict(getModel(Dict.class)));
	}
	
	/**编辑字典*/
	public void get(){
		String id = getPara("id");
		Dict dict = Dict.dao.queryDictDetail(id);
		renderJson(dict);
		//setAttr("dict",dict);
		//setAttr("operatorType","update");
		//renderJsp(filePath + "layer_adddict.jsp");
	}
	
	/**修改字典*/
	public void update(){
		String jsonString = HttpKit.readData(getRequest());
		DictUpdateModel model = FastJson.getJson().parse(jsonString, DictUpdateModel.class);
		renderJson(dictService.updateDict(model, Integer.toString(model.getOldParent())));
	}
	
	/**快速添加 子级字典*/
	public void fastAddDict(){
		String id = getPara("id");
		Dict dict = Dict.dao.queryDictDetail(id);
		dict.put("parentname", dict.get("dictname"));
		dict.set("dictname", dict.get("dictname")+"的子级");
		dict.set("val", dict.get("val")+"的子级");
		dict.set("numbers", dict.get("numbers")+"的子级");
		dict.set("parentid", dict.get("id"));
		dict.set("id", null);
		setAttr("dict",dict);
		setAttr("operatorType","add");
		
		//renderJsp(filePath + "layer_adddict.jsp");
	}
}
