package com.sp.trip.reservation;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller("reservation.reservationRoomController")
@RequestMapping("/reservation")
public class ReservationRoomController {
	
	private final ReservationRoomService roomReservationService;
	
	@Autowired
	public ReservationRoomController(ReservationRoomService roomReservationService) {
		this.roomReservationService = roomReservationService;
	}
	
	// 객실 리스트 
	@RequestMapping(value = "/roomlist")
	public String roomlist(
			@RequestParam(defaultValue = "") String startDate,
			@RequestParam(defaultValue = "") String endDate,
			@RequestParam(defaultValue = "abc12345") String mhId,
			@RequestParam(defaultValue = "2") int people,
			Model model) throws Exception {
		
		if( startDate.equals("") || endDate.equals("")) {
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.DATE, 1);
			startDate = String.format("%tF", cal);
			cal.add(Calendar.DATE, 2);
			endDate = String.format("%tF", cal);
		}
		
		Lodging lodging = roomReservationService.readLodging(mhId);
		List<Lodging> photoList = roomReservationService.readLodgingPhotoList(mhId); //lodging.getMhId();
		
		Map<String, Object> map = new HashMap<>();
		map.put("mhId", mhId);
		map.put("start",startDate.replaceAll("-", ""));
		map.put("end",startDate.replaceAll("-", ""));
		map.put("roomPeople", people);
		
		List<Room> room = roomReservationService.readCanReservationRoomList(map);
		//List<Room> roomPhoto = roomReservationService.readCanReservationRoomPhotoList();
		
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		model.addAttribute("lodging", lodging);
		model.addAttribute("photoList", photoList);
		model.addAttribute("room", room);
		//model.addAttribute("roomPhoto", roomPhoto);
		
		return ".reservation.roomlist";
	}
	
	@PostMapping("/roomInfo")
	public String roomInfo() {
		return "/reservation/roomInfoModal";
	}
}
