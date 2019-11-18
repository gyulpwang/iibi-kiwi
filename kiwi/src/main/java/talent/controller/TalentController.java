package talent.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import common.service.KiwiService;
import common.util.CommonUtil;
import member.model.MemberVO;
import talent.model.CategoryVO;
import talent.model.PagingVO;
import talent.model.ReviewVO;
import talent.model.TalentVO;

@Controller
public class TalentController {

	@Autowired
	private KiwiService kiwi;
	
	@Autowired
	private CommonUtil util;
	
	@Autowired
	private static final Logger log = LoggerFactory.getLogger(TalentController.class);
	
	@RequestMapping("/member/talent/selectUpCate.do")
	public @ResponseBody List<CategoryVO> selectUpCate(){
		List<CategoryVO> upList=kiwi.getUpCategory();
		return upList;
	}//---------------------------
	
	@RequestMapping("/member/talent/selectDownCate.do")
	public @ResponseBody List<CategoryVO> selectDownCate(
			@RequestParam(defaultValue="0") int upcode){
		List<CategoryVO> dwList=kiwi.getDwCategory(upcode);
		return dwList;
	}//---------------------------
	
	/** 재능 목록 조회 */
/*	@RequestMapping("/talent/talentList.do")
	public void talentList(Model model){
		List<TalentVO> tlist = kiwi.allTalentList();
		List<CategoryVO> upList = kiwi.getUpCategory();
		
		model.addAttribute("tlist", tlist);
		model.addAttribute("upList", upList);
	}*/
		
	/** 재능 목록 조회 - 페이징 처리 */
	@RequestMapping("/talent/talentList.do")
	public String talentListPaging(Model model,
			HttpServletRequest req, HttpSession ses,
			@ModelAttribute("paging")PagingVO paging,
			@RequestParam(defaultValue="0")int pageSize){
		
		if(pageSize==0){
			Integer ps=(Integer)ses.getAttribute("pageSize");
			if(ps==null){pageSize=9;}
			else{pageSize=ps;}
		}
		
		//세션에 pageSize를 저장하자.	
		ses.setAttribute("pageSize",pageSize);

		// 상위 분류 가져오기
		List<CategoryVO> upList = kiwi.getUpCategory();
		
		int totalCount=kiwi.getTotalCount(paging);
		paging.setTotalCount(totalCount);
		paging.setPageSize(pageSize);
		paging.init();
		
		//페이징 관련 연산을 수행하는 메소드 호출
		log.debug("Page={}", paging);
		
		//페이지 네비게이션 문자열을 반환하는 메소드 호출
		String myctx=req.getContextPath();
		String loc="talent/talentList.do";
		String pageNavi=paging.getPageNavi(myctx,loc);
		
		List<TalentVO> tlist =kiwi.talentListPaging(paging);
		
		model.addAttribute("tlist",tlist);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("paging",paging);
		model.addAttribute("pageNavi",pageNavi);
		model.addAttribute("upList", upList);
		
		return "talent/talentList";
		
	}
	
	/** 상위분류 선택한 재능목록조회 */
	/*@RequestMapping("/talent/talentUpCate.do")
	public String talentListByUpCate(Model model,
			@RequestParam(defaultValue="0")int upcode){
		
		if(upcode<1 || upcode>5){
			return util.addMsgLoc(model, "잘못 들어온 경로입니다.", "/KIWI/kiwi/home.do");
		}
		
		List<CategoryVO> upBannerList=kiwi.infoByUpCate(upcode);
		List<TalentVO> tlist=kiwi.selectByUpCate(upcode);
				
		model.addAttribute("upcode", upcode);
		model.addAttribute("upBannerList", upBannerList);
		model.addAttribute("tlist", tlist);
		return "talent/talentListByUpCategory";
	}*/
	
