package com.sp.trip.host;

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

import com.sp.trip.member.SessionInfo;

@Controller("host.hostController")
@RequestMapping("/host/*")
public class HostController {
	
	private final HostService service;
	
	@Autowired
	public HostController(HostService service) {
		this.service = service;
	}
	
	@GetMapping("hostForm/write")
	public String hostForm(HttpSession session, Model model) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String email = service.getMemberEmail(info);
		model.addAttribute("email", email);
		model.addAttribute("mode", "write");
		
		return ".host.hostForm";
	}
	
	@PostMapping("hostForm/write")
	public String hostSubmit(
			@ModelAttribute Host host,
			final RedirectAttributes reAttr,
			HttpSession session,
			Model model) {
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			host.setMhId(info.getUserId());
			service.insertHost(host);
		} catch (DuplicateKeyException e) {
			model.addAttribute("message", "한 사람당 한번만 호스트 신청이 가능합니다.");
			return ".host.hostForm";
		} catch (DataIntegrityViolationException e) {
			model.addAttribute("message", "입력형식에 맞지않아 회원가입에 실패했습니다.");
			return ".host.hostForm";
		} catch (Exception e) {
			model.addAttribute("message", "회원가입에 실패했습니다.");
			return ".host.hostForm";
		}
		
		reAttr.addFlashAttribute("message", "정상적으로 호스트 신청이 완료되었습니다.");
		reAttr.addFlashAttribute("title", "호스트 신청");
		
		return "redirect:/host/complete";
	}
	
	@RequestMapping(value = "complete")
	public String complete(@ModelAttribute("message") String message) throws Exception {
		if(message == null || message.length() == 0) {
			return "redirect:/";
		}
		
		return ".host.complete";
	}
	
	@GetMapping("lodgingForm/write")
	public String lodgingForm(HttpSession session, Model model) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String userId = info.getUserId();
		Host host = service.readHost(userId);
		if(host == null) {
			return "redirect:/";
		}

		model.addAttribute("addr", host.getMhAddr1());
		model.addAttribute("mode", "write");
		
		return ".host.lodgingForm";
	}
	
	@PostMapping("lodgingForm/write")
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
			service.insertLodging(lodging, path);
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

		return "redirect:/host/complete";
	}
	
	@GetMapping("roomForm/write")
	public String roomForm() {
		return ".host.roomForm";
	}
}
