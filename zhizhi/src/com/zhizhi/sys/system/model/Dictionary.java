package com.zhizhi.sys.system.model;

import com.zhizhi.common.annotation.model.Table;
import com.zhizhi.common.base.BaseModel;

/*
 *字典实体 
 * */
@Table(tableName="t_dictionary")
public class Dictionary extends BaseModel<Dictionary> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2228612168643219104L;
	
	public static final Dictionary dao = new Dictionary();
}
