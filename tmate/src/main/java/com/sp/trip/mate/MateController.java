package com.sp.trip.mate;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.trip.common.MyUtil;
import com.sp.trip.member.SessionInfo;

@Controller("mate.mateController")
@RequestMapping("/mate/*")
public class MateController {
	@Autowired
	private MateService service;
	@Autowired
	private MyUtil myUtil;

	@RequestMapping(value = "list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			Model model) throws Exception {

		String cp = req.getContextPath();

		int rows = 10; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			keyword = URLDecoder.decode(keyword, "utf-8");
		}

		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);

		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}
		
		// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
		if (total_page < current_page) {
			current_page = total_page;
		}

		// 리스트에 출력할 데이터를 가져오기
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);

		// 글 리스트
		List<Mate> list = service.listMate(map);

		// 리스트의 번호
		int listNum, n = 0;
		for (Mate dto : list) {
			listNum = dataCount - (start + n - 1);
			dto.setListNum(listNum);
			n++;
		}

		String query = "";
		String listUrl = cp + "/mate/list";
		String articleUrl = cp + "/mate/article?page=" + current_page;
		if (keyword.length() != 0) {
			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}

		if (query.length() != 0) {
			listUrl = cp + "/mate/list?" + query;
			articleUrl = cp + "/mate/article?page=" + current_page + "&" + query;
		}

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);

		return ".mate.list";
	}

	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm(Model model) throws Exception {

		model.addAttribute("mode", "write");

		return ".mate.write";
	}

	@RequestMapping(value = "/mate/write", method = RequestMethod.POST)
	public String writeSubmit(Mate dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			dto.setMemberId(info.getUserId());
			service.insertMate(dto);
		} catch (Exception e) {
		}

		return "redirect:/mate/list";
	}

	@RequestMapping(value = "article")
	public String article(@RequestParam int mateNum,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session,
			Model model) throws Exception {
		
		keyword = URLDecoder.decode(keyword, "utf-8");

		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + 
					"&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}

		service.updateHitCount(mateNum);

		// 해당 레코드 가져 오기
		Mate dto = service.readMate(mateNum);
		if (dto == null) {
			return "redirect:/mate/list?" + query;
		}
		
		dto.setMateContent(myUtil.htmlSymbols(dto.getMateContent()));

		// 이전 글, 다음 글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("mateNum", mateNum);

		Mate preReadDto = service.preReadMate(map);
		Mate nextReadDto = service.nextReadMate(map);


		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		
		model.addAttribute("page", page);
		model.addAttribute("query", query);

		return ".mate.article";
	}

	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateForm(@RequestParam int mateNum,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Mate dto = service.readMate(mateNum);
		if (dto == null || ! info.getUserId().equals(dto.getMemberId())) {
			return "redirect:/mate/list?page=" + page;
		}

		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);

		return ".mate.write";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSubmit(Mate dto,
			@RequestParam String page,
			HttpSession session) throws Exception {

		try {
			service.updateMate(dto);
		} catch (Exception e) {
		}

		return "redirect:/mate/list?page=" + page;
	}
	
	@RequestMapping(value = "delete")
	public String delete(@RequestParam int mateNum,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		keyword = URLDecoder.decode(keyword, "utf-8");
		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}

		service.deleteMate(mateNum, info.getUserId(), info.getMembership());

		return "redirect:/mate/list?" + query;
	}



	// 댓글 리스트 : AJAX-TEXT
	@RequestMapping(value = "listReply")
	public String listReply(@RequestParam int mateNum, 
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			Model model) throws Exception {

		int rows = 5;
		int total_page = 0;
		int dataCount = 0;

		Map<String, Object> map = new HashMap<>();
		map.put("mateNum", mateNum);

		dataCount = service.replyCount(map);
		total_page = myUtil.pageCount(rows, dataCount);
		if (current_page > total_page) {
			current_page = total_page;
		}

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Reply> listReply = service.listReply(map);

		for (Reply dto : listReply) {
			dto.setMateRe_content(dto.getMateRe_content().replaceAll("\n", "<br>"));
		}

		// AJAX 용 페이징
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");

		// 포워딩할 jsp로 넘길 데이터
		model.addAttribute("listReply", listReply);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("replyCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		return "mate/listReply";
	}

	// 댓글 및 댓글의 답글 등록 : AJAX-JSON
	@RequestMapping(value = "insertReply", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReply(Reply dto, HttpSession session) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state = "true";

		try {
			dto.setMemberId(info.getUserId());
			service.insertReply(dto);
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}

	// 댓글 및 댓글의 답글 삭제 : AJAX-JSON
	@RequestMapping(value = "deleteReply", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteReply(@RequestParam Map<String, Object> paramMap) {
		String state = "true";
		
		try {
			service.deleteReply(paramMap);
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> map = new HashMap<>();
		map.put("state", state);
		return map;
	}

	// 댓글의 답글 리스트 : AJAX-TEXT
	@RequestMapping(value = "listReplyAnswer")
	public String listReplyAnswer(@RequestParam int mateRe_parent, Model model) throws Exception {
		List<Reply> listReplyAnswer = service.listReplyAnswer(mateRe_parent);
		
		for (Reply dto : listReplyAnswer) {
			dto.setMateRe_content(dto.getMateRe_content().replaceAll("\n", "<br>"));
		}

		model.addAttribute("listReplyAnswer", listReplyAnswer);
		return "mate/listReplyAnswer";
	}

	// 댓글의 답글 개수 : AJAX-JSON
	@RequestMapping(value = "countReplyAnswer")
	@ResponseBody
	public Map<String, Object> countReplyAnswer(@RequestParam(value = "mateRe_parent") int mateRe_parent) {
		int count = service.replyAnswerCount(mateRe_parent);

		Map<String, Object> model = new HashMap<>();
		model.put("count", count);
		return model;
	}
	
}
