
     /*
   * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS HEADER.
   *
   * Copyright 2017 摩码创想, support@momathink.com
    *
   * This file is part of Jiaowu_v1.0.
   * Jiaowu_v1.0 is free software: you can redistribute it and/or modify
   * it under the terms of the GNU Lesser General Public License as published by
   * the Free Software Foundation, either version 3 of the License, or
   * (at your option) any later version.
   *
   * Jiaowu_v1.0 is distributed in the hope that it will be useful,
   * but WITHOUT ANY WARRANTY; without even the implied warranty of
   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   * GNU Lesser General Public License for more details.
   *
   * You should have received a copy of the GNU Lesser General Public License
   * along with Jiaowu_v1.0.  If not, see <http://www.gnu.org/licenses/>.
   *
   * 这个文件是Jiaowu_v1.0的一部分。
   * 您可以单独使用或分发这个文件，但请不要移除这个头部声明信息.
    * Jiaowu_v1.0是一个自由软件，您可以自由分发、修改其中的源代码或者重新发布它，
   * 新的任何修改后的重新发布版必须同样在遵守LGPL3或更后续的版本协议下发布.
   * 关于LGPL协议的细则请参考COPYING文件，
   * 您可以在Jiaowu_v1.0的相关目录中获得LGPL协议的副本，
   * 如果没有找到，请连接到 http://www.gnu.org/licenses/ 查看。
   *
   * - Author:摩码创想
   * - Contact: support@momathink.com
   * - License: GNU Lesser General Public License (GPL)
   */

package com.zhizhi.sys.operator.model;

import java.util.List;

import com.jfinal.plugin.ehcache.CacheKit;
import com.zhizhi.common.annotation.model.Table;
import com.zhizhi.common.base.BaseModel;
import com.zhizhi.common.constants.DictKeys;

/** 功能 Url 管理  
 *  */
@Table(tableName="pt_operator")
public class Operator extends BaseModel<Operator> {

	private static final long serialVersionUID = -5723362110185587763L;
	public static final Operator dao = new Operator();
	
	/**
	 * 重写save方法
	 */
	public boolean save() {
		String formaturl = "qx_" + (this.getStr("url").replace("/", ""));
		this.set("formaturl", formaturl);
		CacheKit.removeAll(DictKeys.cache_name_page);
		return super.save();//这里这样写 是因为这个功能是给开发人员使用, 没有并发,不会有脏数据缓存
	}
	
	/**
	 * 重写update方法
	 */
	public boolean update() {
		this.set("version", this.getLong("version")+1);
		CacheKit.removeAll(DictKeys.cache_name_page);
		return super.update();//这里这样写 是因为这个功能是给开发人员使用, 没有并发,不会有脏数据缓存
	}
	
	/** 根据 uri 查询缓存  */
	public Operator cacheGet(String key){
		Operator operator = CacheKit.get(DictKeys.cache_name_page, key);
		if(null == operator){
			operator = queryByUrl(key);
			if(null != operator)
				CacheKit.put(DictKeys.cache_name_page, key, operator);
		}
		return operator;
	}
	
	/** 获取所有的 功能 */
	public List<Operator> queryAll() {
		return dao.find("SELECT * FROM pt_operator");
	}

	/** 根据 uri 查询  */
	public Operator queryByUrl(String url) {
		return dao.findFirst("SELECT * FROM pt_operator WHERE url = ?", url);
	}

	/** 根据  所属模块(菜单)id 获取下面所有 功能  */
	public List<Operator> queryByModuleids(String moduleids) {
		return dao.find("SELECT * FROM pt_operator WHERE moduleids = ?", moduleids);
	}

	/**
	 * 获取模块下的所有功能*
	 * @param systemsid 模块的id 
	 * @return
	 */
	public List<Operator> queryBySystemsid(Integer systemsid) {
		String sql=
				  " SELECT o.id "
				+ " FROM pt_operator o "
				+ " LEFT JOIN pt_module m  ON o.moduleids = m.id "
				+ " LEFT JOIN pt_module pm ON m.parentmoduleids = pm.id "
				+ " LEFT JOIN pt_systems s  ON pm.systemsids = s.id "
				+ " WHERE o.privilege = 1  "
				+ " AND s.id = ? ";
		return dao.find(sql, systemsid);
	}
	

}
