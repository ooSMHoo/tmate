package com.sp.trip.mail;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.trip.common.MyUtil;

@Controller("mail.mailController")
@RequestMapping("/mail/*")
public class MailController {
	
	private final MailSender mailSender;
	private final MyUtil myUtil;
	
	@Autowired
	public MailController(MailSender mailSender, MyUtil myUtil) {
		this.mailSender = mailSender;
		this.myUtil = myUtil;
	}
	
	@PostMapping("/send")
	@ResponseBody
	public Map<String, Object> sendEmail(@RequestParam String userEmail) throws Exception {
		Map<String, Object> model = new HashMap<>();
		System.out.println(userEmail);
		if (!myUtil.isValidEmail(userEmail)) {
			model.put("passed", "error");
			return model;
		}
		
		StringBuilder sb = new StringBuilder();
		String s = "~!@#$%^&*-+=()ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
		Random rd = new Random();
		for(int i=0; i<10; i++) {
			int n = rd.nextInt(s.length());
			sb.append(s.substring(n, n+1));
		}
//		String code = sb.toString(); 세션에 저장할 것임
		String result = "트레블&메이트 이메일 인증코드는 <b>" + sb.toString() + "</b> 입니다.<br>";
		
		Mail mail = new Mail();
		mail.setReceiverEmail(userEmail);
		mail.setSenderEmail("azq0307@naver.com");
		mail.setSenderName("관리자");
		mail.setSubject("트레블&메이트 - 이메일 인증");
		mail.setContent(result);
		
		model.put("passed", "true");
		
		return model;
	}
	
	@PostMapping("/mailcheck")
	@ResponseBody
	public Map<String, Object> mailCheck(@RequestParam String email1, @RequestParam String email2) throws Exception {
		Map<String, Object> model = new HashMap<>();
		
		return model;
	}
}
