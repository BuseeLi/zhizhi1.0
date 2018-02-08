package com.zhizhi.education.model;

import com.zhizhi.common.annotation.model.Table;
import com.zhizhi.common.base.BaseModel;
/**
 * 
 * @author taotao
 *
 */
@SuppressWarnings("serial")
@Table(tableName="t_student")
public class Student extends BaseModel<Student>{

	public static final Student dao = new Student();
}
