package com.oracle.handler;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.oracle.service.UserService;
import com.oracle.vo.User;

@Controller
@SessionAttributes(names="user")
public class UserHandler {
	
	@Autowired
	UserService service;
	
	@RequestMapping("/login")
	public String login(HttpSession session,Map<String,Object> map,User user) {
		session.setAttribute("date", new Date());
		if(service.selectBynameandpwd(user.getLoginname(), user.getLoginpwd())!=null) {
			map.put("user", service.selectBynameandpwd(user.getLoginname(), user.getLoginpwd()));
			return "index";
		}else {
			return "redirect:/";
		}
	}

	@RequestMapping("/")
	public String defaultAction() {
		System.out.println("ƒ¨»œ“≥¡À£ª ");
		return "login";
	}
	
	@RequestMapping("/{path}")
	public String defaultPath(@PathVariable("path") String path) {		
		return path;
	}
	
	
}
