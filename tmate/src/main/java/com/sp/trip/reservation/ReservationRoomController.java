package com.sp.trip.reservation;

import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.trip.common.FileManager;
import com.sp.trip.common.MyUtil;

@Controller("reservation.reservationRoomController")
@RequestMapping("/reservation")
public class ReservationRoomController {
	@Autowired
	private ReservationService service;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	
	// 객실 리스트 
	@RequestMapping(value = "/roomlist")
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
		
}
