package com.zhizhi.education.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jfinal.json.FastJson;
import com.jfinal.kit.HttpKit;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.render.JsonRender;
import com.zhizhi.common.annotation.controller.Controller;
import com.zhizhi.common.base.BaseController;
import com.zhizhi.common.tools.ToolString;
import com.zhizhi.common.util.JWT;
import com.zhizhi.common.util.ResponseData;
import com.zhizhi.education.inputModel.CourseModel;
import com.zhizhi.education.inputModel.QueryGradeModel;
import com.zhizhi.education.service.CourseService;
import com.zhizhi.education.viewModel.CourseMangeModel;
import com.zhizhi.sys.account.inputModel.LoginModel;

@Controller(controllerKey="/course")
public class CourseController extends BaseController{
	
	private static final Logger LOGGER = Logger.getLogger(CourseController.class);
	private CourseService service = new CourseService();
	
	/**
	 * 跳转到课程管理页面
	 */
	public void courseJsp() {
		renderJsp("/account/jw-coursemg.jsp");
	}
	/**
	 * 获取课程信息
	 */
	public void courseManagePage() {
		try {
			/*String sql = "select *,COUNT(a.id) as grade_num from "
					+ "(select a.*,COUNT(b.accountId) as num from t_course a "
					+ "LEFT JOIN t_course_user_map b on a.id=b.courseId and "
					+ "a.status = 1 GROUP BY(a.id)) a LEFT JOIN t_grade "
					+ "on t_grade.courseId=a.id GROUP BY(a.id)";
			List<Record> courseList = Db.find(sql);
			renderJson(courseList);*/
			List<CourseMangeModel> cmm = new ArrayList<>();
			String sql = "select * from t_course where status = 1";
			List<Record> list = Db.find(sql);
			for (int i = 0; i < list.size(); i++) {
				Record record = list.get(i);
				String id = record.getStr("id");
				String name = record.getStr("name");
				BigDecimal price = record.getBigDecimal("price");
				int courseTime = record.getInt("period");
				String getGradeNumSql = "select COUNT(*) as grade_num from t_grade where t_grade.courseId= ?";
				int gradeNum = Db.findFirst(getGradeNumSql, record.getStr("id")).getLong("grade_num").intValue();
				String getSnum = "select COUNT(*) as snum from t_course_user_map where t_course_user_map.courseId =?";
				int snum = Db.findFirst(getSnum, record.getStr("id")).getLong("snum").intValue();
				Date createTime = record.getDate("create_time");
				CourseMangeModel model = new CourseMangeModel(id, name, price, courseTime, gradeNum, snum, createTime, "");
				System.out.println(model);
				cmm.add(model);
			}
			System.out.println(cmm.get(0).getCourseName());
			setSessionAttr("courseList", cmm);
		} catch (Exception ex) {
			LOGGER.error(ex);
		}
	}
	
	/**
	 * 添加课程
	 */
	public void doAddCourse() {
		System.out.println("gfg-----------------------------");
		try {
			String jsonString = HttpKit.readData(getRequest());
			CourseModel course = FastJson.getJson().parse(jsonString, CourseModel.class);
			boolean flag = service.addCourse(course);
			renderBoolean(flag);
		} catch (Exception ex) {
			LOGGER.error(ex);
		}
	}
	
	/**
	 * 查询所有课程
	 */
	public void doQueryCourse() {
		try {
			List<Record> courseList = service.listCourse();
			renderJson(courseList);
		} catch (Exception ex) {
			LOGGER.error(ex);
		}
	}
	
	/**
	 *  按课程名查询课程名中带有courseName字段的课程
	 */
	public void doQueryCourseByName() {
		try {
			String jsonString = HttpKit.readData(getRequest());
			String courseName = JSON.parseObject(jsonString).getString("courseName");
			if (!ToolString.isNull(courseName)) {
				// 执行查询
				List<Record> courseList = service.listCourseByName(courseName);
				renderJson(courseList);
			}
		} catch (Exception ex) {
			LOGGER.error(ex);
		}
	}
	
	/**
	 * 查询未停用的课程
	 */
	public void doQueryCourseNotDeactivated() {
		try {
			List<Record> courseList = service.listCourseNotDeactivated();
			renderJson(courseList);
		} catch (Exception ex) {
			LOGGER.error(ex);
		}
	}
	
	public void doLoginTest() {
		String phone = "123";
		String password = "123";
		if ("123".equals(phone) && "123".equals(password)) {  
            ResponseData responseData = ResponseData.ok();  
            LoginModel user = new LoginModel();
            user.setPhone(phone);
            user.setPassword(password);
            String token = JWT.sign(user, 30L * 24L * 3600L * 1000L);  
            if (token != null) {  
                responseData.putDataValue("token", token);  
            }  
            renderJson(responseData);
        }  
	}
	/**
	 * 查询已停用的课程
	 */
	public void doQueryCourseDeactivated() {
		try {
			List<Record> courseList = service.listCourseDeactivated();
			renderJson(courseList);
		} catch (Exception ex) {
			LOGGER.error(ex);
		}
	}
	
	/**
	 * 
	 */
	public void getUserOperator() {
		try {
			Map<Integer , String> operatorMap = new HashMap<>();
			String sql1 = "select * from account where id=1";
			Record user = Db.findFirst(sql1);
			String roleids = user.getStr("roleids");
			String roles = roleids.replace(",", "");
			String getAuthSql = "select operatorids from pt_role where id=?";
			Record record2 = Db.findFirst(getAuthSql, roles);
			operatorMap.put(user.getInt("id"), record2.getStr("operatorids"));
			renderJson(operatorMap);
			
		} catch (Exception ex) {
			LOGGER.error(ex);
		}
	}
	
	/**
	 * 启用/停用课程
	 */
	public void updateStatus() {
		try {
			String id = getPara("id");
			boolean flag = service.updateStatus(id);
			renderBoolean(flag);
		} catch (Exception ex) {
			LOGGER.error(ex);
		}
	}
	
	/**
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