package com.zhizhi.education.controller;

import java.util.List;

import org.apache.http.protocol.HTTP;
import org.apache.log4j.Logger;

import com.alibaba.druid.util.StringUtils;
import com.alibaba.fastjson.JSON;
import com.jfinal.json.FastJson;
import com.jfinal.json.Jackson;
import com.jfinal.json.Json;
import com.jfinal.kit.HttpKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.zhizhi.common.annotation.controller.Controller;
import com.zhizhi.common.base.BaseController;
import com.zhizhi.education.inputModel.GradeModel;
import com.zhizhi.education.inputModel.QueryGradeModel;
import com.zhizhi.education.model.Course;
import com.zhizhi.education.model.Grade;
import com.zhizhi.education.service.GradeService;

@Controller(controllerKey="/grade")
public class GradeController extends BaseController{
	
	private static final Logger LOGGER = Logger.getLogger(GradeController.class);	
	private GradeService service = new GradeService();
	
	/*
	 * 添加班级
	 */
	public void doAddGrade() {
		try {
			String jsonString = HttpKit.readData(getRequest());
			GradeModel gradeModel = FastJson.getJson().parse(jsonString, GradeModel.class);
			boolean flag = service.saveGrade(gradeModel);
			renderBoolean(flag);
		} catch (Exception ex) {
			LOGGER.error(ex);
		}
	}
	
	/*
	 *  查询课程
	 */
	public void doQueryGrade() {
		try {
			String id = getPara();
			String sql = "select * from id, name from t_grade where courseId = ? and status = ?";
			List<Record> gradeList = Db.find(sql, id, true);
			setSessionAttr("gradeList", gradeList);
		} catch (Exception ex) {
			LOGGER.error(ex);
		}
	}
	
	/*
	 * 修改课程
	 */
	public void updateGrade() {
		String jsonString = HttpKit.readData(getRequest());
		try {
			GradeModel gradeModel = FastJson.getJson().parse(jsonString, GradeModel.class);
			Grade grade = Grade.dao.findById(gradeModel.getId());
		    boolean flag = grade.set("courseId", gradeModel.getCourseId()).set("name", gradeModel.getName())
				.set("capacity", gradeModel.getCapatity()).set("star"
						+ "tDate", gradeModel.getStartDate())
				.set("classroom", gradeModel.getClassroom()).set("teacherId", gradeModel.getTeacherId())
				.set("courseTime", gradeModel.getCourseTime()).set("remark", gradeModel.getRemark()).save();
		    renderBoolean(flag);
		} catch (Exception ex) {
			LOGGER.error(ex);
		}
	}
	
	/*
	 * 根据id查询班级
	 */
	public void doQueryCourseById() {
		try {
			String id = getPara("id");
			Grade grade = Grade.dao.findById(id);
			renderJson(grade);
		} catch (Exception ex) {
			LOGGER.error(ex);
		}
	}
	
	/*
	 * 按照班级名查询课程
	 */
	public void doQueryByName() {
		try {
			String jsonString = HttpKit.readData(getRequest());
			String gradeName = JSON.parseObject(jsonString).getString("gradeName");
			List<Record> gradeList = service.listGradeByName(gradeName);
			renderJson(gradeList);
		} catch (Exception ex) {
			LOGGER.error(ex);
		}
	}
	
	/*
	 * 多条件查询班级 (QueryModel)
	 */
	public void doQueryByMutiple() {
		try {
			String jsonString = HttpKit.readData(getRequest());
			QueryGradeModel queryGradeModel = FastJson.getJson().parse(jsonString, QueryGradeModel.class);
			if (StringUtils.isEmpty(queryGradeModel.getCouseId())) {
				queryGradeModel.setCouseId("");
			}
			if (StringUtils.isEmpty(queryGradeModel.getTeacherId())) {
				queryGradeModel.setTeacherId("");
			}
			if (StringUtils.isEmpty(queryGradeModel.getClassroom())) {
				queryGradeModel.setClassroom("");
			}
			if(StringUtils.isEmpty(queryGradeModel.getCompleted())) {
				queryGradeModel.setCompleted("");
			}
			List<Record> gradeList = service.listGradeByMutiple(queryGradeModel);
			renderJson(gradeList);
		} catch (Exception ex) {
			LOGGER.error(ex);
		}
	}
	
	/*
	 * 向前段返回一个boolean类型的json参数   added by taotao 
	 */
	public void renderBoolean(boolean flag) {
		if (flag) {
			renderJson("result","true");
		}
		else {
			renderJson("result","false");
		}
	}
}
