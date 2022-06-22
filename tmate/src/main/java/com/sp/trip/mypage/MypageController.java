package com.sp.trip.mypage;

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

@Controller("mypage.mypageController")
@RequestMapping("/mypage/main/*")
public class MypageController {

	@Autowired
	private MypageService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="likeList", method=RequestMethod.GET)
	public String likeList(HttpSession session, Model model,
			@RequestParam(value="page", defaultValue = "1")int current_page,
			HttpServletRequest req) {
		// 찜
		
		String cp = req.getContextPath();
		
		int rows = 6;
		int total_page = 0;
		int dataCount = 0;
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", info.getUserId());

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
				
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}
		if(total_page < current_page ) {
			current_page = total_page;
		}
		
		List<LikeList> list = service.listLike(map);
		String listUrl = cp + "/mypage/main/likeList";
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
			
		return ".mypage.main.likeList";
	}
	
	@RequestMapping(value="deleteList", method=RequestMethod.POST)
	public String deleteList(@RequestParam String roomNum, HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			map.put("memberId", info.getUserId());
			map.put("roomNum",  Integer.parseInt(roomNum));
			service.deleteList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/mypage/main/likeList";
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
