package com.zhizhi.sys.system.inputModel;

public class DictionaryGetModel {

	private int pageNum;
	
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	
	public int getPageNum() {
		return this.pageNum;
	}
	
	private int pageSize;
	
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	public int getPageSize() {
		return this.pageSize;
	}
	
	private String param;
	
	public void setParam(String param) {
		this.param = param;
	}
	
	public String getParam() {
		return this.param;
	}
}
