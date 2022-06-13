package com.sp.trip.room;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sp.trip.lodging.Lodging;
import com.sp.trip.lodging.LodgingService;
import com.sp.trip.member.SessionInfo;

@Controller("room.roomController")
@RequestMapping("/rooms")
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
			model.addAttribute("message", "입력형식에 맞지않아 객실등록에 실패했습니다.");
			return ".host.roomForm";
		} catch (Exception e) {
			model.addAttribute("message", "객실등록에 실패했습니다.");
			return ".host.roomForm";
		}
		
		reAttr.addFlashAttribute("message", "정상적으로 객실등록이 완료되었습니다.");
		reAttr.addFlashAttribute("title", "객실 등록");

		return "redirect:/hosts/complete";
	}
}
