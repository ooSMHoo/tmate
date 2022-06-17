package com.sp.trip.hostPage.bookingList;

import java.net.URLDecoder;
import java.net.URLEncoder;
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

@Controller("bookingList.bookingListController")
@RequestMapping("/hostPage/bookingList/*")
public class BookingListController {
	@Autowired
	private BookingListService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("list")
	public String bookingList(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "resName") String condition,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "") String option,
			HttpSession session,
			HttpServletRequest req,
			Model model
			) throws Exception{
		
		String cp = req.getContextPath();

		int rows = 6;
		int total_page = 0;
		int dataCount = 0;
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");

		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("option", option);
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
		
		
		List<BookingList> list = service.bookingList(map);
	
		
		String query = "rows="+rows;
		String listUrl = cp + "/hostPage/bookingList/list";
		
		if (keyword.length() != 0) {
			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}
		listUrl += "?" +query;
		
		if(option.length() != 0) {
			if(query.length() != 0) {
				query = query + "&option="+option;
			}else {
				query = "option="+option;
			}
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("option", option);

		return ".hostPage.bookingList.list";
	}
	
// 회원상세 정보 : AJAX-Text 응답
	@RequestMapping(value = "detaile", method = RequestMethod.POST)
	public String detaileBooking(@RequestParam int resNum, 
			Model model
			) throws Exception {
		
		BookingList dto = service.detaileBooking(resNum);

		model.addAttribute("dto", dto);	

		return "/hostPage/bookingList/detaile";
	}
}
