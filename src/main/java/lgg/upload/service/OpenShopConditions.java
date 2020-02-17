package lgg.upload.service;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

public class OpenShopConditions {
	public int openShopConditions(List<String> list,String username) {
	    String dizhi = list.get(2).substring(0, 14);
	    if(!"四川省盐边县桐子林镇纳尔河村".equals(dizhi))
	    	return 2;
		String t = Thread.currentThread().getContextClassLoader().getResource("").getPath();
		
		int num = t.indexOf("PLGG");
		String path = t.substring(0, num) + "farmers_picture/"+username;
		String path1 = path+"/IdCardVerso.jpg";
		JSONArray merod= ImageRecognition.recognition(path1);
		int n = merod.length();
		if (n!=4)
			return 3;
		else {
			JSONObject res1 = (JSONObject) merod.get(0);
			String gggg1 = (String) res1.get("words");
			if(!"中华人民共和国".equals(gggg1))
				return 3;
			JSONObject res2 = (JSONObject) merod.get(1);
			String gggg2 = (String) res2.get("words");
			if(!"居民身份证".equals(gggg2))
				return 3;
		}
		String path2 = path+"/IdCardFront.jpg";
		JSONArray merod1= ImageRecognition.recognition(path2);
		int n1 = merod1.length();
		if (n1!=6)
			return 3;
		else {
			JSONObject res1 = (JSONObject) merod1.get(0);
			String gggg1 = (String) res1.get("words");
			String xingming = list.get(0);
			String xingming1 = gggg1.substring(2);
			if(!xingming.equals(xingming1))
				return 3;
			JSONObject res2 = (JSONObject) merod1.get(3);
			String gggg2 = (String) res2.get("words");
			String zhi = list.get(2);
			String zhi1 = gggg2.substring(2);
			JSONObject res3 = (JSONObject) merod1.get(4);
			String gggg3 = (String) res3.get("words");
			zhi1 = zhi1+gggg3;
			if(!zhi.equals(zhi1))
				return 3;
			JSONObject res4 = (JSONObject) merod1.get(5);
			String gggg4 = (String) res4.get("words");
			String ma = list.get(1);
			String ma1 = gggg4.substring(6);
			if(ma.equals(ma1))
				return 6;
			else 
				return 3;
		}
	}
	/*public int openShopSave(List<String> list,String username) {
		
	}*/
}
