package lgg.upload.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lgg.upload.mapper.UserMapper;
import lgg.upload.model.User;

@Controller
public class LoginToJudge {
	@Autowired
	private UserMapper userMapper;
	@RequestMapping("LoginToJudge.do")
	@ResponseBody
	public String loginToJudge(HttpServletRequest request, HttpServletResponse response,HttpSession session) {
		String yonghu = "";
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie5 : cookies) {
				
				if (cookie5.getName().equals("yonghu")) {
					yonghu = cookie5.getValue();
				}
			}
		}
		if(!"".equals(yonghu)) {
			session.setAttribute("yonghu", yonghu);
			User user= userMapper.selectUser(yonghu);
			if(user.getCategory()==1)
				return "2"+yonghu;
			return "1"+yonghu;
		}
		return "";
	}

}
