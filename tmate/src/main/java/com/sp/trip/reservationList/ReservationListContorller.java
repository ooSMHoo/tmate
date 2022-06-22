package com.sp.trip.reservationList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.trip.common.MyUtil;
import com.sp.trip.member.SessionInfo;

@Controller("reservationList.reservationListContorller")
@RequestMapping("/mypage/main/*")

public class ReservationListContorller {
	@Autowired
	ReservationListService service;
	
	@Autowired
	private MyUtil myUtil;
	///////////////////////reservationList
	@RequestMapping(value="reservationList", method=RequestMethod.GET)
	public String reservationList(HttpSession session, Model model,
			@RequestParam(value="page", defaultValue = "1")int current_page,
			HttpServletRequest req) {
		// 예약내역
				
		String cp = req.getContextPath();
		
		int rows = 6;
		int total_page = 0;
		int dataCount = 0;
				
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", info.getUserId());
		
				
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}
		if(total_page < current_page ) {
			current_page = total_page;
		}
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<ReservationList> list = service.listRev(map);
		String listUrl = cp + "/mypage/main/reservationList";
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		return ".mypage.main.reservationList";
	}

	
	@RequestMapping(value="reservationInfo", method=RequestMethod.GET)
	public String reservationInfo(HttpSession session, Model model, @RequestParam int resNum) {
		// 예약상세
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", info.getUserId());
		map.put("resNum", resNum);
		
		ReservationInfo dto = service.readRevInfo(map);
		
		model.addAttribute("dto", dto);
			
		return ".mypage.main.reservationInfo";
	}
}
