package com.sp.trip.hostPage.roomState;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("roomState.roomStateController")
@RequestMapping("/hostPage/roomState/*")
public class RoomStateController {
	
	//@Autowired
	//private MyUtil myUtil;
	
	//@Autowired
	//private RoomStateService service;
	
	@RequestMapping("list")
	public String roomState() {
		return ".hostPage.roomState.list";
	}
}
