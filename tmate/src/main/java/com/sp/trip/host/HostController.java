package com.sp.trip.host;

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

import com.sp.trip.member.Member;
import com.sp.trip.member.SessionInfo;

@Controller("host.hostController")
@RequestMapping("/hosts")
public class HostController {
	
	private final HostService hostService;
	
	@Autowired
	public HostController(HostService hostService) {
		this.hostService = hostService;
	}
	
	@GetMapping("/add")
	public String hostForm(HttpSession session, Model model) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if(info == null) {
			throw new Exception();
		}
		Member member = hostService.readMember(info.getUserId());
		if(member == null) {
			return "redirect:/";
		}
		model.addAttribute("member", member);
		model.addAttribute("mode", "write");
		
		return ".host.hostForm";
	}
	
	@PostMapping("/add")
	public String hostSubmit(
			@ModelAttribute Host host,
			final RedirectAttributes reAttr,
			HttpSession session,
			Model model) {
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			host.setMhId(info.getUserId());
			hostService.insertHost(host);
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
		
		return "redirect:/hosts/complete";
	}
	
	@RequestMapping(value = "complete")
	public String complete(@ModelAttribute("message") String message) throws Exception {
		if(message == null || message.length() == 0) {
			return "redirect:/";
		}
		
		return ".host.complete";
	}
	
	@GetMapping(value = "/{id}")
	public String updateHostForm() {
		return null;
	}
	
	@PostMapping(value = "/{id}")
	public String updateHostSubmit() throws Exception {
		return null;
	}
}
