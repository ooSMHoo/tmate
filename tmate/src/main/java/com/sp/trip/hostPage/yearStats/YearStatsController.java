package com.sp.trip.hostPage.yearStats;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("yearStats.yearStatsController")
@RequestMapping("/hostPage/yearStats/*")
public class YearStatsController {
	
	@RequestMapping(value="main", method=RequestMethod.GET)
	public String yearStats() {
		return ".hostPage.yearStats.main";
	}
}
