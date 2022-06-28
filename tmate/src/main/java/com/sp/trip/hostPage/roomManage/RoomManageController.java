package com.sp.trip.hostPage.roomManage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.trip.common.MyUtil;
import com.sp.trip.lodging.LodgingService;
import com.sp.trip.member.SessionInfo;
import com.sp.trip.room.Room;
import com.sp.trip.room.RoomService;

@Controller("hostPage.roomManageController")
@RequestMapping("/hostPage")
public class RoomManageController {
	
	private final RoomService roomService;
	private final MyUtil myUtil;
	private final LodgingService lodgingService;
	
	@Autowired
	public RoomManageController(RoomService roomService, MyUtil myUtil, LodgingService lodgingService) {
		this.roomService = roomService;
		this.myUtil = myUtil;
		this.lodgingService = lodgingService;
	}
	
	
	@GetMapping("/rooms")
	public String roomManage(HttpSession session,
							HttpServletRequest request,
							@RequestParam(value="page", defaultValue = "1") int current_page,
							@RequestParam(defaultValue = "") String option,
							Model model) throws Exception {
		
		String cp = request.getContextPath();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		if (lodgingService.readLodging(info.getUserId()) == null) {
			model.addAttribute("msg", "숙소 등록 후 이용 가능합니다.");
			model.addAttribute("url", "/hostPage/home");
			return "host/alert";
		}
		
		int rows = 10;
		int total_page = 0;
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<>();
		map.put("option", option);
		map.put("mhId", info.getUserId());
		
		dataCount = roomService.roomCount(map);
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
		List<Room> list = roomService.readRoomlist(map);
		String reservedRooms = roomService.isReservation(info.getUserId());
		
		int listNum, n = 0;
		for(Room room : list) {
			listNum = dataCount - (start + n - 1);
			room.setListNum(listNum);
			if (reservedRooms.indexOf(String.valueOf(room.getRoomNum())) != -1) {
				room.setIsReserved(1);
			} else {
				room.setIsReserved(0);
			}
			n++;
		}
		
		String roomlistUrl = cp + "/hostPage/rooms";
		if(option.length() != 0) {
			roomlistUrl = cp + "/hostPage/rooms?option=" + option;
		}
		
		String paging = myUtil.paging(current_page, total_page, roomlistUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("current_page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("option", option);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("paging", paging);
		
		return ".hostPage.main.roomManage";
	}
}
