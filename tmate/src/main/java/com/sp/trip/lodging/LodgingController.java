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
	
	@GetMapping("/info")
	public String readLodging(HttpSession session, Model model) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if(info == null) {
			return "redirect:/";
		}
		String userId = info.getUserId();
		
		Lodging lodging = lodgingService.readLodging(userId);
		String category = lodgingService.readLodgingCategory(lodging.getLcNum());
		List<Lodging> photoList = lodgingService.readLodgingPhotolist(lodging.getMhId());
		
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
		String lodgStart_date = lodging.getLodgStart_date();
		String lodgEnd_date = lodging.getLodgEnd_date();
		lodging.setStart_month(lodgStart_date.substring(0, lodgStart_date.indexOf("-")));
		lodging.setStart_day(lodgStart_date.substring(lodgStart_date.indexOf("-")+1));
		lodging.setEnd_month(lodgEnd_date.substring(0, lodgEnd_date.indexOf("-")));
		lodging.setEnd_day(lodgEnd_date.substring(lodgEnd_date.indexOf("-")+1));
		
		
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
		
		return "redirect:/lodgings/info";
	}
}