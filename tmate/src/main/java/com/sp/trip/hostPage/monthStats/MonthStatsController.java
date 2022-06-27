package com.sp.trip.hostPage.monthStats;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.trip.member.SessionInfo;

@Controller("monthStats.monthStatsController")
@RequestMapping("/hostPage/monthStats/*")
public class MonthStatsController {
	
	@Autowired
	private MonthStatsService service;
	
	@RequestMapping(value="main", method=RequestMethod.GET)
	public String monthStats(
			HttpSession session,
			Model model,
			String startDate
			) throws Exception{
		
		
		Calendar cal = Calendar.getInstance();
		if(startDate == null ) {
			startDate = String.format("%tF", cal).substring(0, 7);
		}
		
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hostId", info.getUserId());
		map.put("startDate", startDate); 
		
		
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
		model.addAttribute("startDate", startDate);
		
		
		//통계 
		//객실별 판매상세 
		List<MonthStats> ms = service.mselDetaile(map);
		model.addAttribute("ms", ms);
		
		return ".hostPage.monthStats.main";
	}


	@ResponseBody
	@RequestMapping(value="mtotalpay", method=RequestMethod.GET)
	public Map<String, Object> mtotalpay(
			HttpSession session,
			String startDate
			) throws Exception{
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hostId", info.getUserId());
		map.put("startDate", startDate); 
		
		Map<String, Object> model = new HashMap<String, Object>();
		List<MonthStats> ms = service.mselDetaile(map);
		model.put("ms", ms);
		
		return model;
	}
	
	@ResponseBody
	@RequestMapping(value="mCountRes", method=RequestMethod.GET)
	public Map<String, Object> mCountRes(
			HttpSession session,
			String startDate
			) throws Exception{
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hostId", info.getUserId());
		map.put("startDate", startDate); 
		
		Map<String, Object> model = new HashMap<String, Object>();
		List<MonthStats> ms2 = service.mResCount(map);
		model.put("ms2", ms2);
		
		return model;
	}
	
	@ResponseBody
	@RequestMapping(value="totalASday", method=RequestMethod.GET)
	public Map<String, Object> totalASday(
			HttpSession session,
			String startDate
			) throws Exception{
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hostId", info.getUserId());
		map.put("startDate", startDate); 
		
		Map<String, Object> model = new HashMap<String, Object>();
		List<MonthStats> ms3 = service.totalASday(map);
		model.put("ms3", ms3);
		
		return model;
	}

}
