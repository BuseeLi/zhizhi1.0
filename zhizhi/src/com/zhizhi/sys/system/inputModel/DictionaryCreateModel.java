package com.zhizhi.sys.system.inputModel;

/*
 * author:JSQ
 * 字典创建模型
 * */
public class DictionaryCreateModel {

	private String name;
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getName() {
		return this.name;
	}
	
	private String parentId;
	
	public void setParent(String id) {
		this.parentId = id;
	}
	
	public String getParent() {
		return this.parentId;
	}
	
	private String category;
	
	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getCategory() {
		return this.category;
	}
	
	private String description;
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getDescription() {
		return this.description;
	}
}
