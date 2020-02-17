package lgg.upload.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lgg.upload.mapper.VodeoMapper;
import lgg.upload.model.Vodeo;

@Controller
public class StoreManagement {
	@Autowired
	private VodeoMapper vodeoMapper;
	@RequestMapping("QueryVideo.do")
	@ResponseBody
	public List<Vodeo> queryVideo(HttpSession session) {
		String yonghu = (String) session.getAttribute("yonghu");
		List<Vodeo> vodeoList= (List<Vodeo>) vodeoMapper.queryVodeo(yonghu);
		return vodeoList;
	}
	@RequestMapping("DeleteVideo.do")
	@ResponseBody
	public int deleteVodeo(String shipinming,String yonghu) {
		int n = vodeoMapper.deleteVodeo(shipinming);
		if(n==1) {
			String t = Thread.currentThread().getContextClassLoader().getResource("").getPath();
			int num = t.indexOf("PLGG");
			String path = t.substring(0, num) + "farmers_picture/"+yonghu+"/"+shipinming+".mp4";
			 File file = new File(path);
		        // 如果文件路径所对应的文件存在，并且是一个文件，则直接删除
		        if (file.exists() && file.isFile()) {
		            if (file.delete()) {
		                System.out.println("删除单个文件" + path + "成功！");
		            } else {
		                System.out.println("删除单个文件" + path + "失败！");
		            }
		        } else {
		            System.out.println("删除单个文件失败：" + path + "不存在！");
		        }
		}
		return n;
	}

}
