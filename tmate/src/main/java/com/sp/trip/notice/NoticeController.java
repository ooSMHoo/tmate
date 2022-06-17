package com.sp.trip.notice;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.trip.common.FileManager;
import com.sp.trip.common.MyUtil;
import com.sp.trip.member.SessionInfo;

@Controller("anotice.noticeController") // 주소 모르겠어요. 특히 noticeController 밑에는 대문자로 시작하는데...?
@RequestMapping("/notice/*")
public class NoticeController {
	@Autowired
	private NoticeService service;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	
	// 타일즈 있으므로 리턴할 때 꼭 / 대신 .으로 하기!
	@RequestMapping(value="write", method=RequestMethod.GET)
	public String writeForm(Model model, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if (info.getMembership() < 51) { 
			
			return "redirect:/notice/list";
		}
		
		model.addAttribute("mode", "write");
		return ".notice.write";
	}
	
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String writeSubmit(Notice dto, HttpServletRequest req, HttpSession session) throws Exception{
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		if (info.getMembership() < 51) {
			return "redirect:/notice/list";
		}
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "notice";
			
			dto.setMemberId(info.getUserId());
			service.insertNotice(dto, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/notice/list";
	}
	
	@RequestMapping(value="list")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			Model model) throws Exception {
			
		int rows = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}
		
		
		// 다른 사람이 자료를 삭제하였을 경우!
		if(total_page<current_page){
			current_page = total_page;
		}
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Notice> list = service.listNotice(map);
		
		int listNum, n = 0;
		for (Notice dto : list) {
			listNum = dataCount - (start + n - 1);
			dto.setListNum(listNum);
			n++;
		}
		
	
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/notice/list";
		String articleUrl = cp + "/notice/article?page=" + current_page;
		if (keyword.length() != 0) {
			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}

		if (query.length() != 0) {
			listUrl = cp + "/notice/list?" + query;
			articleUrl = cp + "/notice/article?page=" + current_page + "&" + query;
		}

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("articleUrl", articleUrl);

		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);

		return ".notice.list";
	}
	
	
	
	@RequestMapping(value = "article", method=RequestMethod.GET)
	public String article(@RequestParam int noticeNum,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			Model model) throws Exception {

		keyword = URLDecoder.decode(keyword, "utf-8");

		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}
		
		// 조회수 증가
		service.updateHitCount(noticeNum);

		Notice dto = service.readNotice(noticeNum);
		if (dto == null) {
			return "redirect:/notice/list?" + query;
		}

		dto.setNoticeContent(dto.getNoticeContent().replaceAll("\n", "<br>"));
		
		
		// 이전 글, 다음 글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("noticeNum", noticeNum);
		
		Notice preReadDto = service.preReadNotice(map);
		Notice nextReadDto = service.nextReadNotice(map);

		// 파일
		List<Notice> listFile = service.listFile(noticeNum);

		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("listFile", listFile);
		model.addAttribute("page", page);
		model.addAttribute("query", query);

		return ".notice.article";
	}
	

	@RequestMapping(value="delete")
	public String delete(@RequestParam int noticeNum,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		keyword = URLDecoder.decode(keyword, "utf-8");
		String query = "page=" + page;
		
		if(keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword="+URLEncoder.encode(keyword, "utf-8");
		}
		
		if(info.getMembership() < 51) {
			return "redirect:/notice/list?" + query;
		}
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "notice";
			service.deleteNotice(noticeNum, pathname);
		} catch (Exception e) {
		}
		
		
		return "redirect:/notice/list?" + query;
	}
	
	
	
	@RequestMapping(value="download")
	public void download(@RequestParam int nfileNum,
			HttpServletResponse resp,
			HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "notice";
		
		boolean b = false;
		
		Notice dto = service.readFile(nfileNum);
		if(dto != null) {
			String nfileSav_name = dto.getNfileSav_name();
			String nfileOri_name = dto.getNfileOri_name();
			
			b = fileManager.doFileDownload(nfileSav_name, nfileOri_name, pathname, resp);	
		}
		
		if(! b) {
			try {
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('파일 다운로드가 불가능합니다. 관리자에게 문의하세요.');history.back();</script>");
			} catch (Exception e) {
			}
		}
	}
	
	
	@RequestMapping(value="zipdownload")
	public void zipdownload(@RequestParam int noticeNum,
			HttpServletResponse resp,
			HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "notice";
		
		boolean b = false;
		
		List<Notice> listFile = service.listFile(noticeNum);
		if(listFile.size() > 0 ) {
			String[] sources = new String[listFile.size()];
			String[] originals = new String[listFile.size()];
			String zipFilename = noticeNum + ".zip";
			
			for (int idx = 0; idx < listFile.size(); idx++) {
				sources[idx] = pathname + File.separator + listFile.get(idx).getNfileSav_name();
				originals[idx] = File.separator + listFile.get(idx).getNfileOri_name();
			}
			
			b = fileManager.doZipFileDownload(sources, originals, zipFilename, resp);
		}
		
		if(! b) {
			try {
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('파일 다운로드가 불가능합니다. 관리자에게 문의하세요.');history.back();</script>");
			} catch (Exception e) {
			}
		}
	}
	
	
	@RequestMapping(value="deleteFile", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteFile(@RequestParam int nfileNum, HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "notice";
		
		Notice dto = service.readFile(nfileNum);
		if(dto != null) {
			fileManager.doFileDelete(dto.getNfileSav_name(), pathname);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("field", "nfileNum");
		map.put("num", nfileNum);
		service.deleteFile(map);
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", "true");
		
		return model;
	}
	
	
	@RequestMapping(value="update", method = RequestMethod.GET)
	public String updateForm(@RequestParam int noticeNum,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Notice dto = service.readNotice(noticeNum);
		if (dto == null || ! info.getUserId().equals(dto.getMemberId())) {
			return "redirect:/notice/list?page=" + page;
		}
		
		List<Notice> listFile = service.listFile(noticeNum);
		
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
		model.addAttribute("listFile", listFile);
		
		return ".notice.write";
	}
	
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String updateSubmit(Notice dto, @RequestParam String page, HttpSession session) throws Exception{
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if (info.getMembership() < 51) {
			return "redirect:/notice/list?page=" + page;
		}
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "notice";

			dto.setMemberId(info.getUserId());
			service.updateNotice(dto, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/notice/list?page=" + page;
	}
			
	
	
	

}
