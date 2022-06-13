package com.sp.trip.lodging;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sp.trip.host.Host;
import com.sp.trip.host.HostService;
import com.sp.trip.member.SessionInfo;

@Controller("lodging.lodgingController")
@RequestMapping("/lodgings")
public class LodgingController {
	
	private final HostService hostService;
	private final LodgingService lodgingService;
	
	@Autowired
	public LodgingController(HostService hostService, LodgingService lodgingService) {
		this.hostService = hostService;
		this.lodgingService = lodgingService;
	}
	
	@GetMapping("/add")
	public String lodgingForm(HttpSession session, Model model) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String userId = info.getUserId();
		
		Host host = hostService.readHost(userId);
		if(host == null) {
			return "redirect:/";
		}

		model.addAttribute("host", host);
		model.addAttribute("mode", "write");
		
		return ".host.lodgingForm";
	}
	
	@PostMapping("/add")
	public String lodgingSubmit(
			@ModelAttribute Lodging lodging,
			HttpSession session,
			final RedirectAttributes reAttr,
			Model model) {
		String root = session.getServletContext().getRealPath("/");
		String path = root + "tmate" + File.separator + "lodging";
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String userId = info.getUserId();
		
		try {
			lodging.setMhId(userId);
			lodgingService.insertLodging(lodging, path);
		} catch (DuplicateKeyException e) {
			model.addAttribute("message", "한개의 숙소만 등록 가능합니다.");
			return ".host.lodgingForm";
		} catch (DataIntegrityViolationException e) {
			model.addAttribute("message", "입력형식에 맞지않아 숙소등록에 실패했습니다.");
			return ".host.lodgingForm";
		} catch (Exception e) {
			model.addAttribute("message", "숙소등록에 실패했습니다.");
			return ".host.lodgingForm";
		}
		
		reAttr.addFlashAttribute("message", "정상적으로 숙소등록이 완료되었습니다.");
		reAttr.addFlashAttribute("title", "숙소 등록");

		return "redirect:/hosts/complete";
	}
	
	@GetMapping
	public String updateLodgingForm() {
		return null;
	}
	
	@PostMapping
	public String updateLodgingSubmit() {
		return null;
	}
}
