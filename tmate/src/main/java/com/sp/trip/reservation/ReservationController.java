package com.sp.trip.reservation;

import java.util.Calendar;

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
			Model model
			) throws Exception {
		
			
		if( startDate.length() == 0) {
			Calendar cal = Calendar.getInstance();
			startDate = String.format("%tF", cal);
			cal.add(Calendar.DATE, 1);
			endDate = String.format("%tF", cal);
		}
		
		model.addAttribute("lodgCategory", lodgCategory);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		
		return ".reservation.list";
	}
	
	// 객실 리스트 
	@RequestMapping(value = "roomlist")
	public String roomlist(
			@RequestParam(defaultValue = "") String startDate,
			@RequestParam(defaultValue = "") String endDate,
			Model model) throws Exception {
		
		if( startDate.length() == 0) {
			Calendar cal = Calendar.getInstance();
			startDate = String.format("%tF", cal);
			cal.add(Calendar.DATE, 1);
			endDate = String.format("%tF", cal);
		}
		
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		
		return ".reservation.roomlist";
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
