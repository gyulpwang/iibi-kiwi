package help.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import common.service.KiwiService;
import common.util.CommonUtil;
import help.model.HelpVO;
import help.model.PagingVO;
import help.model.SuggestVO;
import help.service.HelpService;
import member.model.MemberVO;
import talent.model.CategoryVO;

@Controller
@RequestMapping("/help")
public class HelpController {

	@Autowired
	private KiwiService kiwi;

	@Autowired
	private HelpService helpService;

	@Autowired
	CommonUtil util;

	private static final Logger log = LoggerFactory.getLogger(HelpController.class);

	/*
	 * @RequestMapping("/helpmain.do") public void showIndex(){ //뷰이름이 반환되지 않으면
	 * //RequestMapping에 지정된 매핑 url에 //.do를 빼고 .jsp를 붙여 찾아간다.
	 * //WEB-INF/view/index.jsp }
	 */
	@RequestMapping(value = "helpwrite.do", method = RequestMethod.GET)
	public String helpwrite(Model model) {

		List<CategoryVO> upList = kiwi.getUpCategory();

		model.addAttribute("upList", upList);

		return "help/helpwrite";
	}

	@RequestMapping("/selectDownCate.do")
	public @ResponseBody List<CategoryVO> selectDownCate(@RequestParam(defaultValue = "0") int upcode) {
		List<CategoryVO> dwList = kiwi.getDwCategory(upcode);
		return dwList;
	}// ---------------------------

	@RequestMapping(value = "helpwrite.do", method = RequestMethod.POST)
	public String insertHelp(Model model, @ModelAttribute("help") HelpVO help) {
		int n = this.helpService.insertHelp(help);
		String msg = (n > 0) ? "도와주세요 성공!" : "도와주세요 실패!";
		String loc = (n > 0) ? "helpmain.do" : "javascript:history.back()";

		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "memo/message";
	}

	@RequestMapping("/helpmain.do")
	public String listHelpPaging(Model model, HttpServletRequest req, HttpSession ses,
			@ModelAttribute("paging") PagingVO paging, @RequestParam(defaultValue = "0") int pageSize,
			@RequestParam(defaultValue = "0") int dwcode, @RequestParam(defaultValue = "0") int upcode) {

		if (pageSize == 0) {
			Integer ps = (Integer) ses.getAttribute("pageSize");
			if (ps == null) {
				pageSize = 10;
				;
			} else {
				pageSize = ps;
			}
		}

		int sugcnt = kiwi.getCntSug();
		model.addAttribute("sugcnt", sugcnt);
		
		ses.setAttribute("pageSize", pageSize);

		int totalCount = helpService.getTotalCount(paging);
		paging.setTotalCount(totalCount);
		paging.setPageSize(10);
		paging.init();

		/*
		 * int totalCate = helpService.selectCate(upcode);
		 */
		int[] num;
		num = new int[5];

		for (int i = 0; i < 5; i++) {
			num[i] = helpService.selectCate(i + 1);
			model.addAttribute("cnt" + i, num[i]);
		}
		int total = kiwi.getTotalMember();

		log.debug("Page={}", paging);

		String myctx = req.getContextPath();
		String loc = "help/helpmain.do";
		String pageNavi = paging.getPageNavi(myctx, loc);

		CategoryVO cate = helpService.infoByCate(dwcode);
		CategoryVO upcate = helpService.infoByUpCate(upcode);
		List<HelpVO> arr = helpService.selectHelpAll(paging);
		List<CategoryVO> arr2 = helpService.infoByCategory();
		List<CategoryVO> arr3 = helpService.infoByUpCategory();

		model.addAttribute("totalmember", total);
		model.addAttribute("helpcount", totalCount);
		/* model.addAttribute("upcount",upcode); */
		model.addAttribute("cate", cate);
		model.addAttribute("upcate", upcate);
		model.addAttribute("helpList", arr);
		model.addAttribute("catename", arr2);
		model.addAttribute("upcatename", arr3);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("paging", paging);
		model.addAttribute("pageNavi", pageNavi);

		return "help/helpmain";
	}

	@RequestMapping("/helpSearch.do")
	public void searchNotice(Model model, @RequestParam(defaultValue = "") String keyword, HttpSession ses,
			HttpServletRequest req,
			@ModelAttribute("paging") PagingVO paging, @RequestParam(defaultValue = "0") int pageSize,
			@RequestParam(defaultValue = "0") int dwcode, @RequestParam(defaultValue = "0") int upcode) {

		int sugcnt = kiwi.getCntSug();
		model.addAttribute("sugcnt", sugcnt);
		
		if (pageSize == 0) {
			Integer ps = (Integer) ses.getAttribute("pageSize");
			if (ps == null) {
				pageSize = 10;
				;
			} else {
				pageSize = ps;
			}
		}

		ses.setAttribute("pageSize", pageSize);

		int totalCount = helpService.getTotalCount(paging);
		paging.setTotalCount(totalCount);
		paging.setPageSize(10);
		paging.init();

		/*
		 * int totalCate = helpService.selectCate(upcode);
		 */
		int[] num;
		num = new int[5];

		for (int i = 0; i < 5; i++) {
			num[i] = helpService.selectCate(i + 1);
			model.addAttribute("cnt" + i, num[i]);
		}
		int total = kiwi.getTotalMember();

		log.debug("Page={}", paging);

		String myctx = req.getContextPath();
		String loc = "help/helpmain.do";
		String pageNavi = paging.getPageNavi(myctx, loc);

		CategoryVO cate = helpService.infoByCate(dwcode);
		CategoryVO upcate = helpService.infoByUpCate(upcode);
		List<HelpVO> arr = helpService.selectHelpAll(paging);
		List<CategoryVO> arr2 = helpService.infoByCategory();
		List<CategoryVO> arr3 = helpService.infoByUpCategory();

		
		
		List<HelpVO> helpList = helpService.searchHelp(keyword);

		model.addAttribute("keyword", keyword);
		model.addAttribute("helpList", helpList);
		model.addAttribute("totalmember", total);
		model.addAttribute("helpcount", totalCount);
		/* model.addAttribute("upcount",upcode); */
		model.addAttribute("cate", cate);
		model.addAttribute("upcate", upcate);
		model.addAttribute("catename", arr2);
		model.addAttribute("upcatename", arr3);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("paging", paging);
		model.addAttribute("pageNavi", pageNavi);

	}

