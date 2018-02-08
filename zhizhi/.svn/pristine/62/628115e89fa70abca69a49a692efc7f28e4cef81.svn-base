package com.zhizhi.education.service;
import java.util.List;

import org.apache.log4j.Logger;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.zhizhi.common.base.BaseService;
import com.zhizhi.common.tools.ToolString;
import com.zhizhi.education.inputModel.CourseModel;
import com.zhizhi.education.model.Course;

public class CourseService extends BaseService{
	
	@SuppressWarnings("unused")
	private static final Logger LOGGER = Logger.getLogger(CourseService.class);
	
	public boolean addCourse(CourseModel courseModel) {
		String id = ToolString.getUUID();
		// 根据UUID生成主键
		Record course = new Record();
		course.set("id", id).set("name", courseModel.getName())
		    .set("type", courseModel.getType()).set("price", courseModel.getPrice())
		    .set("period", courseModel.getPeriod()).set("isdeductible", courseModel.isIsdeduction())
		    .set("description", courseModel.getDescription()).set("status", courseModel.isStatus());
		return Db.save("t_course",course);
	}
	
	public List<Record> listCourse() {
		String sql = "select * from t_course where status = 1";
		List<Record> course = Db.find(sql);
		return course;
	}
	
	public List<Record> listCourseByName(String courseName) {
		String sql = "select * from t_course where name like '%"+courseName+"%' and status = 1";
		List<Record> listCourse = Db.find(sql);	
		return listCourse;
	}
	
	/**
	 * 
	 * 查询所有未停用的课程
	 */
	public List<Record> listCourseNotDeactivated() {
		String sql = "select * from t_course where status = ?";
		List<Record> courseList = Db.find(sql,1);
		return courseList;
	}
	
	/**
	 * 
	 * 查询所有已停用的课程
	 */
	public List<Record> listCourseDeactivated() {
		String sql = "select * from t_course where status = ?";
		List<Record> courseList = Db.find(sql,0);
		return courseList;
	}
	
	/**
	 * 根据id查询课程
	 */
	public Record getCourseById(String id) {
		return Db.findById("t_course", id);
	}
	
	/**
	 * 
	 *  启用/停用课程
	 */
	public boolean updateStatus(String id) {
		Record record = getCourseById(id);
		int status = record.getInt("status");
		status = (status==1) ? 0:1;
		// 这里修改status的时候先获取原来的值，若是0则返回1，反之返回0
		String sql = "update t_course set status = ? where id = ?";
		int count = Db.update(sql, status,id);
		return (count > 0) ? true:false;
	}
	
	public Course getCourse() {
		return null;
	}
	public void updateCourse() {
		
	}
}
