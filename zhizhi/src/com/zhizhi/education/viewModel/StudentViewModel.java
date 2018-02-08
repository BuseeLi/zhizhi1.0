package com.zhizhi.education.viewModel;

import com.zhizhi.common.base.BaseModel;

public class StudentViewModel extends BaseModel<StudentViewModel>{

	/**
	 *  taotao  2018.1.3日创建
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String name;
	private String tel;
	private int courseSum;
	private String followInfo;
	private int toCharge;
	private int changeCount;
	
	public StudentViewModel() {}

	public int getId() {
		return id;
	}

	public StudentViewModel(int id, String name, String tel, int courseSum, String followInfo, int toCharge,
			int changeCount) {
		super();
		this.id = id;
		this.name = name;
		this.tel = tel;
		this.courseSum = courseSum;
		this.followInfo = followInfo;
		this.toCharge = toCharge;
		this.changeCount = changeCount;
	}

	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public int getCourseSum() {
		return courseSum;
	}

	public void setCourseSum(int courseSum) {
		this.courseSum = courseSum;
	}

	public String getFollowInfo() {
		return followInfo;
	}

	public void setFollowInfo(String followInfo) {
		this.followInfo = followInfo;
	}

	public int getToCharge() {
		return toCharge;
	}

	public void setToCharge(int toCharge) {
		this.toCharge = toCharge;
	}

	public int getChangeCount() {
		return changeCount;
	}

	public void setChangeCount(int changeCount) {
		this.changeCount = changeCount;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
