package com.zhizhi.education.service;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.zhizhi.common.base.BaseService;
import com.zhizhi.common.tools.ToolString;
import com.zhizhi.education.inputModel.StudentModel;

public class StudentService extends BaseService{
	
	public boolean saveStudent(StudentModel studentModel) {
		String id = ToolString.getUUID();
		Record student = new Record();
		student.set("id", id).set("name", studentModel.getName()).set("PARENT_NAME", studentModel.getParentName())
			.set("tel", studentModel.getTel()).set("ID_NUMBER", studentModel.getIdNumber()).set("JOIN_COURSE", studentModel.getJoinCourse())
			.set("PAY_TYPE", studentModel.getPayType()).set("PAY_COUNT", studentModel.getPayCount())
			.set("KEEP_PERSON", studentModel.getKeepPerson());
		return Db.save("t_student", student);
	}
	
	public List<Record> listStudent() {
		String sql = "select * from t_account ";
		List<Record> students = Db.find(sql);
		return students;
	}
	
	public Record getStudentById(String id) {
		return Db.findById("t_account", id);
	} 
	
	public boolean updateStudent(StudentModel studentModel) {
		Record student = Db.findById("t_account", studentModel.getId());
		student.set("name", studentModel.getName()).set("PARENT_NAME", studentModel.getParentName())
			.set("tel", studentModel.getTel());
		Db.update("t_account",student);
		return true;
	}
	
}
