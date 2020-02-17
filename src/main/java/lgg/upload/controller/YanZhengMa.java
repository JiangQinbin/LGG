package lgg.upload.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lgg.upload.service.ImageUtils;


@Controller
public class YanZhengMa {
      @RequestMapping("YanZhengMaServlet.do")
      public void YanZhengMaServlet(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	  response.setHeader("Pragma", "No-cache");
    	  response.setHeader("Cache-Control", "no-cache");
    	  response.setDateHeader("Expires", 0L);
    	  response.setContentType("image/jpeg");     
    	  BufferedImage image = ImageUtils.createMulImage(80, 36);
    	  String code = ImageUtils.getCode();  
    	  HttpSession session = request.getSession(true);
    	  session.setAttribute("CHECKCODE", code);
          ImageIO.write(image, "JPEG", response.getOutputStream());
      }
}
