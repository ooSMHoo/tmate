package com.sp.trip.hostPage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.trip.member.SessionInfo;

@Controller("hostPage.hostPageController")
@RequestMapping("/hostPage/*")
public class hostPageController {
	@Autowired
	private HostPageService service;
	
	@RequestMapping(value="home", method=RequestMethod.GET)
    public String homeMain(
    		HttpSession session,
			Model model
    		)throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hostId", info.getUserId());

		int total = service.countTotalRoom(map);
		int restotal = service.countResRoom(map);
		
		model.addAttribute("total", total);
		model.addAttribute("restotal", restotal);
		
		//오늘 예약자 명당
		List<HostPage> hp = service.todayRes(map);

		model.addAttribute("hp", hp);
		
		//오늘 예약한 건수 
		int todayRes = service.todayResOk(map);
		model.addAttribute("todayRes", todayRes);
		
		//오늘 취소된 예약건수
		int todayCancel = service.todayCancel(map);
		model.addAttribute("todayCancel", todayCancel);
		
		//오늘 총 판매금액 현황
		String todayPay = service.todayPay(map);
		model.addAttribute("todayPay", todayPay);
		
		String todayrCinPay = service.todayrCinPay(map);
		model.addAttribute("todayrCinPay", todayrCinPay);
		
        return ".hostPage.main.home";
    }

	
	
}
