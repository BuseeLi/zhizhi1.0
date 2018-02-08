package com.zhizhi.education.service;

import java.util.List;

import org.apache.log4j.Logger;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.zhizhi.common.base.BaseService;
import com.zhizhi.common.tools.ToolString;
import com.zhizhi.education.inputModel.GradeModel;
import com.zhizhi.education.inputModel.QueryGradeModel;

/**
 * 
 * @author taotao 班级service
 *
 */
public class GradeService extends BaseService{
	
	@SuppressWarnings("unused")
	private static final Logger LOGGER = Logger.getLogger(CourseService.class);
	
	public boolean saveGrade(GradeModel gradeModel) {
		String id = ToolString.getUUID();
		Record grade = new Record();
		grade.set("id", id).set("name", gradeModel.getName()).set("capacity", gradeModel.getCapatity())
			.set("startdate", gradeModel.getStartDate()).set("classroom", gradeModel.getClassroom())
			.set("teacherId", gradeModel.getTeacherId()).set("coursetime", gradeModel.getCourseTime()).set("remark", gradeModel.getRemark());
		Db.save("t_grade", grade);
		return true;		
	}
	
	public List<Record> listGradeByName(String gradeName) {
		String sql = "select * from t_grade where name like '%"+gradeName+"%'";
		List<Record> gradeList = Db.find(sql);
		return gradeList;
	}
	
	public List<Record> listGradeByMutiple(QueryGradeModel queryGradeModel) {
		String courseId = queryGradeModel.getCouseId();
		String teacherId = queryGradeModel.getTeacherId();
		String classroom = queryGradeModel.getClassroom();
		String completed = queryGradeModel.getCompleted();
		String sql = "select * from t_grade where courseId like '%"+courseId+"%' and teacherId like '%"+teacherId+"%'and classroom like '%"+classroom+"%' and completed like '%"+completed+"%'";
		List<Record> gradeList = Db.find(sql);
		return gradeList;
	}
}
