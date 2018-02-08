package com.zhizhi.sys.test.model;
import com.zhizhi.common.annotation.model.*;
import com.zhizhi.common.base.BaseModel;


/**
 * @author shuqiangji
 *
 */
@Table(tableName="test")
public class Test extends BaseModel<Test> {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1628559216517648051L;
	
	public static final Test dao = new Test();
	
	
}
