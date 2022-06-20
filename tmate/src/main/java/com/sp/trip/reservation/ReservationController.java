package com.sp.trip.reservation;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.trip.common.FileManager;
import com.sp.trip.common.MyUtil;

@Controller("reservation.reservationController")
@RequestMapping("/reservation/*")
public class ReservationController {
	@Autowired
	private ReservationService service;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	
	//숙소 리스트
	@RequestMapping(value = "list")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "") String lodgCategory,
			@RequestParam(defaultValue = "") String startDate,
			@RequestParam(defaultValue = "") String endDate,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int people,
			@RequestParam(defaultValue = "1") int bed,
			@RequestParam(defaultValue = "0") String minPrice,
			@RequestParam(defaultValue = "0") String maxPrice,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		String cp = req.getContextPath();	
		
		int rows = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		
		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}
		
		if (total_page < current_page) {
			current_page = total_page;
		}
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Reservation> list = service.listLodging(map);
		
		/*
		int listNum, n = 0;
		for (Reservation dto : list) {
			listNum = dataCount - (start + n - 1);
			dto.setListNum(listNum);
			n++;
		}
		*/
		
		String query = "";
		String listUrl = cp + "/reservation/list";
		String roomListUrl = cp + "/reservation/roomlist?page=" + current_page;
		if (keyword.length() != 0) {
			query = "keyword=" + URLEncoder.encode(keyword, "utf-8");
		}
		
		if (query.length() != 0) {
			listUrl = cp + "/reservation/list?" + query;
			roomListUrl = cp + "/reservation/roomlist?page=" + current_page + "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		if( startDate.length() == 0) {
			Calendar cal = Calendar.getInstance();
			startDate = String.format("%tF", cal);
			cal.add(Calendar.DATE, 1);
			endDate = String.format("%tF", cal);
		}
		
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		/*
		if (maxPrice.equals("0")) 
			{
	            for(Reservation dto : list) 
	            {
	                if (Integer.parseInt(maxPrice) < dto.getRoomPrice()) 
	                {
	                    maxPrice = String.valueOf(dto.getRoomPrice());
	                }
	            }
	     	}
		*/
		
		model.addAttribute("list", list);
		model.addAttribute("roomListUrl", roomListUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		model.addAttribute("keyword", keyword);
		
		
		model.addAttribute("lodgCategory", lodgCategory);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		model.addAttribute("maxPrice", maxPrice);
		
		
		
		return ".reservation.list";
	}
	
	// 예약 + 결제하기
	@RequestMapping(value = "reservation")
	public String reservation(
			@RequestParam(defaultValue = "") String startDate,
			@RequestParam(defaultValue = "") String endDate,
			Model model) throws Exception {
		
		
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		
		return ".reservation.reservation";
	}
	
}