	/** 상위분류 선택한 재능목록조회 - 페이징처리 */
	@RequestMapping("/talent/talentUpCate.do")
	public String talentListUpPaging(Model model,
			HttpServletRequest req, HttpSession ses,
			@RequestParam(defaultValue="0")int upcode,
			@ModelAttribute("paging")PagingVO paging,
			@RequestParam(defaultValue="0")int pageSize){
		
		if(upcode<1 || upcode>5){
			return util.addMsgLoc(model, "잘못 들어온 경로입니다.", "/KIWI/kiwi/home.do");
		}
		
		if(pageSize==0){
			Integer ps=(Integer)ses.getAttribute("pageSize");
			if(ps==null){pageSize=9;}
			else{pageSize=ps;}
		}
		
		//세션에 pageSize를 저장하자.	
		ses.setAttribute("pageSize",pageSize);

		int totalCount=kiwi.getTotalCountUp(paging, upcode);
		paging.setTotalCount(totalCount);
		paging.setPageSize(pageSize);
		paging.init();
		
		//페이지 네비게이션 문자열을 반환하는 메소드 호출
		String myctx=req.getContextPath();
		String loc="talent/talentUpCate.do";
		String pageNavi=paging.getPageNaviUp(myctx,loc, upcode);
		
		List<TalentVO> tlist =kiwi.talentListUpPaging(paging, upcode);
		List<CategoryVO> upBannerList=kiwi.infoByUpCate(upcode);
		
		model.addAttribute("tlist",tlist);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("paging",paging);
		model.addAttribute("pageNavi",pageNavi);
		model.addAttribute("upBannerList", upBannerList);
		model.addAttribute("upcode", upcode);
		
		return "talent/talentListByUpCategory";
	}
	
	/** 하위분류 선택한 재능목록조회 */
	/*@RequestMapping("/talent/talentDwCate.do")
	public String talentListByDwCate(Model model, HttpSession ses, 
			@RequestParam(defaultValue="0")int upcode, 
			@RequestParam(defaultValue="0")int dwcode){
		
		if((upcode<1 || upcode>5) && (dwcode<1 || dwcode>6)){
			return util.addMsgLoc(model, "잘못 들어온 경로입니다.", "/KIWI/kiwi/home.do");
		}
		
		List<CategoryVO> upBannerList=kiwi.infoByUpCate(upcode);				
		List<TalentVO> tlist=kiwi.selectByDwCate(upcode, dwcode);

		model.addAttribute("upcode", upcode);
		model.addAttribute("dwcode", dwcode);
		model.addAttribute("upBannerList", upBannerList);
		model.addAttribute("tlist", tlist);
		
		return "talent/talentListByDwCategory";
	}*/
	
	/** 하위분류 선택한 재능목록조회 - 페이징처리 */
	@RequestMapping("/talent/talentDwCate.do")
	public String talentListDwPaging(Model model,
			HttpServletRequest req, HttpSession ses,
			@RequestParam(defaultValue="0")int upcode,
			@RequestParam(defaultValue="0")int dwcode,
			@ModelAttribute("paging")PagingVO paging,
			@RequestParam(defaultValue="0")int pageSize){
		
		if((upcode<1 || upcode>5) && (dwcode<1 || dwcode>6)){
			return util.addMsgLoc(model, "잘못 들어온 경로입니다.", "/KIWI/kiwi/home.do");
		}
		
		if(pageSize==0){
			Integer ps=(Integer)ses.getAttribute("pageSize");
			if(ps==null){pageSize=9;}
			else{pageSize=ps;}
		}
		
		//세션에 pageSize를 저장하자.	
		ses.setAttribute("pageSize",pageSize);

		int totalCount=kiwi.getTotalCountDw(paging, dwcode);
		paging.setTotalCount(totalCount);
		paging.setPageSize(pageSize);
		paging.init();
		
		//페이지 네비게이션 문자열을 반환하는 메소드 호출
		String myctx=req.getContextPath();
		String loc="talent/talentDwCate.do";
		String pageNavi=paging.getPageNaviUp(myctx,loc, upcode);
		
		List<TalentVO> tlist =kiwi.talentListDwPaging(paging, upcode, dwcode);
		List<CategoryVO> upBannerList=kiwi.infoByUpCate(upcode);
		
		model.addAttribute("tlist",tlist);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("paging",paging);
		model.addAttribute("pageNavi",pageNavi);
		model.addAttribute("upBannerList", upBannerList);
		model.addAttribute("upcode", upcode);
		model.addAttribute("dwcode", dwcode);
		
		return "talent/talentListByDwCategory";
	}
	
