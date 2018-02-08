package com.zhizhi.education.inputModel;

import java.math.BigDecimal;
/**
 * 
 * @author taotao 2017.11.17
 *
 */

import com.zhizhi.common.base.BaseModel;
public class CourseModel extends BaseModel<CourseModel>{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;
	
	private String name;
	
	private String type;
	
	private BigDecimal price;
	
	private Integer period;
	
	private boolean isdeduction;
	//isdeduction表示缺课是否扣除课时
	private String description;
	
	private boolean status;
	
	public CourseModel(){}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public Integer getPeriod() {
		return period;
	}

	public void setPeriod(Integer period) {
		this.period = period;
	}

	public boolean isIsdeduction() {
		return isdeduction;
	}

	public void setIsdeduction(boolean isdeduction) {
		this.isdeduction = isdeduction;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}
	
	
	
}
