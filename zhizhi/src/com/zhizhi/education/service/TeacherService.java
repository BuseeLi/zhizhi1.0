package com.zhizhi.education.service;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.zhizhi.common.base.BaseService;
import com.zhizhi.common.tools.ToolString;
import com.zhizhi.education.inputModel.TeacherModel;
import com.zhizhi.education.model.Course;

public class TeacherService extends BaseService{
	
	@SuppressWarnings("unused")
	private static final Logger LOGGER = Logger.getLogger(TeacherService.class);
	
	private static final String [] excelHeader = {"姓名","性别","手机号"};
	
	public boolean saveTeacher(TeacherModel teacherModel) {
		String id = ToolString.getUUID();
		Record teacher = new Record();
		// 这里需要将Model类型转成Record类型    
		teacher.set("id",id).set("name", teacherModel.getName()).set("img", teacherModel.getImg())
	        .set("sex",teacherModel.getSex()).set("tel", teacherModel.getTel())
		    .set("adept", teacherModel.getAdept()).set("remark", teacherModel.getAdept())
		    .set("remark", teacherModel.getRemark()).set("status", teacherModel.isStatus());
		return Db.save("t_teacher", teacher);
	}
	
	public List<Record> listTeacherByName(String teacherName) {
		String sql = "select * from t_teacher where name like '%"+teacherName+"%' and status = 1";
    	List<Record> teachers = Db.find(sql);
    	return (teachers == null) ? null:teachers;
	}
	
	public List<Record> listTeacher() {
		String sql = "select * from t_teacher";
		return Db.find(sql);
	}
	
	public List<Record> listTeacherByPage(int currPage, int pageSize) {	
		List<Record> teachers = Db.paginate(currPage, pageSize, "select *", "from t_teacher").getList();
		return teachers;
	}
	
	public int getCount() {
		String sql = "select count(*) from t_teacher";
		int count = Db.queryInt(sql);
		return count;
	}
	
	/**
	 * 根据id获取教师
	 */
	public Record getTeacherById(String id) {
		return Db.findById("t_teacher", id);
	}
	
	/**
	 * 根据手机号获取教师
	 */
	public List<Record> getTeacherByTel(String tel) {
		String sql = "select * from t_teacher where tel like '%"+tel+"%'";
		return Db.find(sql);
	}
	
	/**
	 * 修改教师的启用状态
	 */
	public boolean updateStatus(String id) {
		Record record = getTeacherById(id);
		int status = record.getInt("status");
		status = (status==1) ? 0:1;
		// 这里修改status的时候先获取原来的值，若是0则返回1，反之返回0
		String sql = "update t_teacher set status = ? where id = ?";
		int count = Db.update(sql, status,id);
		return (count > 0) ? true:false;
	}
	
	/**
	 * 
	 * 获取所有未停用的教师(分页)
	 */
	public List<Record> listTeacherNotDeactivated(int currPage, int pageSize) {
		List<Record> teachers = Db.paginate(currPage, pageSize, "select *", "from t_teacher where status = ?", 1).getList();
		return teachers;
	}
	
	/**
	 * 
	 * 获取所有已停用的教师(分页)
	 */
	public List<Record> listTeacherDeactivated(int currPage, int pageSize) {
		List<Record> teachers = Db.paginate(currPage, pageSize, "select *", "from t_teacher where status = ?", 0).getList();
		return teachers;
	}
	
	/**
	 * 导出excel表
	 */
	public HSSFWorkbook exportExcel() {
		List<Record> teachers = listTeacher();
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet("松果教师表");
		HSSFRow row = sheet.createRow((int)0);
		HSSFCellStyle style = wb.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		
		for (int i = 0;i<excelHeader.length;i++) {
			HSSFCell cell = row.createCell(i);
			cell.setCellValue(excelHeader[i]);
			cell.setCellStyle(style);
			sheet.autoSizeColumn(i);
		}
		
		for (int i=0;i<teachers.size();i++) {
			row = sheet.createRow(i+1);
			Record record = teachers.get(i);
			row.createCell(0).setCellValue(record.getStr("name"));
			row.createCell(1).setCellValue(record.getStr("sex"));
			row.createCell(2).setCellValue(record.getStr("tel"));
		}
		return wb;
	}
	
	public Course getCourse() {
		return null;
	}
	public void updateCourse() {
		
	}
}
