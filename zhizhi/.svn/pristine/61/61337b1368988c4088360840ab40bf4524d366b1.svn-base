package com.zhizhi.sys.test.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFDataFormatter;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.jfinal.upload.UploadFile;
import com.zhizhi.common.annotation.controller.Controller;
import com.zhizhi.common.base.BaseController;
import com.zhizhi.common.tools.ToolDateTime;
import com.zhizhi.common.tools.ToolString;
import com.zhizhi.sys.test.model.ExcelTest;
import com.zhizhi.sys.test.service.TestService;
/**
 * 
 * @author taotao
 *
 */
@Controller(controllerKey="/excel")
public class ExcelController extends BaseController{
	
	private static final Logger LOGGER = Logger.getLogger(ExcelController.class);
	
	private TestService service = new TestService();
	
	/**
	 * 解析excel中的内容 并放到list中
	 */
	public void readExel() {
		String path = System.getProperty("catalina.home");
		// E:\360安全浏览器下载\apache-tomcat-8.0.46-windows-x64\apache-tomcat-8.0.46
		StringBuilder pathName = new StringBuilder(path);
		pathName.append("\\webapps\\excel\\1.xls");
		InputStream is = null;
		ArrayList<ExcelTest> rowList = new ArrayList<>();
		try {
			is = new FileInputStream(new File(pathName.toString()));
			HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
			for (int numSheet = 0; numSheet<hssfWorkbook.getNumberOfSheets(); numSheet++) {
				HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);
				if (hssfSheet == null) {
					continue;
				}
				int len = hssfSheet.getLastRowNum();
				for (int rowNum = 1; rowNum <= len; rowNum++) {
					HSSFRow hssfRow = hssfSheet.getRow(rowNum);
					if (!ToolString.isNull(getValue(hssfRow.getCell(0)))) {
						ExcelTest test = new ExcelTest();
						HSSFCell tel = hssfRow.getCell(0);
						HSSFCell name = hssfRow.getCell(1);
						HSSFCell price = hssfRow.getCell(2);
						HSSFCell endDate = hssfRow.getCell(3);
						test.setTel(getValue(tel));
						test.setName(getValue(name));
						BigDecimal bd = new BigDecimal(getValue(price));
						test.setPrice(bd);
						test.setEndDate(ToolDateTime.getDate(getValue(endDate), ToolDateTime.DATAFORMAT_STR));
						rowList.add(test);
					} else {
						break;
					}
				}
			}
			renderJson(rowList);
		} catch (Exception ex) {
			LOGGER.error(ex);
		}		
	}
	
	/**
	 * 下载exel模板
	 */
	public void downloadExcel() {
		try {
			String path = System.getProperty("catalina.home");
			StringBuilder pathName = new StringBuilder(path);
			pathName.append("\\webapps\\excel\\1.xls");
			File file = new File(pathName.toString());
			if (file.exists()) {
				renderFile(file);
			}
		} catch (Exception ex) {
			LOGGER.error(ex);
		}
	}
	
	/**
	 * 上传文件
	 */
	public void uploadFile() {
		UploadFile uploadFile = this.getFile();
		String fileName = uploadFile.getFileName();
		File file = uploadFile.getFile();
		String root = getRequest().getServletContext().getRealPath("excel");
		File t = new File(root,fileName);
		try {
			t.createNewFile();
		} catch (Exception e) {
			
		} 
		service.fileChangeCopy(file, t);
		file.delete();
	}
	
	/**
	 * 
	 * 转换单元格中字符串的格式
	 */
	@SuppressWarnings("static-access")
	private String getValue(HSSFCell hssfCell) {
		
		if (hssfCell.getCellType() == hssfCell.CELL_TYPE_BOOLEAN) {
			
			return String.valueOf(hssfCell.getBooleanCellValue());
			
		} else if (hssfCell.getCellType() == hssfCell.CELL_TYPE_NUMERIC) {
			if (HSSFDateUtil.isCellDateFormatted(hssfCell)) {
		    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		    	return sdf.format(hssfCell.getDateCellValue()).toString();
		    } else {
				DecimalFormat df = new DecimalFormat("0");  
				String want = df.format(hssfCell.getNumericCellValue());
				return String.valueOf(want);
			}			
	    } else {
			return String.valueOf(hssfCell.getStringCellValue());
			
		}
	}
}
