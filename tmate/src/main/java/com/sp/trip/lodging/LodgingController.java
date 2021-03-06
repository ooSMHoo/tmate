package com.sp.trip.lodging;

import java.io.File;
import java.util.List;

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

import com.sp.trip.host.Host;
import com.sp.trip.host.HostService;
import com.sp.trip.member.SessionInfo;

@Controller("lodging.lodgingController")
@RequestMapping("/host/lodging")
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
		
		if (host == null) {
			return "redirect:/member/noAuthorized";
		}
		
		if (host.getMhSign() == 0) {
			return "redirect:/member/noAuthorized";
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
			reAttr.addFlashAttribute("message", "????????? ????????? ?????? ???????????????.");
			reAttr.addFlashAttribute("title", "?????? ?????? ??????");
			return "redirect:/host/complete";
		} catch (DataIntegrityViolationException e) {
			reAttr.addFlashAttribute("message", "??????????????? ???????????? ??????????????? ??????????????????.");
			reAttr.addFlashAttribute("title", "?????? ?????? ??????");
			return "redirect:/host/complete";
		} catch (Exception e) {
			reAttr.addFlashAttribute("message", "??????????????? ??????????????????.");
			reAttr.addFlashAttribute("title", "?????? ?????? ??????");
			return "redirect:/host/complete";
		}
		session.setAttribute("hasLodging", "true");
		reAttr.addFlashAttribute("message", "??????????????? ??????????????? ?????????????????????.");
		reAttr.addFlashAttribute("title", "?????? ??????");

		return "redirect:/host/lodging/lodgingComplete";
	}
	
	@RequestMapping(value = "lodgingComplete")
	public String complete(@ModelAttribute("message") String message) throws Exception {
		if(message == null || message.length() == 0) {
			return "redirect:/";
		}
		
		return ".host.lodgingComplete";
	}
	
	@GetMapping("/info")
	public String readLodging(HttpSession session, Model model) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String userId = info.getUserId();
		
		Lodging lodging = lodgingService.readLodging(userId);
		
		if (lodging == null) {
			return "redirect:/member/noAuthorized";
		}
		
		String category = lodgingService.readLodgingCategory(lodging.getLcNum());
		List<Lodging> photoList = lodgingService.readLodgingPhotolist(lodging.getMhId());
		lodging.setLodgContent1(lodging.getLodgContent1().replaceAll("\n", "<br>"));
		lodging.setLodgContent2(lodging.getLodgContent2().replaceAll("\n", "<br>"));
		
		model.addAttribute("lodging", lodging);
		model.addAttribute("lodgingCategory", category);
		model.addAttribute("photoList", photoList);
		
		return ".host.lodgingInfo";
	}
	
	@GetMapping("/update")
	public String updateLodgingForm(HttpSession session, Model model) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String userId = info.getUserId();
		
		Lodging lodging = lodgingService.readLodging(userId);
		
		if (lodging == null) {
			return "redirect:/member/noAuthorized";
		}
		
		List<Lodging> photoList = lodgingService.readLodgingPhotolist(userId);
		
		model.addAttribute("lodging", lodging);
		model.addAttribute("mode", "update");
		model.addAttribute("photoList", photoList);
		
		return ".host.lodgingForm";
	}
	
	@PostMapping("/update")
	public String updateLodgingSubmit(@ModelAttribute Lodging lodging, HttpSession session,
			@RequestParam(required = false) String[] fileNum,
			@RequestParam(required = false) String[] fileName) {
		String root = session.getServletContext().getRealPath("/");
		String path = root + "tmate" + File.separator + "lodging";
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		lodging.setMhId(info.getUserId());
		
		try {
			if (fileNum != null) {
				lodgingService.updateLodging(lodging, path, fileNum, fileName);
			} else {
				lodgingService.updateLodging(lodging, path);
			}
			
		} catch (Exception e) {
		}
		
		return "redirect:/host/lodging/info";
	}
}
