package com.zhizhi.sys.account.viewModel;

public class CodeSendResult {
	private Boolean isSuccess;
	
	public Boolean getResult() {
		return this.isSuccess;
	}
	
	public void setResult(Boolean isSuccess) {
		this.isSuccess = isSuccess;
	}
	
	public String phoneState;
	
	public String getPhoneState(){
		return this.phoneState;
	}
	
	public void setPhoneState(String phoneState) {
		this.phoneState = phoneState;
	}
	
	
}
