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
	
	@RequestMapping(value="bookingList", method=RequestMethod.GET)
	public String bookingList() {
		return ".hostPage.main.bookingList";
	}
	
	@RequestMapping(value="yearStats", method=RequestMethod.GET)
	public String yearStats() {
		return ".hostPage.main.yearStats";
	}
	
	@RequestMapping(value="monthStats", method=RequestMethod.GET)
	public String monthStats() {
		return ".hostPage.main.monthStats";
	}
	
	@RequestMapping(value="paymentList", method=RequestMethod.GET)
	public String paymentList() {
		return ".hostPage.main.paymentList";
	}
	
	@RequestMapping(value="reviewList", method=RequestMethod.GET)
	public String reviewList() {
		return ".hostPage.main.reviewList";
	}
	
	@RequestMapping(value="roomState", method=RequestMethod.GET)
	public String roomState() {
		return ".hostPage.main.roomState";
	}
	
	@RequestMapping(value="roomCal", method=RequestMethod.GET)
	public String roomCal() {
		return ".hostPage.main.roomCal";
	}
	
	@RequestMapping(value="calendarMain", method=RequestMethod.GET)
	public String calendarMain() {
		return ".hostPage.main.calendarMain";
	}
	
	@RequestMapping(value="calendarWrite", method=RequestMethod.GET)
	public String calendarWrite() {
		return ".hostPage.main.calendarWrite";
	}
}
