package com.sp.trip.hostPage.monthStats;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.trip.member.SessionInfo;

@Controller("monthStats.monthStatsController")
@RequestMapping("/hostPage/monthStats/*")
public class MonthStatsController {
	
	@Autowired
	private MonthStatsService service;
	
	@RequestMapping(value="main", method=RequestMethod.GET)
	public String monthStats(
			HttpSession session,
			Model model
			) throws Exception{
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hostId", info.getUserId());
		
		//예약총건
		int restotal = service.mcountRestotal(map);
		//입실 총건
		int cintotal = service.mcountCintotal(map);
		//취소 총건
		int conceltotal = service.mcountCancel(map);
		//예약 총금액
		String totalPay = service.mtotalPay(map);
		//취소 총금액
		String conceltotalPay = service.mtotalpayCancel(map);
		
		model.addAttribute("restotal", restotal);
		model.addAttribute("cintotal", cintotal);
		model.addAttribute("conceltotal", conceltotal);
		model.addAttribute("totalPay", totalPay);
		model.addAttribute("conceltotalPay", conceltotalPay);
		
		
		return ".hostPage.monthStats.main";
	}
}
