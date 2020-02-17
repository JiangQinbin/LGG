package lgg.upload.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Service;

@Service
public class PictureFileUpload {
	public void uploadFile(InputStream filestream, String filename, String name, String username,
			String titlename) {
		String t = Thread.currentThread().getContextClassLoader().getResource("").getPath();
		/* /usr/java/apache-tomcat-8.5.34/webapps/LGG/WEB-INF/classes/ */
		// int num=t.indexOf(".metadata");
		// String path=t.substring(1,num).replace('/', '\\')+"farmers_picture";
		int num = t.indexOf("LGG");
		String path = t.substring(0, num) + "farmers_picture";
		filename = filename.substring(filename.lastIndexOf("."));
		File nextFile = new File(path, username + "/" + titlename);
		if (!nextFile.exists()) {
			nextFile.mkdirs();
		}
		try {
			nextFile.createNewFile();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		String jsavePath = nextFile.getAbsolutePath();
		String realSavePath = jsavePath + "/" + name + filename;

		FileOutputStream out = null;

		try {

			out = new FileOutputStream(realSavePath);

		} catch (FileNotFoundException e) {

			// TODO Auto-generated catch block

			e.printStackTrace();

		}

		byte buffer[] = new byte[10240];

		int len = 0;

		try {

			while ((len = filestream.read(buffer)) > 0) {

				out.write(buffer, 0, len);

			}

		} catch (IOException e) {

			// TODO Auto-generated catch block

			e.printStackTrace();

		}

		try {

			filestream.close();

			out.close();

		} catch (IOException e) {

			// TODO Auto-generated catch block

			e.printStackTrace();

		}

	}
	public void realUploadFile(InputStream filestream, String filename, String name, String username) {
		String t = Thread.currentThread().getContextClassLoader().getResource("").getPath();
		 ///usr/java/apache-tomcat-8.5.34/webapps/LGG/WEB-INF/classes/ 
		// int num=t.indexOf(".metadata");
		// String path=t.substring(1,num).replace('/', '\\')+"farmers_picture";
		// /E:/eclipse-photon/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/PLGG/WEB-INF/classes/
		int num = t.indexOf("PLGG");
		String path = t.substring(0, num) + "farmers_picture";
		filename = filename.substring(filename.lastIndexOf("."));
		File nextFile = new File(path, username + "/");
		if (!nextFile.exists()) {
			nextFile.mkdirs();
		}
		try {
			nextFile.createNewFile();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		String jsavePath = nextFile.getAbsolutePath();
		String realSavePath = jsavePath + "/" + name + filename;

		FileOutputStream out = null;

		try {

			out = new FileOutputStream(realSavePath);

		} catch (FileNotFoundException e) {

			// TODO Auto-generated catch block

			e.printStackTrace();

		}

		byte buffer[] = new byte[10240];

		int len = 0;

		try {

			while ((len = filestream.read(buffer)) > 0) {

				out.write(buffer, 0, len);

			}

		} catch (IOException e) {

			// TODO Auto-generated catch block

			e.printStackTrace();

		}

		try {

			filestream.close();

			out.close();

		} catch (IOException e) {

			// TODO Auto-generated catch block

			e.printStackTrace();

		}
	}
	
	public void vodeoUploadFile(InputStream filestream, String filename, String name, String username) {
		String t = Thread.currentThread().getContextClassLoader().getResource("").getPath();
		 ///usr/java/apache-tomcat-8.5.34/webapps/LGG/WEB-INF/classes/ 
		// int num=t.indexOf(".metadata");
		// String path=t.substring(1,num).replace('/', '\\')+"farmers_picture";
		int num = t.indexOf("PLGG");
		String path = t.substring(0, num) + "farmers_picture";
		filename = filename.substring(filename.lastIndexOf("."));
		File nextFile = new File(path, username + "/");
		if (!nextFile.exists()) {
			nextFile.mkdirs();
		}
		try {
			nextFile.createNewFile();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		String jsavePath = nextFile.getAbsolutePath();
		String realSavePath = jsavePath + "/"+name + filename;
         /*System.out.println(realSavePath);*/
		FileOutputStream out = null;

		try {

			out = new FileOutputStream(realSavePath);

		} catch (FileNotFoundException e) {

			// TODO Auto-generated catch block

			e.printStackTrace();

		}

		byte buffer[] = new byte[10240];

		int len = 0;

		try {

			while ((len = filestream.read(buffer)) > 0) {

				out.write(buffer, 0, len);

			}

		} catch (IOException e) {

			// TODO Auto-generated catch block

			e.printStackTrace();

		}

		try {

			filestream.close();

			out.close();

		} catch (IOException e) {

			// TODO Auto-generated catch block

			e.printStackTrace();

		}
	}

}
