package com.sp.trip.point;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.trip.member.SessionInfo;

@Controller("point.pointController")
@RequestMapping("/mypage/*")
public class PointController {

	@Autowired
	PointService service;
	
	@RequestMapping(value="point", method=RequestMethod.GET)
	public String point(HttpSession session, Model model) {
		// 포인트
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		List<Point> list = service.readPoint(info.getUserId());
		int totalPoint = 0;
		for(Point p: list) {
			totalPoint += p.getPointQuant();
		}
		model.addAttribute("list", list);	
		model.addAttribute("total", totalPoint);
		
		return ".mypage.main.point";
	}
	
	// insert
	@RequestMapping(value="main/point", method=RequestMethod.POST)
	public String pointSubmit(HttpSession session, Point dto) throws Exception{
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		try {
			dto.setMemberId(info.getUserId());
			service.insertPoint(dto);
		} catch (Exception e) {
		}
		
		return "redirect:/mypage/point";
	}
	
	
}
