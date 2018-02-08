
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

package com.zhizhi.sys.system.model;

import java.util.List;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Db;
import com.zhizhi.common.annotation.model.Table;
import com.zhizhi.common.base.BaseModel;

@SuppressWarnings("serial")
@Table(tableName = "account_campus")
public class AccountCampus extends BaseModel<AccountCampus> {
	
	public static final String SESSION_ACCOUNTCAMPUSIDS = "accountcampusids";
	
	public static final AccountCampus dao = new AccountCampus();

	public List<AccountCampus> getCampusidsByAccountid(Integer accountId) {
		if(accountId != null)
			return dao.find("select * from account_campus where account_id  = ? ", accountId);
		else
			return null;
	}

	public AccountCampus getAccountCampusMessage(String accountid, String campusid) {
		return dao.findFirst("select * from account_campus where account_id = ? and campus_id = ? ", accountid, campusid);
	}

	public List<AccountCampus> getAllCampusidByAccountid(String id) {
		return dao.find("select * from account_campus where account_id = ? ", id);
	}

	/**
	 * 根据用户id 获取所在所有校区的ids, (学生不用此法)
	 * @param accountId
	 * @return
	 */
	public String getCampusIdsByAccountId(Object accountId) {
		if(accountId != null)
			return Db.queryStr("SELECT GROUP_CONCAT(DISTINCT campus_id) FROM account_campus WHERE account_id = ? ", accountId);
		else
			return null;
	}

	/**
	 * 某几个校区的老师
	 * 
	 * @param campusids
	 *            eg. (1,2)
	 * @return
	 */
	public String getTeacherIdsfromCampusids(String campusids) {
		if (StrKit.notBlank(campusids))
			return Db.queryStr("SELECT GROUP_CONCAT(t.account_id) FROM (SELECT account_id FROM account_campus WHERE FIND_IN_SET(campus_id, ?) GROUP BY account_id ) t", campusids);
		else
			return null;
	}

}
