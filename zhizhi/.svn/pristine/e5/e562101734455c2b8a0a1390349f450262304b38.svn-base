package com.zhizhi.sys.test.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.channels.FileChannel;
import java.util.*;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.render.Render;
import com.zhizhi.sys.test.model.Test;

public class TestService {

	public Collection<Test> get(){
		try {
		List<Test> tests = Test.dao.find("select * from test;");
		return tests;
		}catch(Exception ex) 
		{
			ex.printStackTrace();
		}
		return null;
	}
	
	public Test getById(int id) {
		Test test = Test.dao.findById(id);
		return test;
	}
	public Test getPartById(int id){
		Test test = (Test) Test.dao.findByIdLoadColumns(1,"name,age,sex");
		String name = test.getStr("name");
		System.out.println(name);
		return test;
	}
	public boolean add(Test test){
		Record newTest = new Record().set("name", test.getStr("name"))
									 .set("age", test.getInt("age"))							 .set("sex", test.getStr("sex"));
		return Db.save("test", newTest);
		
	}
	public boolean update(){
		Record test = Db.findById("test", 2).set("description", "哈哈");
		return Db.update("test",test);
	}
	public void fileChangeCopy(File s,File t) {
		FileInputStream is = null;
		FileOutputStream os = null;
		FileChannel in = null;
		FileChannel out = null;
		try {
			is = new FileInputStream(s);
			os = new FileOutputStream(t);
			in = is.getChannel();
			out = os.getChannel();
			in.transferTo(0, in.size(), out);
		} catch (Exception ex) {
			
		} finally {
			try {
				is.close();
				os.close();
				in.close();
				out.close();
			} catch (Exception e) {
				
			}
		}
	}
}
