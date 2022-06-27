package com.sp.trip;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	private final LodgingListService service;
	
	@Autowired
	public HomeController(LodgingListService service) {
		this.service = service;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		List<LodgingDTO> list = service.mainLodgingList();
		
		model.addAttribute("list", list);
		
		return ".main.main";
	}
}
