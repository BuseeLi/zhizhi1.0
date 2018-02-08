package com.zhizhi.education.controller;
import java.io.OutputStream;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.alibaba.fastjson.JSON;
import com.jfinal.json.FastJson;
import com.jfinal.kit.HttpKit;
import com.jfinal.plugin.activerecord.Record;
import com.zhizhi.common.annotation.controller.Controller;
import com.zhizhi.common.base.BaseController;
import com.zhizhi.education.inputModel.TeacherModel;
import com.zhizhi.education.model.Teacher;
import com.zhizhi.education.service.TeacherService;

@Controller(controllerKey="/teacher")
public class TeacherController extends BaseController{
	
	private static final Logger LOGGER = Logger.getLogger(TeacherController.class);
	
	private static final int pageSize = 1;
	
	private TeacherService service = new TeacherService();
	
	/**
	 * 添加教师
	 */
	public void doAddTeacher() {
		try {
			String jsonString = HttpKit.readData(getRequest());
			TeacherModel teacherModel = FastJson.getJson().parse(jsonString,TeacherModel.class);
			boolean flag = service.saveTeacher(teacherModel);
			renderBoolean(flag);
		} catch (Exception ex) {
			LOGGER.error(ex);
			renderJson(false);
		}
	}
	
	/**
	 * 
	 */
	public void doQueryTeacherById() {
		try {
			String id = getPara("id");
			Teacher teacher = Teacher.dao.findById(id);
			renderJson(teacher);
		} catch (Exception ex) {
			LOGGER.error(ex);
		}
	}
	
	/**
	 * 	根据教师名查询教师集合
	 */
	public void doQueryTeacherByName() {
		try {
			String jsonString = HttpKit.readData(getRequest());
			String teacherName = JSON.parseObject(jsonString).getString("teacherName");
			List<Record> teachers = service.listTeacherByName(teacherName);
			renderJson(teachers);
		} catch (Exception ex) {
			LOGGER.error(ex);
		}
	}                    
	
	/**
	 * 分页查询所有的教师
	 */
	public void doQueryTeacher() {
		try {
			int currPage = getParaToInt("currPage");
			List<Record> teachers = service.listTeacherByPage(currPage, pageSize);
			renderJson(teachers);
		} catch (Exception ex) {
			LOGGER.error(ex);
		}
	}
	
	/*
	 * 按手机号查询教师列表
	 */
	public void doQueryTeacherByTel() {
		try {
			String jsonString = HttpKit.readData(getRequest());
			String tel = JSON.parseObject(jsonString).getString("tel");
			List<Record> teachers = service.getTeacherByTel(tel);
			renderJson(teachers);
		} catch (Exception ex) {
			LOGGER.error(ex);
		}
	}
	
	/**
	 * 查询所有未停用的教师
	 */
	public void queryNotDeactivatedTeacher() {
		try {
			int currPage = getParaToInt("currPage");
			List<Record> teachers = service.listTeacherNotDeactivated(currPage, pageSize);
			renderJson(teachers);
		} catch (Exception ex) {
			LOGGER.error(ex);
		}
	}
	
	/**
	 * 查询所有已停用的教师
	 */
	public void queryDeactivatedTeacher() {
		try {
			int currPage = getParaToInt("currPage");
			List<Record> teachers = service.listTeacherDeactivated(currPage, pageSize);
			renderJson(teachers);
		} catch (Exception ex) {
			LOGGER.error(ex);
		}
	}
	
	/**
	 * 修改教师信息
	 */
	public void updateTeacher() {
		try {
			String jsonString = HttpKit.readData(getRequest());
			TeacherModel newTeacher = FastJson.getJson().parse(jsonString, TeacherModel.class);
			String id = newTeacher.getId();
			Teacher teacher = Teacher.dao.findById(id); 
			boolean flag = teacher.set("name", newTeacher.getName()).set("img", newTeacher.getImg())
				.set("sex", newTeacher.getSex()).set("tel", newTeacher.getTel()).set("adept", newTeacher.getAdept())
				.set("remark", newTeacher.getRemark()).save();
			renderBoolean(flag);
		} catch (Exception ex) {
			LOGGER.error(ex);
		}
	}
	
	/**
	 * 修改教师的启用状态
	 */
	public void updateStatus() {
		try {
			String jsonString = HttpKit.readData(getRequest());
			String teacheId = JSON.parseObject(jsonString).getString("id");
			boolean flag = service.updateStatus(teacheId);
			renderBoolean(flag);
		} catch (Exception ex) {
			LOGGER.error(ex);
		}
	}
	
	/**
	 * 删除教师
	 */
	public void deleteTeacher() {
		try {
			String id = getPara("id");
			boolean flag = Teacher.dao.deleteById(id);
			renderBoolean(flag);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	/**
	 * 
	 * 导出教师信息(excel)
	 */
	public void exportExcel() {
		try {
			HSSFWorkbook wb = service.exportExcel();
			getResponse().setContentType("application/vnd.ms-excel");
			getResponse().setHeader("Content-disposition", "attachment;filename=student.xls");   
			OutputStream os = getResponse().getOutputStream();
			wb.write(os);
			os.flush();
			os.close();		
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public void renderBoolean(boolean flag) {
		if (flag) {
			renderJson("result","true");
		}
		else {
			renderJson("result","false");
		}
	}
}
