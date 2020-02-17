package lgg.upload.service;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.fileupload.FileItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lgg.upload.mapper.InManguoDao;
import lgg.upload.mapper.InManguoMapper;
import lgg.upload.model.MangoPrice;

@Service
public class PictureSave {
	
	@Autowired
	private PictureFileUpload pictureFileUpload;
	@Autowired
	private InManguoMapper inManguoMapper;

	public int pictureSave(List<FileItem> list, String username) throws IOException {
		List<String> pList = new ArrayList<String>();
		PictureFileUpload pictureFileUpload =new PictureFileUpload();
		InManguoDao inManguoMapper = new InManguoDao();
		String filename = null;
		String name = null;
		String titlename = null;
		for (FileItem item : list) {
			if (item.isFormField()) {
				if ("title".equals(item.getFieldName())) {
					try {
						titlename = item.getString("UTF-8");
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
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
				pictureFileUpload.uploadFile(stream, filename, name, username, titlename);
				if (filename == null || filename.trim().equals("")) {
					continue;
				}
			}
		}
		String title = pList.get(0);
		String introduce = pList.get(1);
		float weight1 = Float.parseFloat(pList.get(2));
		float weight2 = Float.parseFloat(pList.get(3));
		float price1 = Float.parseFloat(pList.get(4));
		float price2 = Float.parseFloat(pList.get(5));
		float price3 = Float.parseFloat(pList.get(6));
		float price4 = Float.parseFloat(pList.get(7));
		int number = Integer.parseInt(pList.get(8));
		UUID uuid = UUID.randomUUID();
		String manguoId = uuid.toString();
		MangoPrice newManGuo = new MangoPrice(manguoId, title, username, introduce, price1, price3, price2, price4,
				weight1, weight2,0,number);
		inManguoMapper.inser(newManGuo);
		return 0;
	}

}
