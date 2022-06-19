package com.sp.trip.hostPage.monthStats;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("monthStats.monthStatsController")
@RequestMapping("/hostPage/monthStats/*")
public class MonthStatsController {
	
	@RequestMapping(value="main", method=RequestMethod.GET)
	public String monthStats() {
		return ".hostPage.monthStats.main";
	}
}
