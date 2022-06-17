package com.sp.trip.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("member.memberController")
@RequestMapping(value = "/member/*")
public class MemberController {
	@Autowired
	private MemberService service;

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String loginForm() {
		return ".member.login";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginSubmit(@RequestParam String memberId,
			@RequestParam String memberPwd,
			HttpSession session,
			Model model) {

		Member dto = service.loginMember(memberId);
		if (dto == null || !memberPwd.equals(dto.getMemberPwd())) {
			model.addAttribute("message", "아이디 또는 패스워드가 일치하지 않습니다.");
			return ".member.login";
		}

		// 세션에 로그인 정보 저장
		SessionInfo info = new SessionInfo();
		info.setUserId(dto.getMemberId());
		info.setUserName(dto.getMemberName());
		info.setMembership(dto.getMemberAuth());

		session.setMaxInactiveInterval(30 * 60); // 세션유지시간 30분, 기본:30분

		session.setAttribute("member", info);

		// 로그인 이전 URI로 이동
		String uri = (String) session.getAttribute("preLoginURI");
		session.removeAttribute("preLoginURI");
		if (uri == null) {
			uri = "redirect:/";
		} else {
			uri = "redirect:" + uri;
		}

		return uri;
	}

	@RequestMapping(value = "logout")
	public String logout(HttpSession session) {
		// 세션에 저장된 정보 지우기
		session.removeAttribute("member");

		// 세션에 저장된 모든 정보 지우고, 세션초기화
		session.invalidate();

		return "redirect:/";
	}

	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String memberForm(Model model) {

		return ".member.member";
	}

	
	
	@RequestMapping(value = "noAuthorized")
	public String noAuthorized(Model model) {
		return ".member.noAuthorized";
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
	
	@RequestMapping("/sendEmail")
	@ResponseBody
	public Map<String, Object> sendEmail() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("passed", "true");
		
		return model;
	}
}
