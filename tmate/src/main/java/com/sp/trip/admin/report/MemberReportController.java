package com.sp.trip.admin.report;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.trip.common.MyUtil;

@Controller("admin.report.memberReportController")
@RequestMapping("/admin/report/*")
public class MemberReportController {
	@Autowired
	private MemberReportService service;
	
	@Autowired
	@Qualifier("myUtilGeneral")
	private MyUtil myUtil;
	
	@RequestMapping("hostReportList")
	public String memberManage(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "mhId") String condition,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "") String hrCode,
			HttpServletRequest req,
			Model model) throws Exception {

		// 호스트 리스트
		
		String cp = req.getContextPath();

		int rows = 10;
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}

		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hrCode", hrCode);
		map.put("condition", condition);
		map.put("keyword", keyword);

		dataCount = service.dataCountHost(map);
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

		// 호스트 리스트
		List<Member> list = service.listHost(map);

		// 리스트의 번호
		int listNum, n = 0;
		for (Member dto : list) {
			listNum = dataCount - (start + n - 1);
			dto.setListNum(listNum);
			n++;
		}

		String query = "";
		String listUrl = cp + "/admin/report/hostReportList";

		if (keyword.length() != 0) {
			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}

		if (hrCode.length() != 0) {
			if (query.length() != 0)
				query = query + "&mhEnabled=" + hrCode;
			else
				query = "mhEnabled=" + hrCode;
		}
		
		if (query.length() != 0) {
			listUrl = listUrl + "?" + query;
		}

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("hrCode", hrCode);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);

		return ".admin.report.hostReportList";
	}
	
	@RequestMapping(value="updateHrCode", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateHrCode(@RequestParam Map<String, Object> paramMap) throws Exception {
		
		String state = "true";
		try {
			service.updateHrCode(paramMap);
		} catch (Exception e) {
			state = "false";
		}
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;

	}
	
	@RequestMapping(value="updateHostEnabled", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateHostEnabled(@RequestParam Map<String, Object> paramMap) throws Exception {
		
		String state = "true";
		
		try {
			service.updateHostEnabled(paramMap);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;

	}
	

}
