package com.zhizhi.sys.account.service;

import java.util.ArrayList;
import java.util.List;

import javax.xml.crypto.dsig.keyinfo.RetrievalMethod;

import org.apache.log4j.Logger;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.zhizhi.common.tools.ToolUtils;
import com.zhizhi.common.tools.ToolMD5;
import com.zhizhi.common.base.BaseService;

public class AccountService extends BaseService {
	
	@SuppressWarnings("unused")
	private static final Logger LOGGER = Logger.getLogger(AccountService.class);
	
	public Record Login(String phone, String passwordRaw) {
		if(ToolUtils.CheckKeyWord(phone==null ? "" : phone.replaceAll(" ", ""))){
			return null;
		}
		if(ToolUtils.CheckKeyWord(passwordRaw==null ? "" : passwordRaw.replaceAll(" ", ""))){
			return null;
		}
		String sql = "select * from account where state=0 and tel=? and user_pwd=? limit 1";
		String password = ToolMD5.getMD5(passwordRaw);
		Record account = Db.findFirst(sql, phone, password);
		return account;
	}
	
	public List<Object> getIndexData(Record account) {
		List<Object> list = new ArrayList<>();
		int aid = account.getInt("id");
		String sql1 = "select COUNT(*) as num,period from t_coursetime t1 LEFT JOIN t_course t2"
				+" on t2.id=t1.course_id where t1.status=? and t1.account_id=?";
		String sql2 = "select send_date,status,finished_date content from"
				+ " t_task where recevied_personId = ?";
		String sql3 = "select COUNT(*) as fnum from (select DISTINCT custom_id from t_follow where  account_id =?) as t1";
		String sql4 = "select count(*) as num from t_custom where account_id=?";
		String sql1last = "select COUNT(*) as last from t_coursetime where "
				+ " YEARWEEK(DATE_FORMAT(end_date,'%Y-%m-%d'))"
				+" =YEARWEEK(NOW())-1 and account_id=? and status=?";
		String sql1this = "select COUNT(*) as this from t_coursetime where "
				+ "YEARWEEK(DATE_FORMAT(end_date,'%Y-%m-%d'))"
				+" =YEARWEEK(NOW()) and account_id=? and status=?";
		String sql2last = "select COUNT(*) as last from t_task where "
				+ " YEARWEEK(DATE_FORMAT(finished_date,'%Y-%m-%d'))"
				+ " =YEARWEEK(NOW())-1 and recevied_personId=? and status=?";
		String sql2this = "select COUNT(*) as this from t_task where "
				+ "YEARWEEK(DATE_FORMAT(finished_date,'%Y-%m-%d'))"
				+ " =YEARWEEK(NOW()) and recevied_personId=? and status=?";
		String sql3last = "select COUNT(*) as last from t_follow where "
				+ "YEARWEEK(DATE_FORMAT(follow_date,'%Y-%m-%d')) "
				+" =YEARWEEK(NOW())-1 and account_id=?";
		String sql3this= "select COUNT(*) as this from t_follow where "
				+ " YEARWEEK(DATE_FORMAT(follow_date,'%Y-%m-%d'))"
				+ " =YEARWEEK(NOW()) and account_id=?";
		// 课时
		Record courseTime = Db.findFirst(sql1, true, aid);
		// 上周完成的课时
		Long courseLast = Db.findFirst(sql1last, aid, true).getLong("last");
		// 本周完成的课时
		Long courseThis = Db.findFirst(sql1this, aid, true).getLong("this");
		float finishedStatus = (float)((courseTime.getLong("num")*1.0)/(courseTime.getInt("period")*1.0));
		// 任务
		List<Record> taskList = Db.find(sql2, aid);
		int finishedTaskCount = 0;
		for (int i = 0; i < taskList.size(); i++) {
			if (taskList.get(i).getInt("status") == 1) {
				finishedTaskCount++;
			}
		}
		int taskLast = Db.findFirst(sql2last, aid, true).getLong("last").intValue();
		int taskThis = Db.findFirst(sql2this, aid, true).getLong("this").intValue();
		float finishedTaskStatus =(float) ((finishedTaskCount*1.0)/(taskList.size()*1.0));
		
		//客户以及跟进情况
		int followLast = Db.findFirst(sql3last, aid).getLong("last").intValue();
		int followThis =Db.findFirst(sql3this, aid).getLong("this").intValue();
		float followStatus = (float) ((Db.findFirst(sql3, aid).getLong("fnum")*1.0)/(Db.findFirst(sql4, aid).getLong("num")*1.0));
		list.add(courseLast);
		list.add(courseThis);
		list.add(finishedStatus);
		list.add(taskLast);
		list.add(taskThis);
		list.add(finishedTaskStatus);
		list.add(followLast);
		list.add(followThis);
		list.add(followStatus);
		return list;
	}
	
	public Record Find(String phone) {
		if(phone==null){
			return null;
		}
		String sql = "select * from account where state=0 and tel=? limit 1";
		Record account = Db.findFirst(sql, phone);
		return account;
	}
	
}
