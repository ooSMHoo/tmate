package com.sp.trip.hostPage.calendar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("calendar.calendarController")
@RequestMapping("/hostPage/calendar/*")
public class CalendarController {
	
	@RequestMapping(value="main", method=RequestMethod.GET)
	public String calendarMain() {
		return ".hostPage.calendar.main";
	}
	
	@RequestMapping(value="write", method=RequestMethod.GET)
	public String calendarWrite() {
		return ".hostPage.calendar.write";
	}
}
