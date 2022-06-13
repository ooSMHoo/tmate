package com.sp.trip.mypage;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.trip.member.SessionInfo;



@Controller("mypage.mypageController")
@RequestMapping("/mypage/*")
public class MypageController {

	@Autowired
	private MypageService service;
	
	@RequestMapping(value="reservationInfo", method=RequestMethod.GET)
	public String reservation() {
		// 예약관리
		return ".mypage.main.reservationInfo";
	}
	
	@RequestMapping(value="reservationList", method=RequestMethod.GET)
	public String reservationList() {
		// 예약관리-상세
		return ".mypage.main.reservationList";
	}
	
	@RequestMapping(value="likeList", method=RequestMethod.GET)
	public String likeList() {
		// 찜
		return ".mypage.main.likeList";
	}	
	
	@RequestMapping(value="friend", method=RequestMethod.GET)
	public String friend() {
		// 친구
		return ".mypage.main.friend";
	}
	
	@RequestMapping(value="reviewList", method=RequestMethod.GET)
	public String reviewList() {
		// 리뷰
		return ".mypage.main.reviewList";
	}
	
	@RequestMapping(value="point", method=RequestMethod.GET)
	public String point() {
		// 포인트
		return ".mypage.main.point";
	}
	
	@RequestMapping(value="update", method=RequestMethod.GET)
	public String update(HttpSession session, Model model) {
		// 회원정보 수정
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Mypage dto = service.readMypage(info.getUserId());
		model.addAttribute("dto", dto);		
		return ".mypage.main.update";
	}

	
	

	
}
