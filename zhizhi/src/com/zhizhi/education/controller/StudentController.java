package com.zhizhi.education.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.jfinal.json.FastJson;
import com.jfinal.kit.HttpKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.zhizhi.common.annotation.controller.Controller;
import com.zhizhi.common.base.BaseController;
import com.zhizhi.common.tools.ToolString;
import com.zhizhi.education.inputModel.StudentModel;
import com.zhizhi.education.service.StudentService;
import com.zhizhi.education.viewModel.StudentViewModel;

@Controller(controllerKey="/student")
public class StudentController extends BaseController{
	
	private static final Logger LOGGER = Logger.getLogger(StudentController.class);

	private StudentService service = new StudentService();
	
	/**
	 * 添加学生
	 */
	public void doAddStudent() {
		try {
			String jsonString = HttpKit.readData(getRequest());
			StudentModel student = FastJson.getJson().parse(jsonString, StudentModel.class);
			boolean flag = service.saveStudent(student);
			renderBoolean(flag);
		} catch (Exception ex) {
			LOGGER.error(ex);
		}
	}
	
	/*
	 * 查询学生
	 */
	public void doQueryStudent() {
		try {
			//查询未删除的学生用户
			int pageNumber = getPageNum();
			List<Record> list = Db.paginate(pageNumber, 15, "select *"
					, "from account where state!=1 and user_type = 1").getList();
			List<StudentViewModel> studentList = new ArrayList<>();
			studentList = convertViewModel(list);
			renderJson(studentList);
		} catch (Exception ex) { 
			LOGGER.error(ex);
		}
	}
	
	/*
	 * 按条件查询学生
	 */
	public void doQueryStudentByTerm() {
		try {
			String term = getPara();
			String value = getPara();
			int pageNumber = getPageNum();
			if (!ToolString.isNull(term) && !ToolString.isNull(value)) {
				if ("name".equals(term)) {
					// 如果是按姓名查找
					List<Record> list = Db.paginate(pageNumber, 15, "select *"
							, "from account where state!=1 and user_type = 1 and name = ?"
							, value).getList();
					renderJson(list);
					return;
				}
				 			
				if ("tel".equals(term)) {
					// 如果是按手机号查找
					List<Record> list = Db.paginate(pageNumber, 15, "select *"
							, "from account where state!=1 and user_type = 1 and tel = ?"
							, value).getList();
					renderJson(list);
					return;
				}
			}
		} catch (Exception ex) {
			LOGGER.error(ex);
		}
	}
	
	// 设置学生模型为相应在页面上显示的结构
	public List<StudentViewModel> convertViewModel(List<Record> list) {
		
		List<StudentViewModel>	studentList = new ArrayList<>();
		for(int i = 0; i < list.size(); i++) {
			Record record = list.get(i);
			int id = record.getInt("id");
			String name = record.getStr("real_name");
			String tel = record.getStr("tel");
			int course_sum = record.getInt("course_sum");
			int to_charge_course = record.getInt("to_charge_course");
			int change_grade_count = record.getInt("change_grade_count");
			String getFollowSql = "SELECT custom_id,REAL_NAME,follow_date from t_follow t1"
					+ " LEFT JOIN account t2 on t1.account_id = t2.Id"
					+ " WHERE t1.custom_id =? ORDER BY follow_date DESC LIMIT 1 ";
			Record followRecord = Db.findFirst(getFollowSql, record.getInt("id"));
			// 获取形如   张三/2015-02-12格式的 学生跟进信息
			String followInfo = "暂无跟进信息";
			if (followRecord != null) {
			    followInfo = followRecord.getStr("real_name")+
						"/"+followRecord.getDate("follow_date")
						.toString().substring(0, 10);
			}
			StudentViewModel viewModel = new StudentViewModel(id, name, tel, course_sum, followInfo, to_charge_course, change_grade_count);
			studentList.add(viewModel);
		} 
		return studentList;
	}
	
	/*
	 * 获取当前页数
	 */
	public int getPageNum() {
		int pageNumber = 1;
		if (null != getParaToInt("pageNumber")) {
			pageNumber = getParaToInt("pageNumber");
		}
		return pageNumber;
	}
	
	/*
	 *  将操作结果以json的格式返回给前段控制显示
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
