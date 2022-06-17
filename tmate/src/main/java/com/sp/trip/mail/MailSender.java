package com.sp.trip.mail;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.trip.common.MyUtil;

@Service("mail.myMailSender")
public class MailSender {
	
	@Autowired
	private final MyUtil myUtil;
	
	private String mailType;
	private String encType;
	
	public MailSender(MyUtil myUtil) {
		this.myUtil = myUtil;
		this.encType = "utf-8";
		this.mailType = "text/html; charset=utf-8";
	}
	
	public void setMailType(String mailType, String encType) {
		this.mailType = mailType;
		this.encType = encType;
	}
	
	private class SMTPAuthenticator extends javax.mail.Authenticator {
		@Override
		public PasswordAuthentication getPasswordAuthentication() {
			String username = "아이디@naver.com";
			String password = "비밀번호";
			return new PasswordAuthentication(username, password);
		}
	}
	
	private void makeMessage(Message msg, Mail dto) throws MessagingException {
		msg.setText(dto.getContent());
		msg.setHeader("Content-Type", mailType);
	}
	
	public boolean mailSend(Mail dto) {
		boolean b = false;
		
		Properties p = new Properties();
		
		p.put("mail.smtp.user", "azq0307");
		String host = "smtp.naver.com";
		p.put("mail.smtp.host", host);
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		p.put("mail.smtp.ssl.enable", "true");
		p.put("mail.smtp.ssl.trust", host);
		
		try {
			Authenticator auth = new SMTPAuthenticator();
			Session session = Session.getDefaultInstance(p, auth);
			
			session.setDebug(true);
			
			Message msg = new MimeMessage(session);
			
			if (dto.getSenderName() == null || dto.getSenderName().equals("")) {
				msg.setFrom(new InternetAddress(dto.getSenderEmail()));
			} else {
				msg.setFrom(new InternetAddress(dto.getSenderEmail(), dto.getSenderName(), encType));
			}
			
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(dto.getReceiverEmail()));
			msg.setSubject(dto.getSubject());
			
			if (mailType.indexOf("text/html") == -1) {
				dto.setContent(myUtil.htmlSymbols(dto.getContent()));
			}
			
			makeMessage(msg, dto);
			msg.setHeader("X-Mailer", dto.getSenderName());
			
			msg.setSentDate(new Date());
			Transport.send(msg);
			
			b = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return b;
	}
	
	
}
