package com.sp.trip.host;

import java.util.HashMap;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@GetMapping("/info")
	public String readHostForm(HttpSession session, Model model) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if (info == null) {
			return "redirect:/";
		}
		String userId = info.getUserId();
		Host host = hostService.readHost(userId);
		Member member = hostService.readMember(userId);
		String email = member.getMemberEmail();
		String bank = hostService.getBank(host.getBankNum());
		
		model.addAttribute("host", host);
		model.addAttribute("email", email);
		model.addAttribute("bank", bank);
		
		return ".host.hostInfo";
	}
	
	@GetMapping("/update")
	public String updateHostForm(HttpSession session, Model model) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if (info == null) {
			return "redirect:/";
		}
		String userId = info.getUserId();
		Host host = hostService.readHost(userId);
		Member member = hostService.readMember(userId);
		String phone = host.getMhPhone();
		String phone1 = phone.substring(0, phone.indexOf("-"));
		String phone2 = phone.substring(phone.indexOf("-")+1, phone.lastIndexOf("-"));
		String phone3 = phone.substring(phone.lastIndexOf("-")+1);
		host.setMhPhone1(phone1);
		host.setMhPhone2(phone2);
		host.setMhPhone3(phone3);
		
		model.addAttribute("member", member);
		model.addAttribute("host", host);
		model.addAttribute("mode", "update");
		
		return ".host.hostForm";
	}
	
	@PostMapping("/update")
	public String updateHostSubmit(HttpSession session,
									@ModelAttribute Host host,
									@RequestParam String lodgLat, 
									@RequestParam String lodgLon,
									Model model) {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if (info == null) {
			return "redirect:/";
		}
		String userId = info.getUserId();
		host.setMhId(userId);
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("lodgLat", lodgLat);
		map.put("lodgLon", lodgLon);
		map.put("mhId", userId);
		
		try {
			hostService.updateHost(host, map);
		} catch (Exception e) {
		}
		
		return "redirect:/hosts/info";
	}
}
