package com.sp.trip.reservation;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sp.trip.common.MyUtil;
import com.sp.trip.member.SessionInfo;

@Controller("reservation.reservationController")
@RequestMapping("/reservation/*")
public class ReservationController {
	@Autowired
	private ReservationService service;
	@Autowired
	private MyUtil myUtil;
	
	//숙소 리스트
	@RequestMapping(value = "list")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "") String lodgCategory,
			@RequestParam(defaultValue = "") String[] lodgOption,
			@RequestParam(defaultValue = "") String[] roomOption,
			@RequestParam(defaultValue = "") String startDate,
			@RequestParam(defaultValue = "") String endDate,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "2") int people,
			@RequestParam(defaultValue = "1") int bed,
			@RequestParam(defaultValue = "0") int minPrice, // 선택한 최소값
			@RequestParam(defaultValue = "0") int maxPrice, // 선택한 최대값
			@RequestParam(defaultValue = "0") int maxValue, // 숙소전체 중 최대값
			@RequestParam(defaultValue = "") String sort,
			HttpServletRequest req,
			HttpSession session,
			Model model
			) throws Exception {
		
		String cp = req.getContextPath();	
		
		int rows = 10;
		int total_page = 0;
		int dataCount = 0;
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("lodgCategory", lodgCategory);
		map.put("roomBed", bed);
		map.put("roomMax_people", people);
		map.put("roomOption", roomOption);
		map.put("lodgOption", lodgOption);
		
		if(sort.length() == 0) {
			sort = "reviewSort";
		}
		map.put("sort", sort);
		
		
		if( startDate.length() == 0) {
			Calendar cal = Calendar.getInstance();
			startDate = String.format("%tF", cal);
			cal.add(Calendar.DATE, 1);
			endDate = String.format("%tF", cal);
		}

		map.put("startDate",startDate.replaceAll("-", ""));
		map.put("endDate",endDate.replaceAll("-", ""));
		
		if( maxValue == 0 ) {
			maxValue = service.maxValue(map);
		}
		
		if( maxPrice == 0) {
			maxPrice = maxValue;
		}
		
		map.put("minPrice", minPrice);
		map.put("maxPrice", maxPrice);
		
		
		
		
		
		
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
		
		
		for(Reservation r : list) {
			r.setIsLiked("false");
		}
		
		
		
		List<String> likeList = service.readLikeList(info.getUserId()); // 고객이 누른 호스트들 아이디
		for(int i=0; i<likeList.size(); i++) {
			for(int j=0; j<list.size(); j++) {
				if (likeList.get(i).equals(list.get(j).getMhId())) {
					list.get(j).setIsLiked("true");
					break;
				}
			}
		}
		
		
		String query = "";
		String listUrl = cp + "/reservation/list";
		String roomListUrl = cp + "/reservation/roomlist?page=" + current_page;
		if (keyword.length() != 0) {
			query = "keyword=" + URLEncoder.encode(keyword, "utf-8");
		}
		
		if (query.length() != 0) {
			listUrl = cp + "/reservation/list?" + query;
			roomListUrl = cp + "/reservation/roomlist?" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		map.put("memberId", info.getUserId());
		

		model.addAttribute("list", list);
		model.addAttribute("roomListUrl", roomListUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("maxValue", maxValue);
		model.addAttribute("maxPrice", maxPrice);
		model.addAttribute("minPrice", minPrice);
		
		model.addAttribute("keyword", keyword);
		
		model.addAttribute("lodgCategory", lodgCategory);
		model.addAttribute("lodgOption", lodgOption);
		model.addAttribute("roomOption", roomOption);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		
		model.addAttribute("people", people);
		model.addAttribute("bed", bed);
		
		
		
		
		
		return ".reservation.list";
	}
	
	
	// 찜 추가/삭제 : AJAX-JSON
		@RequestMapping(value = "insertLikeList", method = RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> insertLikeList(
				@RequestParam String mhId,
				@RequestParam String isLiked,
				HttpSession session) {
			
			String state = "true";
			SessionInfo info = (SessionInfo) session.getAttribute("member");

			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("memberId", info.getUserId());
			paramMap.put("mhId", mhId);

			try {
				if(isLiked.equals("true")) {
					service.deleteLikeList(paramMap);
					isLiked = "false";
				} else {
					service.insertLikeList(paramMap);
					isLiked = "true";
				}
			} catch (Exception e) {
				state = "false";
			}


			Map<String, Object> model = new HashMap<>();
			model.put("state", state);
			model.put("isLiked", isLiked);

			return model;
		}
	
	
	// 예약 + 결제창
	@RequestMapping(value = "reservation", method = RequestMethod.GET)
	public String reservation(
			@RequestParam(defaultValue = "") String startDate,
			@RequestParam(defaultValue = "") String endDate,
			@RequestParam(defaultValue = "") int roomNum,
			@RequestParam(defaultValue = "") int roomPeople, 
			HttpSession session,
			Model model) throws Exception {
		
		if( startDate.length() == 0) {
			Calendar cal = Calendar.getInstance();
			startDate = String.format("%tF", cal);
			cal.add(Calendar.DATE, 1);
			endDate = String.format("%tF", cal);
		}
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		String memberId = info.getUserId();
		
		int point = service.readPoint(memberId);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startDate",startDate);
		map.put("endDate",endDate);
		map.put("roomNum", roomNum);
		
		Reservation dto = service.readPay(map);
				
		model.addAttribute("dto", dto);
		model.addAttribute("point", point);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		model.addAttribute("roomPeople",roomPeople);
		model.addAttribute("memberId", memberId);
		
		return ".reservation.reservation";
	}
	
	// 예약 + 결제 입력
	@RequestMapping(value = "reservation", method = RequestMethod.POST)
	public String reservationSubmit (
			Reservation dto,
			RedirectAttributes rttr,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			dto.setMemberId(info.getUserId());
			int resNum = service.insertReservation(dto);
			rttr.addFlashAttribute("resNum",resNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return "redirect:/reservation/reservation_ok";
	}
	
	// 예약 완료 페이지
	@RequestMapping(value = "reservation_ok")
	public String reservation_ok(
			@ModelAttribute("resNum") int resNum,
			Model model) throws Exception {
		
		Reservation dto = service.readReservation(resNum);
		


		model.addAttribute("dto",dto);
		
		return ".reservation.reservation_ok";
	}
	
}
