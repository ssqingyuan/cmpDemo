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
public class OrderHandler {

	@Autowired
	OrderService oservice;
	@Autowired
	OrderDetailService odservice;
	@Autowired
	PartsService pservice;
	@Autowired
	PartsRepertoryService prservice;
	
	@RequestMapping("/{path}")
	public String pathHandler(@PathVariable("path") String path) {
		return "pages/ordersys/order/"+path;
	}
	
	/*
	 * �༭����
	 */
	@RequestMapping("/orderedit")
	public String partsedit(HttpSession session,@RequestParam("orderid") Integer orderid) {
		Order o=oservice.getOrderByorderid(orderid);
		System.out.println(o);
		List<OrderDetail> list=new ArrayList<OrderDetail>();
		list=odservice.getByorderid(orderid);
		List<Map<String,Object>> list1=new ArrayList<Map<String,Object>>();
		
		for(OrderDetail od:list) {
			Map<String,Object> map=pservice.getNameandCountBypartsid(od.getPartsid());
			map.put("orderpartscount", od.getOrderpartscount());
			map.put("orderdetailid", od.getOrderdetailid());
			list1.add(map);
		}
		session.setAttribute("list1", list1);
		session.setAttribute("orderedit", o);
		session.setAttribute("orderid", orderid);
		return "/pages/ordersys/order/orderedit";
	}
	
	@RequestMapping("/deleteBypk")
	public String deleteBypk(HttpSession session,@RequestParam("orderdetailid") Integer orderdetailid) {
		odservice.deleteByPrimaryKey(orderdetailid);
		return "redirect:orderedit?orderid="+((Order)session.getAttribute("orderedit")).getOrderid();
	}
	
	
	@RequestMapping("/delete")
	public String delete (@RequestParam("orderid") Integer orderid,@RequestParam("pagenum") int pagenum) {
		odservice.deleteByOrderid(orderid);
		oservice.deleteByPrimaryKey(orderid);
		return "redirect:orderlist?star="+pagenum;
	}
	
	@RequestMapping("/orderlist")
	public String orderlist(Map<String,Object> map,@RequestParam("star") Integer star) {
		PageHelper.startPage(star, 5);
		List<Order> list=oservice.getAll();
		PageInfo info=new PageInfo(list);
		map.put("opageinfo", info);
		
		return "pages/ordersys/order/orderlist";
	}
	@RequestMapping("/turn")
	public String turn(@RequestParam("pagenum") int  pagenum) {
		return "redirect:orderlist?star="+pagenum;
	}
	
	@RequestMapping("/getNameandcount")
	@ResponseBody
	public PageInfo getNameandcount(@RequestParam("star") Integer star){
		System.out.println("当前页码："+star);
		PageHelper.startPage(star, 2);
		List<Map<String,Object>> list= (List<Map<String, Object>>) pservice.getNameandCount();
		PageInfo info=new PageInfo(list);
		
		return  info;
	}
	
	@RequestMapping("/getNameandCountBypartsid")
	@ResponseBody
	public Map<String,Object> getNameandCountBypartsid(@RequestParam("partsid") Integer partsid){
		return pservice.getNameandCountBypartsid(partsid);
	}
	
	
	
	@RequestMapping("/addsave")
	public String addsave(HttpSession session,@RequestParam("orderid") int orderid) {
		int[] partsids=(int[])session.getAttribute("partsids2");
		int[] orderpartscounts=(int[]) session.getAttribute("orderpartscounts2");
		OrderDetail record=new OrderDetail();
		record.setOrderid(orderid);
		for(int i=0;i<partsids.length;i++) {
			record.setOrderpartscount(orderpartscounts[i]);
			record.setPartsid(partsids[partsids.length-1-i]);
			odservice.insert(record);
		}	
		System.out.println("这是save");
		return "redirect:orderlist?star=1";
	}
	
	
	@RequestMapping("/addsubmit")
	
