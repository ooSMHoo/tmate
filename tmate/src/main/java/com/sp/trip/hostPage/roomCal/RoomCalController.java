package com.sp.trip.hostPage.roomCal;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.trip.member.SessionInfo;

@Controller("roomCal.roomCalController")
@RequestMapping("/hostPage/roomCal/*")
public class RoomCalController {
	@Autowired
	private RoomCalService service;
	
	
	@RequestMapping("list")
	public String roomCal(
			HttpSession session,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hostId", info.getUserId());
		
		List<RoomCal> list = service.roomCalList(map);
		
		String cp = req.getContextPath();

		String listUrl = cp + "/hostPage/roomCal/list";
		
	
		model.addAttribute("list", list);
		model.addAttribute("listUrl", listUrl);
		
		
		return ".hostPage.roomCal.list";
	}

}
