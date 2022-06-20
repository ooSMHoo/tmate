package com.sp.trip.hostPage.yearStats;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.trip.member.SessionInfo;

@Controller("yearStats.yearStatsController")
@RequestMapping("/hostPage/yearStats/*")
public class YearStatsController {
	
	@Autowired
	private YearStatsService service;
	
	@RequestMapping(value="main", method=RequestMethod.GET)
	public String yearStats(
			HttpSession session,
			Model model
			) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hostId", info.getUserId());
		
		//예약총건
		int restotal = service.ycountRestotal(map);
		//취소 총건
		int conceltotal = service.ycountCancel(map);
		//예약 총금액
		String totalPay = service.ytotalPay(map);
		//취소 총금액
		String conceltotalPay = service.ytotalpayCancel(map);
		
		model.addAttribute("restotal", restotal);
		model.addAttribute("conceltotal", conceltotal);
		model.addAttribute("totalPay", totalPay);
		model.addAttribute("conceltotalPay", conceltotalPay);
		
		
		return ".hostPage.yearStats.main";
	}
}
