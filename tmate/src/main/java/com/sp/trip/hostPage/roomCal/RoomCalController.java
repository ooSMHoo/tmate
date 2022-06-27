package com.sp.trip.hostPage.roomCal;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
			String startDate,
			String endDate,
			Model model
			) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Calendar cal = Calendar.getInstance();
		if(startDate == null || endDate == null) {
			startDate = String.format("%tF", cal);
			
			cal.add(Calendar.DATE, 6);
			endDate = String.format("%tF", cal);
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sdf.parse(startDate);
		cal.setTime(date);
		int days[] = new int[7];
		String weeks[] = new String[7];
		for(int i=0; i<7; i++) {
			days[i] = cal.get(Calendar.DATE);
			weeks[i] = String.format("%tA", cal).substring(0, 1);
			cal.add(Calendar.DATE, 1);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hostId", info.getUserId());
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		List<RoomCal> list = service.roomCalList(map);
		List<String> roomNames = new ArrayList<String>();
		for(int i=0; i<list.size(); i++) {
			if(i == 0) {
				roomNames.add(list.get(i).getRoomName());
				continue;
			}
			
			if(! roomNames.get(roomNames.size()-1).equals(list.get(i).getRoomName())) {
				roomNames.add(list.get(i).getRoomName());
			}
		}
		
		String out = "";
		int i;
		boolean flag;
		for(String roomName : roomNames) {
			out += "<tr>";
			out += "<td>" + roomName + "</td>";
			
			flag = false;
			i = 0;
			jump:
			for(RoomCal dto : list) {
				if(dto.getRoomName().equals(roomName)) {
					flag = true;
					for(; i< days.length; i++) {
						if(days[i] == dto.getStartDay()) {
							out += "<td colspan='"+dto.getPeriod()+"' class='table-danger table-bordered'>"+dto.getResName() +"</td>";
							if(dto.getPeriod() > 1) {
								i=i+dto.getPeriod();
								continue jump;
							}
						} else {
							out += "<td>&nbsp;</td>";
						}
					}
				} else {
					if( flag ) {
						if(i < 7) {
							for(int n=i; n<7; n++) {
								out += "<td >&nbsp;</td>";
							}
						}
						break;
					}
				}
			}
			
			if(roomName.equals(roomNames.get(roomNames.size()-1))) {
				if(i < 7) {
					for(int n=i; n<7; n++) {
						out += "<td >&nbsp;</td>";
					}
				}
			}
			
			out += "</tr>";
		}
		
		String cp = req.getContextPath();

		String listUrl = cp + "/hostPage/roomCal/list";
		
	
		model.addAttribute("list", list);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		model.addAttribute("days", days);
		model.addAttribute("weeks", weeks);
		model.addAttribute("roomNames", roomNames);
		model.addAttribute("out", out);
		model.addAttribute("listUrl", listUrl);
		
		return ".hostPage.roomCal.list";
	}

}
