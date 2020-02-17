package lgg.upload.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lgg.upload.mapper.OrderManagementMapper;
import lgg.upload.model.NonghuOrder;
@Controller
public class OrderManagement {
	@Autowired
	private OrderManagementMapper OMM;
	@RequestMapping(value="QuaryNonghuRrder.do")
	public String quaryNonghuRrder(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String yonghu = (String) session.getAttribute("yonghu");
		List<NonghuOrder> list = OMM.quaryOrder(yonghu);
		request.setAttribute("NonghuOrders", list);
		return "/order.jsp";
	}
	@RequestMapping("OrderUpdate.do")
	@ResponseBody
	public int orderUpdate(String ordernumber) {
		int n = OMM.orderUpdate(ordernumber);
		return n;
	}

}