	/** 재능 상세보기 */
	@RequestMapping("/talent/talentDetail.do")
	public String talentDeatil(Model model, @RequestParam(defaultValue="0")int tnum){
		if(tnum == 0){return util.addMsgLoc(model, "잘못 들어온 경로입니다.", "/KIWI/kiwi/home.do");}
		
		// 재능 정보 가져오기
		TalentVO tlnt = kiwi.selectByTnum(tnum);
		
		// 판매자 정보 가져오기
		MemberVO memberInfo = kiwi.selectByMidx(tlnt.getMidx());
		
		// 해당 재능에 대한 후기 (재능번호로) 가져오기
		List<ReviewVO> rvList=kiwi.getRvList(tnum);
		
		// 총 리뷰 갯수 가져오기
		int rcnt = kiwi.getRvCount(tnum);

		// 리뷰 평점 내기
		if(rcnt == 0){rcnt = 0;}
		if(rcnt != 0){
			int ravg = (int)kiwi.getRscoreAvg(tnum);
			model.addAttribute("ravg", ravg);
		}
		
		model.addAttribute("rcnt", rcnt);
		model.addAttribute("tlnt", tlnt);
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("rvList", rvList);
		
		return "talent/talentDetail";
	}
	
	/** 재능등록 폼으로 이동하기 */
	@RequestMapping("/member/talent/insertTalent.do")
	public String insertTalent(Model model){
		List<CategoryVO> upList = kiwi.getUpCategory();
		
		model.addAttribute("upList", upList);
		
		return "talent/insertTalent";
	}
	
	/** 재능등록 처리 */
	@RequestMapping(value="/member/talent/insertTalentEnd.do", method=RequestMethod.POST)
	public String insertTalent(Model model, HttpServletRequest req, @ModelAttribute("tlnt") TalentVO tlnt){
		
		//1. 파일 업로드 처리
		MultipartHttpServletRequest mr =(MultipartHttpServletRequest)req;
		
		//1_1. 업로드 디렉토리 절대경로 구하기(컨텍스트/images/이미지파일)
		HttpSession ses=req.getSession();
		ServletContext ctx=ses.getServletContext();
		String UP_DIR=ctx.getRealPath("/images/talent/talent_timg");
		log.debug("UP_DIR={}", UP_DIR);
		
		//1_2. 파일 업로드 처리
		MultipartFile mfile = mr.getFile("mtimg");
		try {
			mfile.transferTo(new File(UP_DIR, mfile.getOriginalFilename()));
			tlnt.setTimg(mfile.getOriginalFilename());
		} catch (Exception e) {
			e.printStackTrace();
		}

		//2. db입력 처리
		int n = kiwi.insertTalent(tlnt);
		
		String msg=(n>0)?"재능 등록 성공":"재능 등록 실패";
		String loc=(n>0)?"/KIWI/talent/talentList.do":"javascript:history.back()";
		
		return util.addMsgLoc(model,msg,loc);
	}
	
	
	/** 재능수정 폼으로 이동하기 */
	@RequestMapping(value="/member/talent/updateTalent.do")
	public String updateTalent(Model model, @RequestParam(defaultValue="0")int tnum){
		
		TalentVO tlist = kiwi.selectByTnum(tnum);
		CategoryVO tCateNameList = kiwi.getUpDwName(tnum);

		model.addAttribute("tlist", tlist);
		model.addAttribute("tCateNameList", tCateNameList);
		
		return "talent/updateTalent";
	}
	
