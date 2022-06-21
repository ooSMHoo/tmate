package com.sp.trip.room;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sp.trip.lodging.Lodging;
import com.sp.trip.lodging.LodgingService;
import com.sp.trip.member.SessionInfo;

@Controller("room.roomController")
@RequestMapping("/host/rooms")
public class RoomController {
	
	private final RoomService roomService;
	private final LodgingService lodgingService;
	
	@Autowired
	public RoomController(RoomService roomService, LodgingService lodgingService) {
		this.roomService = roomService;
		this.lodgingService = lodgingService;
	}
	
	
	@GetMapping("/add")
	public String roomForm(HttpSession session, Model model) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String userId = info.getUserId();
		Lodging lodging = lodgingService.readLodging(userId);
		if (lodging == null) {
			return "redirect:/";
		}
		
		model.addAttribute("mode", "write");
		
		return ".host.roomForm";
	}
	
	@PostMapping("/add")
	public String roomFormSubmit(
			HttpSession session,
			@ModelAttribute Room room,
			final RedirectAttributes reAttr,
			Model model) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String path = root + "tmate" + File.separator + "room";
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String userId = info.getUserId();
		
		try {
			room.setMhId(userId);
			roomService.insertRoom(room, path);
		} catch (DataIntegrityViolationException e) {
			reAttr.addFlashAttribute("message", "입력형식에 맞지않아 객실등록에 실패했습니다.");
			reAttr.addFlashAttribute("title", "객실 등록 실패");
			return "redirect:/host/complete";
		} catch (Exception e) {
			reAttr.addFlashAttribute("message", "객실등록에 실패했습니다.");
			reAttr.addFlashAttribute("title", "객실 등록 실패");
			return "redirect:/host/complete";
		}
		
		reAttr.addFlashAttribute("message", "정상적으로 객실등록이 완료되었습니다.");
		reAttr.addFlashAttribute("title", "객실 등록");

		return "redirect:/host/rooms/complete";
	}
	
	@RequestMapping(value = "complete")
	public String complete(@ModelAttribute("message") String message) throws Exception {
		if(message == null || message.length() == 0) {
			return "redirect:/";
		}
		
		return ".host.roomComplete";
	}
	
	@GetMapping("/{roomNum}")
	public String readRoom(HttpSession session, @PathVariable String roomNum, Model model,
							@RequestParam(defaultValue = "") String page, @RequestParam(defaultValue = "") String option) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if (info == null) {
			return "redirect:/"; // 예외처리
		}
		try {
			int num = Integer.parseInt(roomNum);
			Room room = roomService.readRoom(num);
			if (room == null) {
				return "redirect:/"; // 방이 없는데 접근
			}
			if (! room.getMhId().equals(info.getUserId())) {
				return "redirect:/"; // 숙소가 없는데 접근함
			}
			String roomCategory = roomService.readRoomCategory(room.getRcNum());
			List<Room> photoList = roomService.readRoomPhotolist(num);
			room.setRoomContent(room.getRoomContent().replaceAll("\n", "<br>"));
			
			model.addAttribute("room", room);
			model.addAttribute("photoList", photoList);
			model.addAttribute("roomCategory", roomCategory);
			model.addAttribute("page", page);
			model.addAttribute("option", option);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/"; //roomNum에 문자가 들어오면(정상적인 접근 아님)
		}
		
		return ".host.roomInfo";
	}
	
	@GetMapping("/{roomNum}/update")
	public String updateRoomForm(HttpSession session, @PathVariable String roomNum,
								@RequestParam(defaultValue = "") String page,
								@RequestParam(defaultValue = "") String option,
								Model model) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if (info == null) {
			return "redirect:/"; // 예외처리
		}
		
		try {
			int num = Integer.parseInt(roomNum);
			Room room = roomService.readRoom(num);
			if (room == null) {
				return "redirect:/"; // 방이 없는데 접근
			}
			if (! room.getMhId().equals(info.getUserId())) {
				return "redirect:/"; // 숙소가 없는데 접근함
			}
			String roomCategory = roomService.readRoomCategory(room.getRcNum());
			List<Room> photoList = roomService.readRoomPhotolist(num);
			
			
			model.addAttribute("room", room);
			model.addAttribute("mode", "update");
			model.addAttribute("photoList", photoList);
			model.addAttribute("roomCategory", roomCategory);
			model.addAttribute("page", page);
			model.addAttribute("option", option);

		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/";
		}
		
		return ".host.roomForm";
	}
	
	@PostMapping("/{roomNum}/update")
	public String updateRoomSubmit(@PathVariable String roomNum,
							@ModelAttribute Room room,
							HttpSession session,
							@RequestParam(defaultValue = "") String page,
							@RequestParam(defaultValue = "") String option,
							@RequestParam(required = false) String[] fileNum,
							@RequestParam(required = false) String[] fileName) {
		
		String root = session.getServletContext().getRealPath("/");
		String path = root + "tmate" + File.separator + "room";
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		room.setMhId(info.getUserId());
		
		try {
			if(fileNum != null) {
				roomService.updateRoom(room, path, fileNum, fileName);
			} else {
				roomService.updateRoom(room, path);
			}
		} catch (Exception e) {
		}
		
		return "redirect:/host/rooms/" + roomNum + "?page="+page+"&option="+option;
	}
	
	@RequestMapping("/{roomNum}/delete")
	public String deleteRoom(@PathVariable String roomNum,
							@RequestParam(defaultValue = "") String page,
							@RequestParam(defaultValue = "") String option,
							HttpSession session,
							Model model) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String query = "page=" + page + "&option=" + option;
		try {
			String reserved = roomService.isReservation(info.getUserId());
			if (reserved.indexOf(String.valueOf(roomNum)) != -1) {
				model.addAttribute("msg", "현재 예약이 되어 있는 객실은 삭제가 불가능합니다.");
				model.addAttribute("url", "hostPage/rooms?" + query);
				return "/hostPage/main/alert";
			}
			roomService.deleteRoom(Integer.parseInt(roomNum));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/hostPage/rooms?" + query;
	}
	
	@RequestMapping("/{roomNum}/enable")
	@ResponseBody
	public Map<String, Object> changeEnabled(@PathVariable String roomNum,
											@RequestParam int enabled) {
		try {
			Map<String, Object> model = new HashMap<>();
			if (enabled == 0) {
				roomService.changeEnabled1(Integer.parseInt(roomNum));
				enabled = 1;
				model.put("result", "true");
				model.put("enabled", enabled);
				return model;
			} else {
				roomService.changeEnabled0(Integer.parseInt(roomNum));
				enabled = 0;
				model.put("result", "true");
				model.put("enabled", enabled);
				return model;
			}
		} catch (Exception e) {
			Map<String, Object> model = new HashMap<>();
			model.put("result", "false");
			return model;
		}
	}
}
