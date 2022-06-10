package com.sp.trip.hostPage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("hostPage.hostPageController")
@RequestMapping("/hostPage/*")
public class hostPageController {
	
	@RequestMapping(value="home", method=RequestMethod.GET)
	public String homeMain() {
		return ".hostPage.main.home";
	}
}
