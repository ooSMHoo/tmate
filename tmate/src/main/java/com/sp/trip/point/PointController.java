package com.sp.trip.point;

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

@Controller("point.pointController")
@RequestMapping("/mypage/main/*")
public class PointController {

	@Autowired
	PointService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="point", method=RequestMethod.GET)
	public String point(@RequestParam(value="page", defaultValue = "1") int current_page,
					HttpServletRequest req,
					HttpSession session, Model model) throws Exception {
		// 포인트
		String cp = req.getContextPath();
		
		int rows = 5;
		int total_page = 0;
		int dataCount = 0;
			
		SessionInfo info = (SessionInfo)session.getAttribute("member"); 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", info.getUserId());
		
		
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}
		if(total_page < current_page ) {
			current_page = total_page;
		}
		
		int start = (current_page -1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
			
		List<Point> list = service.listPoint(map);
		
		int totalPoint = 0;
		for(Point p: list) {
			totalPoint += p.getPointQuant();
		}
		map.put("total", totalPoint);
				
		String listUrl = cp + "/mypage/main/point";
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);	
		model.addAttribute("total", totalPoint);		
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
	
		return ".mypage.main.point";
	}
	
	// insert
	@RequestMapping(value="point", method=RequestMethod.POST)
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
