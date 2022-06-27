package com.sp.trip.reservation;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.trip.common.APISerializer;
import com.sp.trip.common.MyUtil;
import com.sp.trip.room.RoomService;


@Controller("reservation.reservationRoomController")
@RequestMapping("/reservation")
public class ReservationRoomController {
	
	private final ReservationRoomService roomReservationService;
	private final RoomService roomService;
	private final MyUtil myUtil;
	private final APISerializer apiSerializer;
	
	
	@Autowired
	public ReservationRoomController(ReservationRoomService roomReservationService, RoomService roomService,@Qualifier("myUtilGeneral") MyUtil myUtil,
									APISerializer apiSerializer) {
		this.roomReservationService = roomReservationService;
		this.roomService = roomService;
		this.myUtil = myUtil;
		this.apiSerializer = apiSerializer;
	}
	
	// 객실 리스트 
	@RequestMapping(value = "/roomlist")
	public String roomlist(
			@RequestParam(defaultValue = "") String startDate,
			@RequestParam(defaultValue = "") String endDate,
			@RequestParam(defaultValue = "tmhost1") String mhId,
			@RequestParam(defaultValue = "4") int people,
			Model model) throws Exception {
		
		if( startDate.equals("") || endDate.equals("")) {
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.DATE, 1);
			startDate = String.format("%tF", cal);
			cal.add(Calendar.DATE, 1);
			endDate = String.format("%tF", cal);
		}
		
		Lodging lodging = roomReservationService.readLodging(mhId);
		List<Lodging> photoList = roomReservationService.readLodgingPhotoList(mhId); //lodging.getMhId();
		
		Map<String, Object> map = new HashMap<>();
		map.put("mhId", mhId);
		map.put("start",startDate.replaceAll("-", ""));
		map.put("end",endDate.replaceAll("-", ""));
		map.put("roomPeople", people);
		
		List<Room> roomList = roomReservationService.readCanReservationRoomList(map);
		double total = roomReservationService.totalReviewGrade(mhId);
		
		String attraction = tourAPItoJSON(lodging.getLodgLon().substring(0, 10), lodging.getLodgLat().substring(0, 9));
		
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		model.addAttribute("lodging", lodging);
		model.addAttribute("photoList", photoList);
		model.addAttribute("room", roomList);
		model.addAttribute("total", total);
		model.addAttribute("people", people);
		model.addAttribute("attraction", attraction);
		
		return ".reservation.roomlist";
	}
	
	@RequestMapping("/roomInfo")
	public String roomInfo(@RequestParam int roomNum, Model model) {
		com.sp.trip.room.Room room = roomService.readRoom(roomNum);
		List<Room> roomPhoto = roomReservationService.readCanReservationRoomPhotoList(roomNum);
		
		model.addAttribute("room", room);
		model.addAttribute("roomPhoto", roomPhoto);
		return "/reservation/roomInfoModal";
	}
	
	@RequestMapping("/roomReview")
	public String roomReview(@RequestParam String mhId,
							@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
							@RequestParam(defaultValue = "all") String option, Model model) {
		int rows = 5;
		int total_page = 0;
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<>();
		map.put("mhId", mhId);
		map.put("option", option);
		
		dataCount = roomReservationService.reviewCount(map);
		total_page = myUtil.pageCount(rows, dataCount);
		if (current_page > total_page) {
			current_page = total_page;
		}
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Review> reviewList = roomReservationService.reviewList(map);
		for (Review dto : reviewList) {
			dto.setRevContent(dto.getRevContent().replaceAll("\n", "<br>"));
		}
		
		String paging = myUtil.pagingMethod2(current_page, total_page, "listPage", option);
	
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("paging", paging);
		
		
		return "/reservation/roomReview";
	}
	
	@GetMapping("/writeReview")
	public String writeReview() {
		return "/reservation/writeReview";
	}
	
	public String tourAPItoJSON(String mapX, String mapY) throws Exception {
		String result = "";
		String spec = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?ServiceKey=wj1JFOVOUM029AQQoTzKznocx2Xbvrhnr4hE2w8tB30OXpY3tk837HIsVLPXiEwahbcsDCFKfMuKur5EfHhKEw%3D%3D"
				+ "&numOfRows=10&pageNo=1&contentTypeId=12&mapX="+mapX+"&mapY="+mapY+"&radius=5000&listYN=Y&arrange=E&MobileOS=ETC&MobileApp=AppTest";
		result = apiSerializer.receiveXmlToJson(spec);
		
		return result;
	}
}
