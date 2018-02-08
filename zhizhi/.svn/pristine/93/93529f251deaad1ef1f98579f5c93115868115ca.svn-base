package com.zhizhi.common.config;

import org.apache.log4j.Logger;

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.ext.interceptor.SessionInViewInterceptor;
import com.jfinal.i18n.I18nInterceptor;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.CaseInsensitiveContainerFactory;
import com.jfinal.plugin.activerecord.dialect.MysqlDialect;
import com.jfinal.plugin.cron4j.Cron4jPlugin;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.render.ViewType;
import com.jfinal.template.Engine;
import com.zhizhi.common.plugin.MessagePropertiesPlugin;
import com.zhizhi.common.thread.ThreadParamInit;
import com.zhizhi.common.tools.ToolOperatorSession;
import com.zhizhi.sys.account.controller.AccountController;
import com.zhizhi.sys.system.model.ThreadSysLog;
import com.zhizhi.common.handler.GlobalHandler;
import com.zhizhi.common.interceptor.AuthenticationInterceptor;
import com.zhizhi.common.interceptor.LoginInterceptor;
import com.zhizhi.common.interceptor.ModuleFeaturesInterceptor;
import com.zhizhi.common.interceptor.ParamPkgInterceptor;
import com.zhizhi.common.interceptor.RemoveRefundSessionInterceptor;
import com.zhizhi.common.plugin.TablePlugin;
import com.zhizhi.common.plugin.ControllerPlugin;
// com.zhizhi.sys.account.controller.AccountController;
import com.zhizhi.common.constants.DictKeys;
import com.zhizhi.common.plugin.PropertiesPlugin;
import com.zhizhi.common.tools.ToolString;

/**
 * @author shuqiangji
 * @description 知之系统配置
 */
public class zhizhiConfig extends JFinalConfig{

	private static final Logger log = Logger.getLogger(zhizhiConfig.class);
	
	/**
	 * 常量配置
	 */
	@Override
	public void configConstant(Constants me) {
		// TODO Auto-generated method stub
		log.info("configConstant 缓存 properties");
		new PropertiesPlugin(loadPropertyFile("/init.properties")).start();
		log.info("configConstant 设置字符集");
		me.setEncoding(ToolString.encoding);
		log.info("configConstant 设置是否开发模式");
		me.setDevMode(getPropertyToBoolean("config.devMode", false));
		me.setViewType(ViewType.JSP);
	
		
		me.setI18nDefaultBaseName((String)PropertiesPlugin.getParamMapValue(DictKeys.basename));
		
		log.info("configConstant 视图error page设置");
		me.setError401View("/common/401.html");
		me.setError403View("/common/403.html");
		me.setError404View("/common/404.html");
		me.setError500View("/common/500.html");
	}

	@Override
	public void configRoute(Routes me) {
		// TODO Auto-generated method stub
		me.setBaseViewPath("/WEB-INF");
		me.add("/", AccountController.class);
		new ControllerPlugin(me).start();
	}

	@Override
	public void configEngine(Engine me) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void configPlugin(Plugins me) {
		// TODO Auto-generated method stub
		log.info("configPlugin 配置Druid数据库连接池插件");
		DruidPlugin druidPlugin = new DruidPlugin(
				(String)PropertiesPlugin.getParamMapValue(DictKeys.db_connection_jdbcUrl), 
				(String)PropertiesPlugin.getParamMapValue(DictKeys.db_connection_userName), 
				(String)PropertiesPlugin.getParamMapValue(DictKeys.db_connection_passWord), 
				(String)PropertiesPlugin.getParamMapValue(DictKeys.db_connection_driverClass));
		druidPlugin.set(
				(int)PropertiesPlugin.getParamMapValue(DictKeys.db_initialSize), 
				(int)PropertiesPlugin.getParamMapValue(DictKeys.db_minIdle), 
				(int)PropertiesPlugin.getParamMapValue(DictKeys.db_maxActive));
		me.add(druidPlugin);
		log.info("configPlugin 配置ActiveRecord插件");
		ActiveRecordPlugin arp = new ActiveRecordPlugin(druidPlugin);
		arp.setShowSql(getPropertyToBoolean("config.devMode", false));
		log.info("configPlugin 使用数据库类型是 mysql");
		arp.setDialect(new MysqlDialect());
		log.info("数据库表字段: 统一大小写为 (大写)");
		arp.setContainerFactory(new CaseInsensitiveContainerFactory(false));//false 是大写, true是小写, 不写是
		log.info("表扫描注册");
		new TablePlugin(arp).start();
		me.add(arp);
		
		log.info("EhCachePlugin EhCache缓存");
		me.add(new EhCachePlugin());
		
		log.info("Cron4jPlugin 载入 任务调度");
		//me.add(new Cron4jPlugin("task.properties"));
	}

	@Override
	public void configInterceptor(Interceptors me) {
		// TODO Auto-generated method stub
		me.add(new SessionInViewInterceptor());
		me.add(new LoginInterceptor());
		me.add(new I18nInterceptor());
		me.add(new RemoveRefundSessionInterceptor());
		me.add(new ModuleFeaturesInterceptor());
		log.info("configInterceptor 权限认证拦截器");
		me.add(new AuthenticationInterceptor());
		
		log.info("configInterceptor 参数封装拦截器");
		me.add(new ParamPkgInterceptor());
	}

	@Override
	public void configHandler(Handlers me) {
		// TODO Auto-generated method stub
		log.info("configHandler 全局配置处理器，主要是记录日志和request域值处理");
		me.add(new GlobalHandler());
	}

	/**
	 * 系统启动完成后执行
	 */
	public void afterJFinalStart() {
		log.info("afterJFinalStart 启动操作日志入库线程");
		ThreadSysLog.startSaveDBThread();
		
		new MessagePropertiesPlugin(loadPropertyFile("/smsconfig.properties")).start();

		log.info("加载角色信息到系统内存");
		ToolOperatorSession.refreshRoleMap();
		
		
		log.info("加载缓存开始");
		new ThreadParamInit().start();
	}
	
	/**
	 * 系统关闭前调用
	 */
	public void beforeJFinalStop() {
		log.info("beforeJFinalStop 释放日志入库线程");
		ThreadSysLog.setThreadRun(false);
	}
}
