package com.oracle.handler;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oracle.service.OrderDetailService;
import com.oracle.service.OrderService;
import com.oracle.service.PartsRepertoryService;
import com.oracle.service.PartsService;
import com.oracle.vo.Order;
import com.oracle.vo.OrderDetail;
import com.oracle.vo.Parts;

@Controller
@SessionAttributes(names= {"opageinfo","orderedit"})
@RequestMapping("/pages/ordersys/order")
public class OrdercheckHandler2 {

	@Autowired
	OrderService oservice;
	@Autowired
	OrderDetailService odservice;
	@Autowired
	PartsService pservice;
	@Autowired
	PartsRepertoryService prservice;
	
	
	
	@RequestMapping("/orderchecklist")
	public String orderchecklist(HttpSession session,@RequestParam("star") Integer star) {
		PageHelper.startPage(star, 5);
		List<Order> list=oservice.getOrderByflagor("1","2");
		PageInfo info=new PageInfo(list);
		session.setAttribute("cpageinfo", info);
		return "pages/ordersys/order/orderchecklist";
	}
	
	@RequestMapping("/turn3")
	public String turn3(@RequestParam("pagenum") int  pagenum) {
		return "redirect:orderchecklist?star="+pagenum;
	}
	
	@RequestMapping("/pass")
	public String pass(@RequestParam("orderid") Integer orderid,@RequestParam("pagenum") Integer pagenum) {
		oservice.updateByorederid2(orderid);
		return "redirect:orderchecklist?star="+pagenum;
	}
	
	@RequestMapping("/nopass")
	public String nopass(@RequestParam("orderid") Integer orderid,@RequestParam("pagenum") Integer pagenum) {
		oservice.updateByorederid3(orderid);
		return "redirect:orderchecklist?star="+pagenum;
	}
	
	

	
	@RequestMapping("/search2")
	public String search2(HttpSession session,@RequestParam("orderdate") String orderdate,@RequestParam("ordercode") String ordercode,@RequestParam("orderflag") String orderflag) {
		Order order=new Order();
		session.setAttribute("date", orderdate);
		order.setOrdercode(ordercode);
		order.setOrderflag(orderflag);
		session.setAttribute("order", order);
		return "redirect:orderchecklist2?star=1";
	}
	@RequestMapping("/orderchecklist2")
	public String orderchecklist2(HttpSession session,@RequestParam("star") Integer star) {
		PageHelper.startPage(star, 1);
		Order order=(Order) session.getAttribute("order");
		List<Order> list=oservice.getOrderByOrderCodeorflag2(order.getOrdercode(), order.getOrderflag(),(String)session.getAttribute("date"));
		System.out.println(list.size());
		PageInfo info=new PageInfo(list);
		session.setAttribute("cpageinfo2", info);
		return "pages/ordersys/order/orderchecklist2";
	}
	
	@RequestMapping("/turn4")
	public String turn4(@RequestParam("pagenum") int  pagenum) {
		return "redirect:orderchecklist2?star="+pagenum;
	}
	
}
