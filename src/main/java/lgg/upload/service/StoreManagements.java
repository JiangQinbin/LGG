package lgg.upload.service;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.commons.fileupload.FileItem;

import lgg.upload.mapper.VodeoDao;
import lgg.upload.model.Vodeo;

public class StoreManagements {
	public int pictureSave(List<FileItem> list, String username) throws IOException {
		PictureFileUpload pictureFileUpload =new PictureFileUpload();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		long shijiantime = System.currentTimeMillis();
		String shijian = df.format(shijiantime);
		String name = username + shijiantime;
		for (FileItem item : list) {
				InputStream stream = item.getInputStream();
				String filename = item.getName();
				pictureFileUpload.vodeoUploadFile(stream, filename,name, username);
			}
		Vodeo vodeo = new Vodeo(username,name,shijian);
		VodeoDao vodeoDao = new VodeoDao();
		boolean kkk = vodeoDao.inser(vodeo);
		if(kkk)
			return 1;
		return 0;
		}
	

}
