package com.oracle.handler;

import java.awt.print.Pageable;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;

@Controller
public class FrameHandler {

	@RequestMapping("/frame/{path}")
	public String pathHandler(@PathVariable("path") String path) {
		
		return "/frame/"+path;
	}
}
