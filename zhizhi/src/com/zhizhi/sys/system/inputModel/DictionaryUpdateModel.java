package com.zhizhi.sys.system.inputModel;

/*
 * 字典更新模型
 * 
 * */
public class DictionaryUpdateModel {
	
	private String id;
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getId() {
		return this.id;
	}
	
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
