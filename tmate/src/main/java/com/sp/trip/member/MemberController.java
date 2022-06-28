package com.sp.trip.member;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sp.trip.lodging.LodgingService;

@Controller("member.memberController")
@RequestMapping(value = "/member")
public class MemberController {
	
	private final MemberService service;
	private final LodgingService lodgingService;
	
	@Autowired
	public MemberController(MemberService service, LodgingService lodgingService) {
		this.service = service;
		this.lodgingService = lodgingService;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm() {
		return ".member.login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginSubmit(@RequestParam String memberId,
			@RequestParam String memberPwd,
			HttpSession session,
			Model model) {

		Member dto = service.loginMember(memberId);
		if (dto == null || !memberPwd.equals(dto.getMemberPwd())) {
			model.addAttribute("message", "아이디 또는 패스워드가 일치하지 않습니다.");
			return ".member.login";
		}

		SessionInfo info = new SessionInfo();
		info.setUserId(dto.getMemberId());
		info.setUserName(dto.getMemberName());
		info.setMembership(dto.getMemberAuth());

		session.setMaxInactiveInterval(30 * 60);

		session.setAttribute("member", info);
		
		if (lodgingService.readLodging(memberId) != null) {
			session.setAttribute("hasLodging", "true");
		}

		String uri = (String) session.getAttribute("preLoginURI");
		session.removeAttribute("preLoginURI");
		if (uri == null) {
			uri = "redirect:/";
		} else {
			uri = "redirect:" + uri;
		}

		return uri;
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("member");
		session.removeAttribute("hasLodging");
		session.invalidate();

		return "redirect:/";
	}

	@GetMapping("/join")
	public String memberForm(Model model) {

		return ".member.member";
	}
	
	@PostMapping("/join")
	public String memberSubmit(Member dto,
			final RedirectAttributes reAttr,
			Model model) {
		try {
			service.insertMember(dto);
		} catch (DuplicateKeyException e) {
			model.addAttribute("message", "아이디 중복으로 회원가입이 실패했습니다.");
			return ".member.member";
		} catch (DataIntegrityViolationException e) {
			// 데이터형식 오류, 참조키, NOT NULL 등의 제약조건 위반
			model.addAttribute("message", "입력형식에 맞지 않아 회원가입이 실패했습니다.");
			return ".member.member";
		} catch (Exception e) {
			model.addAttribute("message", "회원가입이 실패했습니다.");
			return ".member.member";
		}

		StringBuilder sb = new StringBuilder();
		sb.append(dto.getMemberName() + "님의 회원 가입이 정상적으로 처리되었습니다.<br>");
		sb.append("메인화면으로 이동하여 로그인 하시기 바랍니다.<br>");

		reAttr.addFlashAttribute("message", sb.toString());
		reAttr.addFlashAttribute("title", "회원 가입");

		return "redirect:/member/complete";
	}
	
	@RequestMapping(value = "noAuthorized")
	public String noAuthorized(Model model) {
		return ".member.noAuthorized";
	}
	
	@RequestMapping(value = "/complete")
	public String complete(@ModelAttribute("message") String message) throws Exception {
		if (message == null || message.length() == 0) // F5를 누른 경우
			return "redirect:/";

		return ".member.complete";
	}
	
	
	@PostMapping("/userIdCheck")
	@ResponseBody
	public Map<String, Object> userIdCheck(@RequestParam String memberId) {
		String passed = "true";
		Member dto = service.readMember(memberId);
		if (dto != null) {
			passed = "false";
		}
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("passed", passed);
		
		return model;
	}
}
