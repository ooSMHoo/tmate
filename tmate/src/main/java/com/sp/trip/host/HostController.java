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

import com.sp.trip.lodging.LodgingService;
import com.sp.trip.member.Member;
import com.sp.trip.member.SessionInfo;

@Controller("host.hostController")
@RequestMapping("/host")
public class HostController {
	
	private final HostService hostService;
	private final LodgingService lodgingService;
	
	@Autowired
	public HostController(HostService hostService, LodgingService lodgingService) {
		this.hostService = hostService;
		this.lodgingService = lodgingService;
	}
	
	@GetMapping("/add")
	public String hostForm(HttpSession session, Model model) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Member member = hostService.readMember(info.getUserId());
		
		if (hostService.readHost(info.getUserId()) != null) {
			model.addAttribute("msg", "이미 호스트이거나 호스트 신청 내역이 있어서 신청이 불가능합니다.");
			model.addAttribute("url", "mypage/main/revMain");
			return "/host/alert";
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
			reAttr.addFlashAttribute("title", "호스트 신청 실패");
			reAttr.addFlashAttribute("message", "한 사람당 한번만 호스트 신청이 가능합니다.");
			return "redirect:/host/complete";
		} catch (DataIntegrityViolationException e) {
			reAttr.addFlashAttribute("title", "호스트 신청 실패");
			reAttr.addFlashAttribute("message", "입력형식에 맞지않아 호스트 신청에 실패했습니다.");
			return "redirect:/host/complete";
		} catch (Exception e) {
			reAttr.addFlashAttribute("title", "호스트 신청 실패");
			reAttr.addFlashAttribute("message", "호스트 신청에 실패했습니다.");
			return "redirect:/host/complete";
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
	
	@GetMapping("/info")
	public String readHostForm(HttpSession session, Model model) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String userId = info.getUserId();
		Host host = hostService.readHost(userId);
		
		if (host == null) {
			return "redirect:/member/noAuthorized";
		}
		
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

		String userId = info.getUserId();
		Host host = hostService.readHost(userId);
		
		if (host == null) {
			return "redirect:/member/noAuthorized";
		}
		
		Member member = hostService.readMember(userId);

		model.addAttribute("member", member);
		model.addAttribute("host", host);
		model.addAttribute("mode", "update");
		
		return ".host.hostForm";
	}
	
	@PostMapping("/update")
	public String updateHostSubmit(HttpSession session,
									@ModelAttribute Host host,
									@RequestParam(defaultValue = "") String lodgLat, 
									@RequestParam(defaultValue = "") String lodgLon,
									Model model) {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String userId = info.getUserId();
		host.setMhId(userId);
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			if (lodgLat.equals("")) {
				map.put("mhId", userId);
				hostService.updateHost(host);
			} else if (!lodgLat.equals("") && lodgingService.readLodging(userId) == null) {
				map.put("mhId", userId);
				hostService.updateHost(host);
			} else if (!lodgLat.equals("") && lodgingService.readLodging(userId) != null) {
				map.put("lodgLat", lodgLat);
				map.put("lodgLon", lodgLon);
				map.put("mhId", userId);
				hostService.updateHost(host, map);
			}
		} catch (Exception e) {
		}
		
		return "redirect:/host/info";
	}
}
