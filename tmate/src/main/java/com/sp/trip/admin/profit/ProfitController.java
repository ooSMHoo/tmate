package com.sp.trip.admin.profit;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("admin.profitController")
public class ProfitController {
	@Autowired
	private ProfitService service;
	
	
	@RequestMapping(value="/admin/bar2")
	@ResponseBody
	public Map<String, Object> line2() throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		List<Integer> listCustomer = service.dataCountCustomer();
		List<Integer> listHost = service.dataCountHost();
		model.put("listCustomer", listCustomer);
		model.put("listHost", listHost);
		
		return model;
	}
	
	
	@RequestMapping(value="/admin/bar1")
	@ResponseBody
	public Map<String, Object> line1() throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		List<Integer> listCount = service.dataCountReservation();
		List<Integer> listTotal = service.dataResTotal();
		model.put("listCount", listCount);
		model.put("listTotal", listTotal);
		
		return model;
	}
}
