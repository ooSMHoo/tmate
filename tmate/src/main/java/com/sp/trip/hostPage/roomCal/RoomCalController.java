package com.sp.trip.hostPage.roomCal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("roomCal.roomCalController")
@RequestMapping("/hostPage/roomCal/*")
public class RoomCalController {
	
	@RequestMapping("list")
	public String roomCal() throws Exception {
		
		return ".hostPage.roomCal.list";
	}

}