	@RequestMapping("/helpDetail.do")
	public String viewHelp(Model model, @RequestParam(defaultValue = "0") int helpidx) {
		log.debug("viewHelp: helpidx={}", helpidx);
		HelpVO help = helpService.selectHelpByhidx(helpidx);

		CategoryVO cate = helpService.DetailCate(helpidx);// 글번호참조
		int n = helpService.selectSuggestCount(helpidx);// 글번호참조
		List<SuggestVO> svo = helpService.selectSuggestName(helpidx);// 글번호참조

		model.addAttribute("count", n);
		model.addAttribute("sname", svo);
		model.addAttribute("cate", cate);
		model.addAttribute("help", help);
		return "help/helpDetail";
	}

	@RequestMapping("/choiceSuggest.do")
	public @ResponseBody Map<String, Integer> suggestHelp(Model model, HttpSession ses,
			@RequestParam(defaultValue = "0") int helpidx, @RequestParam(defaultValue = "0") int no,
			@RequestParam(defaultValue = "0") int iprice) {
		int n = helpService.choiceSuggest(helpidx, no);
		int m = helpService.updateSuggest(helpidx);
		int h = helpService.updateSuggestSmode(helpidx, no);
		MemberVO loginMember = (MemberVO) ses.getAttribute("loginMember");
		int midx = loginMember.getMidx();
		// 1. 제안하기 선택 시 도움을 요청한 회원의 구매금액(buy)에 제안 금액만큼 추가(Member쪽에 함수 추가)
		int a = helpService.updateBuySug(midx, iprice);

		int b = helpService.updateSellSug(no, iprice);
		// 2. 자신의 제안이 선택받은 사람은 자신의 판매금액(sell)에 제안 금액만큼 추가

		// 3. 제안 선택 버튼을 눌렀을 때 바로 결제되는 방식으로.

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("n", n);
		map.put("m", m);
		map.put("h", h);
		model.addAttribute("map", map);

		return map;
	}

	@RequestMapping(value = "/helpdelete.do")
	public String deleteHelp(Model model, @RequestParam(defaultValue = "0") Integer helpidx) {
		String msg = "", loc = "";
		int n = helpService.deleteHelp(helpidx);
		msg = (n > 0) ? "도와주세요 삭제 성공." : "도와주세요 삭제 실패";
		loc = "helpmain.do";
		return util.addMsgLoc(model, msg, loc);
	}

	@RequestMapping(value = "/helpupdate.do")
	public String updateHelp(Model model, @RequestParam(defaultValue = "") Integer helpidx) {
		List<CategoryVO> upList = kiwi.getUpCategory();

		model.addAttribute("upList", upList);

		HelpVO help = helpService.selectHelpByhidx(helpidx);

		model.addAttribute("help", help);

		return "help/helpedit";

	}

	@RequestMapping("/helpupdateEnd.do")
	public String updateEnd(Model model, @ModelAttribute("help") HelpVO help) {

		int n = helpService.updateHelp(help);

		String msg = (n > 0) ? "도와주세요 수정 성공!" : "도와주세요 수정 실패!";
		String loc = (n > 0) ? "helpmain.do" : "javascript:history.back()";

		return util.addMsgLoc(model, msg, loc);
	}

	@RequestMapping("suggestwrite.do")
	public String suggestForm(Model model, @RequestParam(defaultValue = "0") int helpidx
	/* @RequestParam(defaultValue="") String title */) {
		if (helpidx == 0) {
			return "redirect:helpmain.do";
		}
		model.addAttribute("helpidx", helpidx);
		/* model.addAttribute("title",title); */
		return "help/suggest";
	}

	/*
	 * @RequestMapping(value="/suggestwriteEnd.do", method=RequestMethod.POST)
	 * public String suggestwriteEnd(Model model,
	 * 
	 * @RequestParam("suggest")SuggestVO suggest){
	 * 
	 * int n = helpService.insertSuggest(suggest);
	 * 
	 * String msg=(n>0)?"제안하기 성공!":"제안하기 실패!"; String
	 * loc=(n>0)?"helpmain.do":"javascript:history.back()"; return
	 * util.addMsgLoc(model, msg, loc);
	 * 
	 * }
	 */

	@RequestMapping(value = "/suggestwriteEnd.do", method = RequestMethod.POST)
	public String suggestwriteEnd(Model model, @ModelAttribute("suggest") SuggestVO suggest) {

		int n = helpService.insertSuggest(suggest);

		String msg = (n > 0) ? "제안하기 성공!" : "제안하기 실패!";
		String loc = (n > 0) ? "helpmain.do" : "javascript:history.back()";
		return util.addMsgLoc(model, msg, loc);

	}

}
