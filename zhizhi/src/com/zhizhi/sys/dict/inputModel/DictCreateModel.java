package com.zhizhi.sys.dict.inputModel;

public class DictCreateModel {

	private int version;
	
	public void setVersion(int version) {
		this.version = version;
	}
	
	public int getVersion() {
		return this.version;
	}
	
	private String dictname;
	
	public void setDictName(String dictname) {
		this.dictname = dictname;
	}
	
	public String getDictName() {
		return this.dictname;
	}
	
	private String val;
	
	public void setVal(String val) {
		this.val = val;
	}
	
	public String getVal() {
		return this.val;
	}
	
	private String numbers;
	
	public void setNumbers(String numbers) {
		this.numbers = numbers;
	}
	
	public String getNumbers() {
		return this.numbers;
	}
	
	private int parentId;
	
	public void setParent(int parentId) {
		this.parentId = parentId;
	}
	
	public int getParent() {
		return this.parentId;
	}
	
	private String isParent;
	
	public void setIsParent(String isParent) {
		this.isParent = isParent;
	}
	
	public String getIsParent() {
		return this.isParent;
	}
	
	private int levels;
	
	public void setLevels(int levels) {
		this.levels = levels;
	}
	
	public int getLevels() {
		return this.levels;
	}
	
	private int state;
	
	public void setState(int state) {
		this.state = state;
	}
	
	public int getState() {
		return this.state;
	}
}
