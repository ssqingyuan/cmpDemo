package com.oracle.handler;

import java.sql.Date;
import java.util.ArrayList;
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
import com.oracle.vo.Code;
import com.oracle.vo.Parts;
import com.oracle.vo.PartsRep;
import com.oracle.vo.PartsRepBill;
import com.oracle.vo.User;

@Controller
@RequestMapping("/pages/partssys/partsrep")
@SessionAttributes(names="repPageInfo")
public class PartsrepHandler {
	
	@Autowired
	PartsRepertoryService prservice;
	@Autowired
	CodeService cservice;
	@Autowired
	PartsService pservice;
	@Autowired
	PartsRepBillService prbservice;
	

	@RequestMapping("/{path}")
	public String pathHandler(@PathVariable("path") String path) {
		
		return "pages/partssys/partsrep/"+path;
	}
	
	@RequestMapping("/partsreplist/{star}")
	public String partsreplist(Map<String,Object> map,@PathVariable("star") Integer star) {
		PageHelper.startPage(star,2);
		List<PartsRep> list=prservice.getAll();
		PageInfo<PartsRep> info=new PageInfo<PartsRep>(list);
		map.put("repPageInfo", info);
		return "pages/partssys/partsrep/partsreplist";
	}
	@RequestMapping("/turn")
	public String turn(@RequestParam("pagenum") int  pagenum) {
		
		return "redirect:/pages/partssys/partsrep/partsreplist/"+pagenum;
	}
	
	@RequestMapping("/search")
	public  String search(HttpSession session,@RequestParam("id") Integer id,@RequestParam("name") String name) {
		PartsRep pr=new PartsRep();
		pr.setPartsid(id);
		pr.setPartsname(name);
		
		session.setAttribute("partsrep", pr);
		return "redirect:partsreplist2/1";
	}
	
	@RequestMapping("/partsreplist2/{star}")
	public String partlist2(HttpSession session,Map<String,Object> map,@PathVariable("star") Integer star) {
		
		PartsRep pr=(PartsRep) session.getAttribute("partsrep");
		
		List<PartsRep> list=new ArrayList<PartsRep>();
		PageHelper.startPage(star, 1);
		if(pr.getPartsid()!=null) {
			list=prservice.getnumByid(pr.getPartsid());
		}else {
			
			list=prservice.getnumByname(pr.getPartsname());
			
		}
		PageInfo<PartsRep> info=new PageInfo<PartsRep>(list);
		map.put("repPageInfo2", info);
		return "pages/partssys/partsrep/partsreplist2";
	}
	//��ѯ�����ת
	@RequestMapping("/turn2")
	public String turn2(@RequestParam("pagenum") int  pagenum) {
		
	return "redirect:/pages/partssys/partsrep/partsreplist2/"+pagenum;
	}
	
	@RequestMapping("/getprb")
	@ResponseBody
	public PartsRep getPartsrepBypartsname(@RequestParam("partsname") String partsname) {
		return prservice.getPartRepByname(partsname);
	}
	
	
	@RequestMapping("/getBytype")
	@ResponseBody
	public List<Code> getBytype(HttpSession session,@RequestParam("type") String type){
		
		if(type.equals("out")) {
			session.setAttribute("flag", "O");
		}else {
			session.setAttribute("flag", "I");
		}
		return cservice.getBytype(type);
	}
	@RequestMapping("/getAll")
	@ResponseBody
	public List<Parts> getAll(){
		return pservice.getAll();
	}
	
	@RequestMapping("/insert")
	public String insertPartsrepbill(@RequestParam("billcount") Integer count,@RequestParam("partsname") String partsname,@RequestParam("name") String name,HttpSession session,PartsRepBill prb) {
		prb.setBillflag((String) session.getAttribute("flag"));
		prb.setBilltype(cservice.getByname(name).getCode());
		prb.setPartsid(pservice.getBypartsname(partsname).getPartsid());
		prb.setBilluser(((User) session.getAttribute("user")).getUserid());
		prbservice.insertPartsrepbill(prb);
		if(((String) session.getAttribute("flag")).equals("O")) {
		prservice.updatenumByid(pservice.getBypartsname(partsname).getPartsid(), count);
		return "redirect:partsreplist/1";
		}else {
		prservice.updatenumByid2(pservice.getBypartsname(partsname).getPartsid(), count);
		return "redirect:partsreplist/1";
		}
		
		
	}
	
}
