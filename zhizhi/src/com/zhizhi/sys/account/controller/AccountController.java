package com.zhizhi.sys.account.controller;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.StatusLine;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.*;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;

import com.jfinal.json.FastJson;
import com.jfinal.kit.HttpKit;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.zhizhi.common.tools.ToolMD5;
import com.zhizhi.common.tools.ToolOperatorSession;
import com.zhizhi.sys.account.inputModel.AgendaModel;
import com.zhizhi.sys.account.service.AccountService;
import com.zhizhi.sys.account.viewModel.CodeSendResult;
import com.zhizhi.sys.account.viewModel.ReadAgendaModel;
import com.zhizhi.sys.operator.model.Role;
import com.zhizhi.common.annotation.controller.Controller;
import com.zhizhi.common.base.BaseController;
import com.zhizhi.common.constants.Constants;
import com.zhizhi.common.task.Organization;
import com.zhizhi.common.tools.*;

@Controller(controllerKey = "/account")
public class AccountController extends BaseController {

	private static final Logger LOGGER = Logger.getLogger(AccountController.class);
	private AccountService service = new AccountService();

	public void index() {
		renderJsp("/account/login.jsp");
	}

	/*
	 * 登陆逻辑处理
	 */
	public void doLogin() {
		Map<String, Object> resultMap = new HashMap<>();
		try {
			String phone = getPara("phone");
			String password = getPara("password");
			if (com.zhizhi.common.tools.ToolUtils.CheckKeyWord(phone == null ? "" : phone.replaceAll(" ", ""))) {
				login();
				return;
			} else {
				Record account = service.Login(phone, password);
				if (account != null) {
					setSessionAttr("account_session", account);
					setSessionAttr("operator_session",
							ToolOperatorSession.operatorSessionSet(account.getInt("Id").toString()));
					String roleids = account.getStr("roleids");
					if (Role.isTeacher(roleids) || Role.isStudent(roleids) || Role.isDudao(roleids)
							|| Role.isJiaowu(roleids)) {		
												
						resultMap.put("url", "doIndex");	
						resultMap.put("message", "success");
						renderJsp("/account/index.jsp");
						return;
					} else {				
						login();
						return;
					}
				} else {
					login(); 
					resultMap.put("url", "");	
					resultMap.put("message", "false");
					renderJson(resultMap);
				}
			}
		} catch (Exception ex) {
			LOGGER.error(ex.toString());
		}
	}
	
	/*
	 * 注册逻辑处理
	 */
	
	/*
	 * 跳转首页 
	 */
	public void doIndex() {
		try {
			//获取任务完成情况的数据
			Record account = getSessionAttr("account_session");
			if (account != null) {
				List<Object> list = service.getIndexData(account);
				String getInformSql = "select * from t_inform where recevied_personId = ?";
				String getTaskSql = "select * from t_task where recevied_personId = ?";
				String getMoudleSql = "select names from pt_module where parentmoduleids = 156";
				List<Record> informList = Db.find(getInformSql, account.getInt("id"));
				List<Record> taskList = Db.find(getTaskSql, account.getInt("id"));
				List<Record> moduleList = Db.find(getMoudleSql);
				setSessionAttr("informList", informList);
				setSessionAttr("taskList", taskList);
				setSessionAttr("data", list);
				setSessionAttr("moduleList", moduleList);
				renderJsp("/account/indexuser.jsp");
			} 
		} catch (Exception e) {
			LOGGER.error(e);
		}
	}
	
	/*
	 *	注册 
	 */
	public void doRegister() {
		try {
			
		} catch (Exception ex) {
			LOGGER.error(ex);
		}
	}
	
	/*
	 * 修改密码 
	 */
	public void doUpdatePassword() {	
		try {		
			CodeSendResult result = new CodeSendResult();
			String phone = getPara("phone");
			String password = getPara("password");
			String yanzm = getPara("yanzm");
			boolean flag = verifyCode(phone, yanzm);
			if (flag) {
				String sql = "update account set user_pwd = ? where tel = ?";				
				Db.update(sql, ToolMD5.getMD5(password), phone);
				result.setResult(true);
				result.setPhoneState("修改密码成功");
			} else {
				result.setResult(false);
				result.setPhoneState("验证码不一致");
				renderJson(result);
			}
		} catch (Exception ex) { 
			LOGGER.error(ex);
		}
	}
	
	/*
	 * 检测手机号是否存在 
	 */
	public void checkPhoneIsExist() {
		try {
			String phone = getPara("phone");
			if (!ToolString.isNull(phone)) {
				String sql = "select * from account where tel = ? and account.state = 0";
				Record user = (Record) Db.findFirst(sql, phone);
				if (null == user) {
					renderJson(false);
					return;		
				} else {
					renderJson(true);
					return;
				}
			}
		} catch (Exception ex) {
			LOGGER.error(ex);
		}
	}
	
	/*
	 * 登录页                                                 
	 */
	public void login() {
		try {
			String loginPath = Organization.getOrg().getStr("loginPath");
			if (StrKit.isBlank(loginPath)) {
				renderJsp("/account/login.jsp");
				return;
			}
			renderJsp(loginPath);
		} catch (Exception ex) {
			LOGGER.error(ex);
		}
	}

