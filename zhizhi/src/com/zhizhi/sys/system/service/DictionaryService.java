package com.zhizhi.sys.system.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;
import com.jfinal.plugin.activerecord.Page;
import com.zhizhi.sys.system.model.Dict;
import com.zhizhi.common.tools.ToolString;
import com.zhizhi.sys.system.inputModel.*;
import com.zhizhi.sys.system.model.Dictionary;

public class DictionaryService {

	/*
	 * find single dictionary by id
	 * */
	public Dictionary get(String id){
		Dictionary dictionary = Dictionary.dao.findById(id);
		return dictionary;
	}
	
	/*
	 * find by category
	 * 
	 * */
	public Page<Dictionary> getByCatetory(DictionaryGetModel model){
		//String sql = "select id,name,parentId,category,description from t_dictionary where category=?";
		Page<Dictionary> dictionaries = Dictionary.dao.paginate(model.getPageNum()
				, model.getPageSize()
				, "select id,name,parentId,category,description"
				, "from t_dictionary where category=?"
				, model.getParam());
		return dictionaries;
	}
	
	/*
	 * get by parentid
	 * */
	public Page<Dictionary> getChildren(DictionaryGetModel model){
		//String sql = "select id,name,parentId,category,description from t_dictionary where parentId=?";
		//List<Dictionary> dictionaries = Dictionary.dao.find(sql, parentId);
		Page<Dictionary> dictionaries = Dictionary.dao.paginate(model.getPageNum()
				, model.getPageSize()
				, "select id,name,parentId,category,description"
				, "from t_dictionary where parentId=?"
				, model.getParam());
		return dictionaries;
	}
	
	/*
	 *add dictionary 
	 * */
	public Boolean add(DictionaryCreateModel model) {
		Dictionary dictionary = new Dictionary()
				.set("id", ToolString.getUUID())
				.set("name", model.getName())
				.set("parentId", model.getParent())
				.set("category", model.getCategory())
				.set("description", model.getDescription());
		return dictionary.save();
	}
	
	/*
	 * update dictionary
	 * */
	public Boolean update(DictionaryUpdateModel model) {
		Dictionary dictionary = new Dictionary()
				.set("id", model.getId())
				.set("name", model.getName())
				.set("parentId", model.getParent())
				.set("category", model.getCategory())
				.set("description", model.getDescription());
		return dictionary.save();
	}
	
	/*
	 * 
	 * 
	 * */
	public Boolean delete(String id) {
		return Dictionary.dao.deleteById(id);
	}
	
	/*
	 * delete bulk
	 * 
	 * */
	public Boolean deleteBulk(List<String> ids) {
		if(ids.isEmpty()) {
			return false;
		}
		
		Boolean succeed = Db.tx(new IAtom() {

			@Override
			public boolean run() throws SQLException {
				List<Boolean> results = new ArrayList<Boolean>();
				 ids.forEach((v)->{
					 Boolean result = Dictionary.dao.deleteById(v);
					 results.add(result);
				 });
				 return !results.contains(false);
			}
			
		});
		return succeed;
	}
	
}