	/** 재능수정 처리 */
	@RequestMapping(value="/member/talent/updateTalentEnd2.do", method=RequestMethod.POST)
	public String updateTalent2(Model model, HttpServletRequest req, @ModelAttribute("tlnt") TalentVO tlnt){
		
		//1. 파일 업로드 처리
		MultipartHttpServletRequest mr =(MultipartHttpServletRequest)req;
		
		//1_1. 업로드 디렉토리 절대경로 구하기(컨텍스트/images/이미지파일)
		HttpSession ses=req.getSession();
		ServletContext ctx=ses.getServletContext();
		String UP_DIR=ctx.getRealPath("/images/talent/talent_timg");
		log.debug("UP_DIR={}", UP_DIR);
		
		//1_2. 파일 업로드 처리
		MultipartFile mfile = mr.getFile("mtimg");
		try {
			mfile.transferTo(new File(UP_DIR, mfile.getOriginalFilename()));
			tlnt.setTimg(mfile.getOriginalFilename());
		} catch (Exception e) {
			e.printStackTrace();
		}

		//2. db입력 처리
		int n = kiwi.updateTalent(tlnt);
		
		String msg=(n>0)?"재능 수정 성공":"재능 수정 실패";
		String loc=(n>0)?"/KIWI/talent/talentList.do":"javascript:history.back()";
		
		return util.addMsgLoc(model,msg,loc);
	}
	
