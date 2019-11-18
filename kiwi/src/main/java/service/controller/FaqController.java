package service.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import service.controller.FaqController;
import common.util.CommonUtil;
import service.model.FaqDAO;
import service.model.FaqVO;
import service.service.FaqService;

@Controller
@RequestMapping("/service")
public class FaqController {

	@Autowired
	private FaqService faq;
	
	@Autowired
	private CommonUtil util;
	
	private static final Logger log
	=LoggerFactory.getLogger(FaqController.class);
	
	
	//@Autowried 객체를 주입할 때 사용
	//type(자료형)w으로 주입함
	//동일한 자료형의 객체가 여러 개 있을 떄는
	//@Qualifier 를 이용해 어떤 객체인지 지정한다.
	
	@RequestMapping(value="/faqListView.do")
	public void faqList(Model model){
		
		
		List<FaqVO> flist=faq.allFaqList(1);
		List<FaqVO> flist2=faq.allFaqList(2);
		List<FaqVO> flist3=faq.allFaqList(3);
		List<FaqVO> flist4=faq.allFaqList(4);
		List<FaqVO> flist5=faq.allFaqList(5);
		
		model.addAttribute("flist1",flist);
		model.addAttribute("flist2",flist2);
		model.addAttribute("flist3",flist3);
		model.addAttribute("flist4",flist4);
		model.addAttribute("flist5",flist5);
		
	}
	
	
	
}