	/* 
	 * 添加日程
	 */
	public void addAgenda() {
		try {
			Date start = ToolDateTime.getDate(getPara("start"),ToolDateTime.pattern_ymd_hm);
			Date end = ToolDateTime.getDate(getPara("end"),ToolDateTime.pattern_ymd_hm);
			Record account = getSessionAttr("account_session");			
			Record record = new Record();
			record.set("id", ToolString.getUUID()).set("title", getPara("richeng"))
				.set("startDate", start).set("endDate", end)
				.set("allDay", false).set("accountId", account.getInt("id"));
			boolean flag = Db.save("t_agenda", record);
			if (flag) {
				renderJson("code", "1");
			}
			else {
				renderJson("code", "-1");
			}
		} catch (Exception ex) {
			renderJson("code","0");
			LOGGER.error(ex);
		}
	}
	
	/*
	 * 读取指定教师的日程信息 
	 */
	public void readAgenda() {
		try {
			Record account = getSessionAttr("account_session");
			String sql = "select * from t_agenda where accountId = ?";
			List<Record> list = Db.find(sql, account.getInt("id"));
			renderJson(list);
		} catch (Exception ex) {
			LOGGER.error(ex);
		}
	}
	
	/*
	 * 删除日程 
	 */
	
	public void deleteAgenda() {
		try {
			String id = getPara("id");
			if (!ToolString.isNull(id)) {
				boolean flag = Db.deleteById("t_agenda", id);
				if (flag) {
					renderJson("code", "2");
				} else {
					renderJson("code", "-2");
				}
			}
		} catch (Exception ex) {
			renderJson("0");
			LOGGER.error(ex);
		}
	}
	
	public void exit() {
		try {
			removeSessionAttr("account_session");
			redirect("/account/login");
		} catch (Exception ex) {
			LOGGER.error(ex);
		}
	}
	
	/*
	 * 发送验证码
	 */
	public void sendCode() {
		
		String phone = getPara("phone");
		CodeSendResult result = new CodeSendResult();
		System.out.println(phone);
		String nonce = String.valueOf((int) ((Math.random() * (9999 - 1000 + 1)) + 1000));
		// 手机号码
		String mobile = phone;
		// 判断手机号码是否存在
		Record record = service.Find(phone);
		Boolean isPhoneExists = record != null;
		if (!isPhoneExists) {
			result.setResult(false);
			result.setPhoneState("手机号码不存在！");
			renderJson(result);
			return;
		}
		CloseableHttpClient httpclient = HttpClients.createDefault();
		HttpPost httpPost = new HttpPost(Constants.SERVERURL);
		String curTime = String.valueOf((new Date()).getTime() / 1000L);
		// 计算checksum
		String checkSum = CheckSumBuilder.getCheckSum(Constants.APPSECURITY, nonce, curTime);
		// 设置请求头
		httpPost.addHeader("AppKey", Constants.APPKEY);
		httpPost.addHeader("Nonce", nonce);
		httpPost.addHeader("CurTime", curTime);
		httpPost.addHeader("CheckSum", checkSum);
		httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
		// 设置请求的参数
		List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		/*
		 * 1.如果是模板短信，请注意参数mobile是有s的，详细参数配置请参考“发送模板短信文档” 2.参数格式是jsonArray的格式，例如
		 * "['13888888888','13666666666']"
		 * 3.params是根据你模板里面有几个参数，那里面的参数也是jsonArray格式
		 */
		nvps.add(new BasicNameValuePair("templateid", Constants.TEMPLATEID));
		nvps.add(new BasicNameValuePair("mobile", mobile));
		nvps.add(new BasicNameValuePair("codeLen", Constants.CODELEN));
		try {
			httpPost.setEntity(new UrlEncodedFormEntity(nvps, "utf-8"));
			CloseableHttpResponse response = httpclient.execute(httpPost);
			StatusLine status = response.getStatusLine();
			HttpEntity entity = response.getEntity();
			EntityUtils.consume(entity);
			if (status.getStatusCode() == 200) {
				
				result.setResult(true);
			}
			renderJson(result);
		} catch (Exception ex) {
			LOGGER.error(ex);
		} finally {
			// response.close();
			
		}
	}
	
	/*
	 * 校验验证码
	 */
	@SuppressWarnings("unused")
	private Boolean verifyCode(String mobile, String code) {
		String nonce = String.valueOf((int) ((Math.random() * (9999 - 1000 + 1)) + 1000));
		try {
			CloseableHttpClient httpclient = HttpClients.createDefault();
			HttpPost httpPost = new HttpPost(Constants.VERIFYURL);
			String curTime = String.valueOf((new Date()).getTime() / 1000L);
			// 计算checksum
			String checkSum = CheckSumBuilder.getCheckSum(Constants.APPSECURITY, nonce, curTime);
			// 设置请求头
			httpPost.addHeader("AppKey", Constants.APPKEY);
			httpPost.addHeader("Nonce", nonce);
			httpPost.addHeader("CurTime", curTime);
			httpPost.addHeader("CheckSum", checkSum);
			httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
			// 设置请求的参数
			List<NameValuePair> nvps = new ArrayList<NameValuePair>();
			nvps.add(new BasicNameValuePair("mobile", mobile));
			nvps.add(new BasicNameValuePair("code", code));
			
			httpPost.setEntity(new UrlEncodedFormEntity(nvps, "utf-8"));
			CloseableHttpResponse response = httpclient.execute(httpPost);
			StatusLine status = response.getStatusLine();
			HttpEntity entity = response.getEntity();
			if (status.getStatusCode() == 200) {
				return true;
			}
			return false;
		} catch (Exception ex) {
			return false;
		}
	}

}