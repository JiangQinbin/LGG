package lgg.upload.service;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.fileupload.FileItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lgg.upload.mapper.OpenShopDao;
import lgg.upload.mapper.OpenShopMapper;

public class RealPictureSave {
	public int pictureSave(List<FileItem> list, String username) throws IOException {
		List<String> pList = new ArrayList<String>();
		PictureFileUpload pictureFileUpload =new PictureFileUpload();
		OpenShopConditions OSC = new OpenShopConditions();
		
		
		String filename = null;
		String name = null;
		for (FileItem item : list) {
			if (item.isFormField()) {
				// String name = item.getFieldName();
				String value = item.getString("UTF-8");
				pList.add(value);
				// System.out.println("value"+value);
				continue;
			} else {
				InputStream stream = item.getInputStream();
				filename = item.getName();
				name = item.getFieldName();
				pictureFileUpload.realUploadFile(stream, filename, name, username);
				if (filename == null || filename.trim().equals("")) {
					continue;
				}
			}
		}
		/*在这里需要进文字识别，判断用户是否符合开店条件*/
		//identifyResults==6符合开店条件，==3图片不符合规范，==2不符合开店条件
		int identifyResults = OSC.openShopConditions(pList, username);
		if (identifyResults==6) {
			/*数据库保存*/
			OpenShopDao OSD = new OpenShopDao();
			int fhfh  = 0 ;
			try {
				fhfh = OSD.updateUserTable(pList,username);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return fhfh;
		}
		else 
			return identifyResults;
	}

}
