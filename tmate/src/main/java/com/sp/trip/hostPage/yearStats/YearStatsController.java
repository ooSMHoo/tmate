package com.sp.trip.hostPage.yearStats;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.trip.member.SessionInfo;

@Controller("yearStats.yearStatsController")
@RequestMapping("/hostPage/yearStats/*")
public class YearStatsController {
	
	@Autowired
	private YearStatsService service;
	
	@RequestMapping(value="main", method=RequestMethod.GET)
	public String yearStats(
			HttpSession session,
			Model model,
			@RequestParam(defaultValue="") String startDate
			) throws Exception {
		
		if(startDate.equals("")) {
			Calendar cal = Calendar.getInstance();
			startDate = String.format("%tF", cal).substring(0, 4); //2022
		}
		
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hostId", info.getUserId());
		map.put("startDate", startDate); 
		
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
		model.addAttribute("startDate", startDate);

		//통계
		
		
		return ".hostPage.yearStats.main";
	}
	
	@RequestMapping(value = "yRoomstats", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> yRoomstats(
			HttpSession session,
			String startDate
			) throws Exception{
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hostId", info.getUserId());
		map.put("startDate", startDate); 

		
		
		Map<String, Object> model = new HashMap<String, Object>();
		List<YearStats> ys1 = service.lastyPaytotal(map);
		List<YearStats> ys2 = service.thisyPaytotal(map);
		List<YearStats> ys3 = service.lastyResCount(map);
		List<YearStats> ys4 = service.thisyResCount(map);
		model.put("ys1", ys1);
		model.put("ys2", ys2);
		model.put("ys3", ys3);
		model.put("ys4", ys4);
		
		return model;
	}
	
	@RequestMapping(value = "totalASmonth", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> totalASmonth(
			HttpSession session,
			String startDate
			) throws Exception{
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hostId", info.getUserId());
		map.put("startDate", startDate); 
		
		
		Map<String, Object> model = new HashMap<String, Object>();
		List<YearStats> ys5 = service.totalASmonth(map);
		model.put("ys5", ys5);
		
		return model;
	}

}

