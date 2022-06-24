package com.sp.trip.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.trip.common.MyUtil;
import com.sp.trip.member.SessionInfo;

@Controller("review.reviewController")
@RequestMapping("/mypage/main/*")
public class ReviewController {
	
	@Autowired
	ReviewService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="reviewMain")
	public String main(HttpSession session, Model model) throws Exception{
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", info.getUserId());
		
		
		List<Review> reviewMain = service.reviewMain(map);
		model.addAttribute("reviewMain", reviewMain);
			
		return ".mypage.main.reviewMain";
	}
	
	@RequestMapping(value="reviewList")
	public String reviewList(HttpSession session, Model model,
			@RequestParam(value="page", defaultValue = "1")int current_page,
			@RequestParam String revNum,
			HttpServletRequest req) throws Exception{
		
		int rows = 6;
		int total_page = 0;
		int dataCount = 0;
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", info.getUserId());
		map.put("revNum", revNum);

		
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

		List<Review> list = service.listReview(map);
		
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("revNum", revNum);
	
		return "mypage/main/reviewList";
	}
	

	
}