	@RequestMapping(value="/member/talent/updateTalentEnd.do", method=RequestMethod.POST)
	public String updateTalent(Model model, HttpServletRequest req, 
			@RequestParam(defaultValue="")String old_timg,
			@ModelAttribute("tlnt") TalentVO tlnt){
		//1. 파일 업로드 처리
		MultipartHttpServletRequest mr =(MultipartHttpServletRequest)req;
		
		//1_1. 업로드 디렉토리 절대경로 구하기(컨텍스트/images/이미지파일)
		HttpSession ses=req.getSession();
		ServletContext ctx=ses.getServletContext();
		String UP_DIR=ctx.getRealPath("/images/talent/talent_timg");
		log.debug("UP_DIR={}", UP_DIR);
		
		MultipartFile mfile;
		//1_2. 파일 업로드 처리
		try {
			mfile=mr.getFile("mtimg");
			// 업로드 하지 않았다면 기존 파일명으로
			if(mfile==null||mfile.isEmpty()){
				tlnt.setTimg(old_timg);
			}else{
				mfile.transferTo(new File(UP_DIR, mfile.getOriginalFilename()));
				tlnt.setTimg(mfile.getOriginalFilename());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//2. db입력 처리
		int n = kiwi.updateTalent(tlnt);
		
		String msg=(n>0)?"재능 수정 성공":"재능 수정 실패";
		String loc=(n>0)?"/KIWI/talent/talentList.do":"javascript:history.back()";
		
		return util.addMsgLoc(model,msg,loc);
	}
	
	/** 재능삭제 처리 */
	@RequestMapping(value="/member/talent/deleteTalent.do")
	public String deleteTalent(Model model, @RequestParam(defaultValue="0")int tnum){
		
		int n = kiwi.deleteTalent(tnum);
		
		String msg=(n>0)?"재능 삭제 성공":"재능 삭제 실패";
		String loc=(n>0)?"/KIWI/talent/talentList.do":"javascript:history.back()";
		
		return util.addMsgLoc(model,msg,loc);
	}
	
	/** 관리자 - 재능삭제 처리 */
	@RequestMapping(value="/admin/talent/deleteTalent.do")
	public String adminDeleteTalent(Model model, @RequestParam(defaultValue="0")int tnum){
		
		int n = kiwi.deleteTalent(tnum);
		
		String msg=(n>0)?"재능 삭제 성공":"재능 삭제 실패";
		String loc=(n>0)?"/KIWI/talent/talentList.do":"javascript:history.back()";
		
		return util.addMsgLoc(model,msg,loc);
	}
	
	/** 재능검색 처리 */
/*	@RequestMapping("/talent/searchTalent.do")
	public void searchTalent(Model model, 
			@RequestParam(defaultValue="")String keyword){
		List<TalentVO> tlist = kiwi.searchTalent(keyword);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("tlist", tlist);
	}*/
	
	/** 재능검색 처리 - 페이징 처리 */
	@RequestMapping("/talent/searchTalent.do")
	public String talentListDwPaging(Model model,
			HttpServletRequest req, HttpSession ses,
			@RequestParam(defaultValue="")String keyword,
			@ModelAttribute("paging")PagingVO paging,
			@RequestParam(defaultValue="0")int pageSize){
		
		
		if(pageSize==0){
			Integer ps=(Integer)ses.getAttribute("pageSize");
			if(ps==null){pageSize=9;}
			else{pageSize=ps;}
		}
		
		//세션에 pageSize를 저장하자.	
		ses.setAttribute("pageSize",pageSize);
		
		int totalCount=kiwi.getTotalCountSch(paging, keyword);
		paging.setTotalCount(totalCount);
		paging.setPageSize(pageSize);
		paging.init();
		
		//페이지 네비게이션 문자열을 반환하는 메소드 호출
		String myctx=req.getContextPath();
		String loc="talent/talentDwCate.do";
		paging.setKeyword(keyword);
		String pageNavi=paging.getPageNavi(myctx,loc);
		
		List<TalentVO> tlist = kiwi.searchTalentPaging(paging, keyword);
		
		model.addAttribute("tlist",tlist);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("paging",paging);
		model.addAttribute("pageNavi",pageNavi);
		model.addAttribute("keyword", keyword);
		
		return "talent/searchTalent";
	}

	
	@RequestMapping("/member/talent/buyTalent.do")
	public String buyTalent(){
		
		return "talent/buyTalent";
	}
	
	/** ****************************** 후기 관련 ****************************** **/
	/** 전체 후기 가져오기 */
	/*@RequestMapping("/talent/moreReviews.do")
	public void moreRvList(Model model, @RequestParam(defaultValue="0")int tnum){
		List<ReviewVO> rvList = kiwi.getRvList(tnum);
		
		model.addAttribute("rvList", rvList);
	}*/
	
	/** 후기 작성 */
	@RequestMapping(value="/member/talent/insertReview.do", method=RequestMethod.POST)
	public String insertReview(Model model, @ModelAttribute("review") ReviewVO review){
		int n = kiwi.insertReview(review);
		
		String msg=(n>0)?"후기 등록 성공":"후기 등록 실패";
		String loc=(n>0)?"/KIWI/talent/talentDetail.do?tnum="+review.getTnum():"javascript:history.back()";
		
		return util.addMsgLoc(model,msg,loc);
	}

	/** 후기 수정 폼으로 이동 */
	@RequestMapping(value="/member/talent/updateReview.do")
	public String updateReview(Model model, 
			@RequestParam(defaultValue="0")int tnum, @RequestParam(defaultValue="0")int rnum){
		
		TalentVO tlist = kiwi.selectByTnum(tnum);
		ReviewVO rvList = kiwi.selectByRnum(rnum);
		
		model.addAttribute("tlist", tlist);
		model.addAttribute("rvList", rvList);

		return "talent/updateReview";
	}
	
	/** 후기 수정 */
	@RequestMapping(value="/member/talent/updateReviewEnd.do", method=RequestMethod.POST)
	public String updateReviewEnd(Model model, @ModelAttribute("review") ReviewVO review){
		
		int n = kiwi.updateReview(review);
		
		String msg=(n>0)?"후기 수정 성공":"후기 수정 실패";
		String loc=(n>0)?"/KIWI/talent/talentDetail.do?tnum="+review.getTnum():"javascript:history.back()";
		
		return util.addMsgLoc(model,msg,loc);
	}
	
	/** 후기 삭제 */
	@RequestMapping(value="/member/talent/deleteReview.do")
	public String deleteReview(Model model, 
			@RequestParam(defaultValue="0")int tnum, @RequestParam(defaultValue="0")int rnum){
		
		int n = kiwi.deleteReview(rnum);
		
		String msg=(n>0)?"후기 삭제 성공":"후기 삭제 실패";
		String loc=(n>0)?"/KIWI/talent/talentDetail.do?tnum="+tnum:"javascript:history.back()";
		
		return util.addMsgLoc(model,msg,loc);
	}
	
	
}
