package com.sp.trip.hostPage.reviewList;

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

@Controller("reviewList.reviewListController")
@RequestMapping("/hostPage/reviewList/*")
public class ReviewListController {
	
	@Autowired
	private ReviewListService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("list")
	public String reviewList(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpSession session,
			HttpServletRequest req,
			Model model
			) throws Exception{
		
		String cp = req.getContextPath();

		int rows = 3;
		int total_page = 0;
		int dataCount = 0;
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hostId", info.getUserId());
		
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
		
		List<ReviewList> rl = service.reviewList(map);
		
		String listUrl = cp + "/hostPage/reviewList/list?rows="+rows;
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("rl", rl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		
		return ".hostPage.reviewList.list";
	}
	
	@RequestMapping(value = "detaile", method = RequestMethod.POST)
	public String answerReview(
			@RequestParam int revNum,
			Model model
			) throws Exception{
		
		ReviewList dto = service.readRevAnswer(revNum);
		model.addAttribute("dto", dto);
		
		return "/hostPage/reviewList/detaile";
		
	}
	
	@RequestMapping(value = "updateAnswer", method = RequestMethod.POST)
	public String updateAnswer(
			@RequestParam String page,
			@RequestParam int revNum,
			ReviewList dto
			) throws Exception{
		try {
			service.updateAnswer(dto, revNum);
		} catch (Exception e) {

		}
		return "redirect:/hostPage/reviewList/list?page="+page;
	}
	
	@RequestMapping(value = "deleteAnswer", method = RequestMethod.POST)
	public String deleteAnswer(
			@RequestParam String page,
			@RequestParam int revNum,
			@RequestParam(defaultValue = "") String resAnswer
			) throws Exception{
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("revNum", revNum);
			map.put("resAnswer", resAnswer);
			service.deleteAnswer(map);
		} catch (Exception e) {

		}
		return "redirect:/hostPage/bookingList/list?page="+page;
	}
	
	
	
}
