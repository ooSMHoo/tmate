package com.sp.trip.hostPage.reviewList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("reviewList.reviewListController")
@RequestMapping("/hostPage/reviewList/*")
public class ReviewListController {
	
	@RequestMapping("list")
	public String reviewList() throws Exception{
		
		return ".hostPage.reviewList.list";
	}
}
