package com.sp.trip.reservationList;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.trip.member.SessionInfo;

@Controller("reservationList.reservationListController")
@RequestMapping("/mypage/*")
public class ReservationListContorller {
	@Autowired
	ReservationListService service;
	
	@RequestMapping(value="reservationList", method=RequestMethod.GET)
	public String reservationList(HttpSession session, Model model) {
		// 포인트
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		List<ReservationList> list = service.readRev(info.getUserId());

		model.addAttribute("list", list);	

		return ".mypage.main.reservationList";
	}
	
	@RequestMapping(value="reservationInfo", method=RequestMethod.GET)
	public String reservationInfo(HttpSession session, Model model) {
		// 포인트
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		List<ReservationList> list = service.readRev(info.getUserId());

		model.addAttribute("list", list);	

		return ".mypage.main.reservationInfo";
	}
}
