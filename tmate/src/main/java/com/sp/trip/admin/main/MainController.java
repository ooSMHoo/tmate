package com.sp.trip.admin.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.trip.admin.memberManage.Member;
import com.sp.trip.common.MyUtil;

@Controller("admin.mainController")
public class MainController {
	@Autowired
	private MainService service;
	
	@Autowired
	@Qualifier("myUtilGeneral")
	private MyUtil myUtil;
	
	@RequestMapping(value="/admin/main")
	public String method(HttpServletRequest req,
			Model model) {
		// 대기 리스트
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mhSign", "0");

		int start = 1;
		int end = 10;
		map.put("start", start);
		map.put("end", end);

		// 호스트 리스트
		List<Member> list = service.listHost(map);

		model.addAttribute("list", list);
		
		
		// 호스트, 고객, 숙소 숫자
		int allHost = service.dataCountAllHost(map);
		int allMember = service.dataCountAllMember(map);
		int allHouse = service.dataCountAllHouse(map);
		
		model.addAttribute("allHost", allHost);
		model.addAttribute("allMember", allMember);
		model.addAttribute("allHouse", allHouse);
		
		int allReport = service.dataCountAllReport(map);
		
		model.addAttribute("allReport", allReport);
		
		return ".adminLayout";
	}
	
	@RequestMapping(value="/admin/revenue")
	public String revenue() {
		return ".admin.main.revenue";
	}
	
	
	@RequestMapping(value="/admin/bar")
	@ResponseBody
	public Map<String, Object> line1() throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();

		List<Integer> listCount= service.dailyReservation();
		List<Integer> listTotal = service.dailyResTotal();
		model.put("listCount", listCount);
		model.put("listTotal", listTotal);
		
		return model;
	}
	
	
}
