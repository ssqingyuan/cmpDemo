package com.oracle.handler;

import java.util.ArrayList;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oracle.service.OrderDetailService;
import com.oracle.service.PartsRepBillService;
import com.oracle.service.PartsRepertoryService;
import com.oracle.service.PartsService;
import com.oracle.vo.Parts;

@Controller
@RequestMapping("/pages/partssys/parts")
@SessionAttributes(names= {"pageinfo","partsedit"})
public class PartHandler {

	@Autowired
	PartsService service;
	@Autowired
	OrderDetailService odservice;
	@Autowired
	PartsRepBillService prservice;
	@Autowired
	PartsRepertoryService prtservice;
	
	
	
	
	@RequestMapping("/{path}")
	public String pathHandler(@PathVariable("path") String path) {
		return "pages/partssys/parts/"+path;
	}
	
	
	
	/*
	 * 编辑更新
	 */
	@RequestMapping("/partsedit")
	public String partsedit(Map<String,Object> map,@RequestParam("partsid") Integer partsid) {
		Parts p=service.selectByPrimaryKey(partsid);
		
		map.put("partsedit", p);
		return "/pages/partssys/parts/partsedit";
	}
	
	@RequestMapping("/partsedit1")
	public String partsedit1(HttpSession session,Parts record){
		
		Parts p=(Parts) session.getAttribute("partsedit");
		record.setPartsid(p.getPartsid());
		service.updateByPrimaryKeySelective(record);
		return "redirect:partslist/1";
	}
	
	
	/*
	 * 添加配件
	 */
//	@RequestMapping("/partsadd")
//	public String partsadd(){
//		return "/pages/partssys/parts/partsadd";
//	}
	@RequestMapping("/partsaddb")
	public String partsadd1(Parts record) {
	   
		service.saveParts(record);
		
		return "redirect:partslist/1";
	}
	
	
	/*
	 * 模糊查询
	 */
	@RequestMapping("/search")
	public  String search(HttpSession session,Map<String,Object> map,@RequestParam("sspartsname") String partsname) {
		session.setAttribute("ss", partsname);
		return "redirect:partslist2/1";
	}
	//查询后的表单
	@RequestMapping("/partslist2/{star}")
	public String partlist2(HttpSession session,Map<String,Object> map,@PathVariable("star") Integer star) {
		String partsname=(String) session.getAttribute("ss");
		List<Parts> list=new ArrayList<Parts>();
		PageHelper.startPage(star, 1);
		list=service.getPartsBypartsname(partsname);
		PageInfo<Parts> info=new PageInfo<Parts>(list);
		map.put("pageInfo2", info);
		return "pages/partssys/parts/partslist2";
	}
	//查询后的跳转
		@RequestMapping("/turn2")
		public String turn2(@RequestParam("pagenum") int  pagenum) {
			
		return "redirect:/pages/partssys/parts/partslist2/"+pagenum;
		}
	
		
		
		
	@RequestMapping("/partslist/{star}")
	public String partlist(Map<String,Object> map,@PathVariable("star") Integer star) {
		
		List<Parts> list=new ArrayList<Parts>();
		PageHelper.startPage( star, 5);
		list=service.getAll();
		
		PageInfo<Parts> info=new PageInfo<Parts>(list);
		map.put("pageInfo", info);
		return "pages/partssys/parts/partslist";
	}
	@RequestMapping("/turn")
	public String turn(@RequestParam("pagenum") int  pagenum) {
		
		return "redirect:/pages/partssys/parts/partslist/"+pagenum;
	}
	
	
	         
	/*
	 * 删除配件
	 */
	@RequestMapping("/partdelete")
	public String partsdelete(@RequestParam("partsid") int partsid,@RequestParam("pagenum") int pagenum) {
		prservice.deleteByPartsid(partsid);
		prtservice.deleteByPartsid(partsid);
		odservice.deleteByPartsid(partsid);
		service.partdelete(partsid);
		return "redirect:partslist/"+pagenum;
	}
}
