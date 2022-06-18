package com.sp.trip.mypage;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping(value="likeList", method=RequestMethod.GET)
	public String likeList(HttpSession session, Model model) {
		// 찜
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		List<LikeList> list = service.listLike(info.getUserId());
		
		model.addAttribute("list", list);	
		
		return ".mypage.main.likeList";
	}
	
	@RequestMapping(value="deleteList", method=RequestMethod.POST)
	public String deletelist(@PathVariable String roomNum) throws Exception {

		try {
			service.deleteLike(Integer.parseInt(roomNum));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/mypage/likeList"; 
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
	
	@RequestMapping(value="update", method=RequestMethod.GET)
	public String updateForm(HttpSession session, Model model) {
		// 회원정보 수정
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Mypage dto = service.readMypage(info.getUserId());
		model.addAttribute("dto", dto);	

		return ".mypage.main.update";
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(HttpSession session,
			@RequestParam Map<String, Object> paramMap, Model model) throws Exception {
		// 회원정보 수정
		SessionInfo info = (SessionInfo) session.getAttribute("member");
			
		paramMap.put("memberId", info.getUserId());
		
		try {
			service.updateMypage(paramMap);	
			
		} catch (Exception e) {
		}
				
		return "redirect:/mypage/update";
	}	

	@RequestMapping(value="update2", method=RequestMethod.POST)
	public String update2(HttpSession session,
			@RequestParam Map<String, Object> paramMap, Model model) throws Exception {
		// 회원정보 수정
		SessionInfo info = (SessionInfo) session.getAttribute("member");
			
		paramMap.put("memberId", info.getUserId());
		
		try {
			service.updateMypage2(paramMap);	
			
		} catch (Exception e) {
		}
				
		return "redirect:/mypage/update";
	}	
	
	

	
}
