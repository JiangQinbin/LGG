package lgg.upload.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lgg.upload.mapper.GoodsMapper;
import lgg.upload.model.MangoPrice;

@Controller
public class GoodsManagement {
	@Autowired
	private GoodsMapper goodsMapper;
	@RequestMapping("QueryGoods.do")
	@ResponseBody
	public List<MangoPrice> queryGoods(HttpSession session) {
		String yonghu = (String) session.getAttribute("yonghu");
		 List<MangoPrice> list = goodsMapper.queryGoods(yonghu);
		 return list;
	}
	@RequestMapping("GoodsDelete.do")
	@ResponseBody
	public int deleteGoods(String manguoID, String yonghu, String manguoname) {
		int naumer = goodsMapper.deleteGoods(manguoID);
		if(naumer==1) {
			String t = Thread.currentThread().getContextClassLoader().getResource("").getPath();
			int num = t.indexOf("PLGG");
			for(int i = 1 ; i<7 ; i++) {
				if(i==6) {
					String path = t.substring(0, num) + "farmers_picture/"+yonghu+"/"+manguoname+"/file6.mp4";
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
				else {
					String path = t.substring(0, num) + "farmers_picture/"+yonghu+"/"+manguoname+"/file"+i+".jpg";
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
			}
			
		}
		return naumer;
	}
	
	@RequestMapping("update.do")
	public String update(String manguoID,HttpServletRequest request) {
		MangoPrice manguo = goodsMapper.queryGood(manguoID);
		String manguoname =manguo.getManguoname();
		manguoname = manguoname.substring(3, manguoname.length()-2);
		manguo.setManguoname(manguoname);
		request.setAttribute("manguo", manguo);
		return "/goodsUpdate.jsp";
	}
	
	@RequestMapping("updateManguo.do")
	@ResponseBody
		public int updateManguo(String manguoID,String manguoname,String introduce,float junzhongda,float junzhongxiao,float danjiadahao,float danjiadazhong,float danjiaxiaohao,float danjiaxiaozhong,int keshouliang) { 
		     MangoPrice manguo = new MangoPrice();
		     manguo.setManguoID(manguoID);
		     manguo.setManguoname(manguoname);
		     manguo.setIntroduce(introduce);
		     manguo.setDapingjun(junzhongda);
		     manguo.setXiaopingjun(junzhongxiao);
		     manguo.setDanjiadahao(danjiadahao);
		     manguo.setDanjiadazhong(danjiadazhong);
		     manguo.setDanjiaxiaohao(danjiaxiaohao);
		     manguo.setDanjiaziaozhong(danjiaxiaozhong);
		     manguo.setKeshouliang(keshouliang);
		     int n = goodsMapper.updateGoods(manguo);
		     return n;
		}
	

}