	public String addsubmit(HttpSession session,@RequestParam("orderid") int orderid) {
		int[] partsids=(int[])session.getAttribute("partsids2");
		int[] orderpartscounts=(int[]) session.getAttribute("orderpartscounts2");
		OrderDetail record=new OrderDetail();
		record.setOrderid(orderid);
		for(int i=0;i<partsids.length;i++) {
			record.setOrderpartscount(orderpartscounts[i]);
			record.setPartsid(partsids[partsids.length-1-i]);
			odservice.insert(record);
			prservice.updatenumByid(partsids[partsids.length-1-i], orderpartscounts[i]);
		}
		oservice.updateByorederid(orderid);
		System.out.println("这是submit");
		return "redirect:orderlist?star=1";
	}
	
	
	    @RequestMapping("/editsave")
		@ResponseBody
		public Integer editsave(HttpSession session,@RequestParam("orderpartscounts2") int[] orderpartscounts,@RequestParam("partsids2") int[] partsids) {
			Integer orderid =(Integer) session.getAttribute("orderid");
			System.out.println("orderid---:"+orderid);
			odservice.deleteByOrderid(orderid);
			OrderDetail record=new OrderDetail();
			record.setOrderid(orderid);
			for(int i=0;i<partsids.length;i++) {
				record.setOrderpartscount(orderpartscounts[i]);
				record.setPartsid(partsids[partsids.length-1-i]);
				System.out.println("record"+i+":"+record);
				odservice.insert(record);
			}	
			System.out.println("执行save");
			return orderid;
		}

	
	@RequestMapping("/editsubmit")
	@ResponseBody
	public Integer editsubmit(HttpSession session,@RequestParam("orderpartscounts2") int[] orderpartscounts,@RequestParam("partsids2") int[] partsids) {
		Integer orderid =(Integer) session.getAttribute("orderid");
		odservice.deleteByOrderid(orderid);
		
		OrderDetail record=new OrderDetail();
		record.setOrderid(orderid);
		for(int i=0;i<partsids.length;i++) {
			record.setOrderpartscount(orderpartscounts[i]);
			record.setPartsid(partsids[partsids.length-1-i]);
			odservice.insert(record);
			prservice.updatenumByid(partsids[partsids.length-1-i], orderpartscounts[i]);
		}
		oservice.updateByorederid(orderid);
		System.out.println("这是submit");
		return orderid;
	}
	

	
	@RequestMapping("/insertinto")
	@ResponseBody
	public Integer insertinto(@RequestParam("orderpartscounts2") int[] orderpartscounts,@RequestParam("partsids2") int[] partsids,HttpSession session,Order order,@RequestParam(value="f" ,required=false) Integer f) {
		session.setAttribute("orderpartscounts2", orderpartscounts);
		session.setAttribute("partsids2", partsids);
		if(f==0) {
			order.setOrderflag("0");
		}else {
			order.setOrderflag("1");
		}
		Date date=new Date();
		order.setOrderdate(date);
		oservice.insert(order);
		
		return oservice.getorderidByordercode(order.getOrdercode());
	}
	
	@RequestMapping("/search")
	public String search(HttpSession session,@RequestParam("orderdate") String orderdate,@RequestParam("ordercode") String ordercode,@RequestParam("orderflag") String orderflag) {
		Order order=new Order();
		if(orderdate.equals("5")) {
			session.setAttribute("date", "");
		}else {
			session.setAttribute("date", orderdate);
		}
		
		order.setOrdercode(ordercode);
		order.setOrderflag(orderflag);
		session.setAttribute("order", order);
		return "redirect:orderlist2?star=1";
	}
	
	@RequestMapping("/orderlist2")
	public String orderlist2(HttpSession session,@RequestParam("star") Integer star) {
		PageHelper.startPage(star, 1);
		Order order=(Order) session.getAttribute("order");
		
		List<Order> list=oservice.getOrderByOrderCodeorflag(order.getOrdercode(), order.getOrderflag(),(String)session.getAttribute("date"));
		PageInfo info=new PageInfo(list);
		session.setAttribute("opageinfo2", info);
		
		
		return "pages/ordersys/order/orderlist2";
	}
	
	@RequestMapping("/turn2")
	public String turn2(@RequestParam("pagenum") int  pagenum) {
		return "redirect:orderlist2?star="+pagenum;
	}
	
	
	
}
