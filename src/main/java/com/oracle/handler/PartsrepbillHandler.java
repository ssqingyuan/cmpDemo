package com.oracle.handler;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
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
import com.oracle.service.CodeService;
import com.oracle.service.PartsRepBillService;
import com.oracle.service.PartsRepertoryService;
import com.oracle.service.PartsService;
import com.oracle.service.UserService;
import com.oracle.vo.Code;
import com.oracle.vo.Parts;
import com.oracle.vo.PartsRep;
import com.oracle.vo.PartsRepBill;
import com.oracle.vo.User;

@Controller
@RequestMapping("/pages/partssys/partsrepbill")
@SessionAttributes(names="prbPageInfo")
public class PartsrepbillHandler {
	
	@Autowired
	PartsRepBillService prbservice;
	@Autowired
	CodeService cservice;
	@Autowired
	PartsService pservice;
	@Autowired
	UserService uservice;
		

	@RequestMapping("/{path}")
	public String pathHandler(@PathVariable("path") String path) {
		return "pages/partssys/partsrepbill/"+path;
	}
	
	@RequestMapping("/partsrepbilllist/{star}")
	public String partsrepbilllist(HttpSession session,Map<String,Object> map,@PathVariable("star") Integer star) {
		PageHelper.startPage(star, 5);
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		list=prbservice.getAll();
		
		for(Map<String,Object> maps:list) {
			Code code=new Code();
			code=cservice.selectByPrimaryKey((String) maps.get("billflag"));
			maps.put("billflag", code.getName());
		}
		PageInfo<Map<String,Object>> info=new PageInfo<Map<String,Object>>(list);
		map.put("prbPageInfo", info);
		
		return "pages/partssys/partsrepbill/partsrepbilllist";
	}
	
	@RequestMapping("/turn")
	public String turn2(@RequestParam("pagenum") int  pagenum) {
		
		return "redirect:/pages/partssys/partsrepbill/partsrepbilllist/"+pagenum;
	}
	
	@RequestMapping("/getBytype")
	@ResponseBody
	public List<Code> getBytype(@RequestParam("type") String type){
		
		return cservice.getBytype(type);
	}
	
	@RequestMapping("/search")
	public String search(HttpSession session,@RequestParam("type") String type,@RequestParam("flag") String flag,@RequestParam("partsname") String partsname) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("type", type);
		map.put("partsname", partsname);
//		map.put("date", date);
		session.setAttribute("mmap", map);
		return "redirect:partsrepbilllist2/1";
	}
	
	@RequestMapping("/partsrepbilllist2/{star}")
	public String partsrepbilllist2(HttpSession session,Map<String,Object> map,@PathVariable("star") Integer star) {
		PageHelper.startPage(star, 5);
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		Map<String,Object> mapx=(Map<String, Object>) session.getAttribute("mmap");
		list=prbservice.getBymany(mapx);
		
		for(Map<String,Object> maps:list) {
			Code code=new Code();
			code=cservice.selectByPrimaryKey((String) maps.get("billflag"));
			maps.put("billflag", code.getName());
		}
		PageInfo<Map<String,Object>> info=new PageInfo<Map<String,Object>>(list);
		map.put("prbPageInfo", info);
		
		return "pages/partssys/partsrepbill/partsrepbilllist2";
	}
	
	@RequestMapping("/turn2")
	public String turn(@RequestParam("pagenum") int  pagenum) {
		
		return "redirect:/pages/partssys/partsrepbill/partsrepbilllist2/"+pagenum;
	}
}
