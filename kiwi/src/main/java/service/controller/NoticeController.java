package service.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import common.util.CommonUtil;
import service.model.NoticeVO;
import service.model.PagingVO;
import service.service.NoticeService;


@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService notiService;
	@Autowired
	private CommonUtil util;
	
	
	private static final Logger log
	=LoggerFactory.getLogger(NoticeController.class);

	
	/*글쓰기폼으로 가기*/
	@RequestMapping("/service/noticeInsert.do")
	public void noticeInsert(){
	}
	
	/* 공지 작성*/
	@RequestMapping(value="/service/insert.do", 
			method=RequestMethod.POST)
	public String insertNotice(Model model,
			HttpServletRequest req,
			@ModelAttribute("notice") NoticeVO notice){
		
		MultipartHttpServletRequest mr
		=(MultipartHttpServletRequest) req;
		
		HttpSession ses=req.getSession();
		ServletContext ctx=ses.getServletContext();
		String UP_DIR=ctx.getRealPath("/images/notice");
		
		List<MultipartFile> mflist=mr.getFiles("nclip");
		
		for(int i=0;mflist!=null&&i<mflist.size();i++){
			MultipartFile mfile=mflist.get(i);
			
		
		try{
			mfile.transferTo(new File(UP_DIR,
					mfile.getOriginalFilename()));
			if(i==0){
				notice.setClip(mfile.getOriginalFilename());

					}
			
			
		}catch(IOException e){
			log.info("공지글 올리기 실패");
			e.getMessage();
		 }
		
		}//for--------------
		int n=notiService.insertNotice(notice);
		String msg=(n>0)?"공지 등록 성공 ":"공지 등록 실패";
		String loc=(n>0)?"../service/noticeList.do":"javascript:history.back()";
	
		
		return util.addMsgLoc(model,msg,loc);
	}
	
	
	/*리스트*/
	@RequestMapping(value="/service/noticeList.do")
	public String listNoticePaging(Model model,
			HttpServletRequest req,
			HttpSession ses,
			@ModelAttribute("paging")PagingVO paging,
			@RequestParam(defaultValue="0")int pageSize){
		
		if(pageSize==0){
			Integer ps=(Integer)ses.getAttribute("pageSize");
			if(ps==null){
				pageSize=10;
				;
			}else{
				pageSize=ps;
			}
	}
		//세션에 pageSize를 저장하자.	
		ses.setAttribute("pageSize",pageSize);
		
		int totalCount=notiService.getTotalCount(paging);
		paging.setTotalCount(totalCount);
		paging.setPageSize(pageSize);
		paging.init();
		//페이징 관련 연산을 수행하는 메소드 호출
		
		log.debug("Page={}", paging);
		
		//페이지 네비게이션 문자열을 반환하는 메소드 호출
		String myctx=req.getContextPath();
		String loc="service/noticeList.do";
		String pageNavi=paging.getPageNavi(myctx,loc);
		
		List<NoticeVO> noti
		=notiService.selectNoticeAll(paging);
		
		// 최신 글 순서대로 공지사항 불러오기
		List<NoticeVO> notiAside = notiService.selectNoticeBydate();
		
		model.addAttribute("noticeList",noti);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("paging",paging);
		model.addAttribute("pageNavi",pageNavi);
		
		model.addAttribute("notiAside", notiAside);
		
		return "service/noticeList";
		
	}
	
	/*뷰화면 보기*/
	@RequestMapping("/service/noticeView.do")
	public String viewNotice(Model model,
			@RequestParam(defaultValue="0")int nidx){
		
		boolean isUp=notiService.updateReadnum(nidx);
		
		NoticeVO notice
		=notiService.selectNoticeByNidx(nidx);
		
		// 최신 글 순서대로 공지사항 불러오기
		List<NoticeVO> notiAside = notiService.selectNoticeBydate();
		
		model.addAttribute("notice",notice);
		model.addAttribute("notiAside", notiAside);
		return "service/noticeView";
	}
	
	@RequestMapping("/service/noticeUpdateEnd.do")
	public void noticeUpdate(){
	}
	
	/*노티 삭제*/
	@RequestMapping(value="/service/noticeDelete.do"
			)
	public String deleteNotice(Model model,
			@RequestParam(defaultValue="0") int nidx)
	{
		log.debug("deleteNotice: idx={}",nidx);
		
		int n=notiService.deleteNotice(nidx);
		
		String msg=(n>0)?"공지 삭제 성공 ":"공지 삭제 실패";
		String loc=(n>0)?"../service/noticeList.do":"javascript:history.back()";
		
		return util.addMsgLoc(model,msg,loc);
	}
	/*수정 폼으로 */
	@RequestMapping(value="service/noticeUpdate.do")
	public String updateNoticeForm(Model model,
			HttpServletRequest req,
			@RequestParam(defaultValue="0")int nidx){
		
		if(nidx==0){
			return "redirect:/service/noticeList.do";
		}
		
		NoticeVO notice=notiService.selectNoticeByNidx(nidx);
		
		model.addAttribute("notice",notice);
		
		return "service/noticeUpdate";
	
	}
	
	/*노티 수정*/
	   /*노티 수정*/
	   @RequestMapping(value="service/updateNoticeEnd.do",
	         method=RequestMethod.POST)
	   public String updateNotice(Model model,
	         HttpServletRequest req,
	         @RequestParam(defaultValue="")String old_clip,
	         @ModelAttribute("notice") NoticeVO notice){
	      
	      MultipartHttpServletRequest mr
	      =(MultipartHttpServletRequest)req;
	      
	      HttpSession ses=req.getSession();
	      ServletContext ctx=ses.getServletContext();
	      String UP_DIR=ctx.getRealPath("/images/notice");
	      
	      log.debug("UP_DIR={}", UP_DIR);
	      
	      
	      /*MultipartFile mfile = mr.getFile("nclip");*/
	      
	      MultipartFile mfile;
	      
	      try {
	         mfile=mr.getFile("nclip");
	         // 업로드 하지 않았다면 기존 파일명으로
	         if(mfile==null||mfile.isEmpty()){
	            //tlnt.setTimg(old_timg);
	            notice.setClip(old_clip);
	         }else{
	         mfile.transferTo(new File(UP_DIR, mfile.getOriginalFilename()));
	         notice.setClip(mfile.getOriginalFilename());
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      
	      
	      }
	      int n=notiService.updateNotice(notice);
	      String msg=(n>0)? "수정 성공":"수정 실패";
	      String loc=(n>0)? "../service/noticeList.do":
	               "javascript:history.back()";
	      
	      return util.addMsgLoc(model,msg,loc);
	   }
	
	/*검색*/
	@RequestMapping("/service/noticeSearch.do")
	public void searchNotice(Model model,
			@RequestParam(defaultValue="")String keyword){
		List<NoticeVO> noticeList=notiService.searchNotice(keyword);
		
		// 최신 글 순서대로 공지사항 불러오기
		List<NoticeVO> notiAside = notiService.selectNoticeBydate();
		
		model.addAttribute("keyword",keyword);
		model.addAttribute("noticeList",noticeList);
		model.addAttribute("notiAside", notiAside);
	}
			
}
