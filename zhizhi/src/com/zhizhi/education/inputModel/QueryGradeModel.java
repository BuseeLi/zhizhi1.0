package com.zhizhi.education.inputModel;
/**
 * 
 * @author taotao 2017.11.19
 *
 */
public class QueryGradeModel {
	
	private String couseId;
	
	private String teacherId;
	
	private String classroom;
	
	private String completed;
	
	public QueryGradeModel() {}
	

	public String getCouseId() {
		return couseId;
	}


	public void setCouseId(String couseId) {
		this.couseId = couseId;
	}

	public String getTeacherId() {
		return teacherId;
	}

	public String getCompleted() {
		return completed;
	}


	public void setCompleted(String completed) {
		this.completed = completed;
	}


	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}

	public String getClassroom() {
		return classroom;
	}

	public void setClassroom(String classroom) {
		this.classroom = classroom;
	}
}
