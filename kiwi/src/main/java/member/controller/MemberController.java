package member.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import common.service.KiwiService;
import help.model.SuggestVO;
import member.model.MemberVO;
import talent.model.OrderVO;


@Controller
public class MemberController {
	
	@Autowired
	private KiwiService kiwi;
	
	/**회원가입 폼 보여주기*/
	@RequestMapping(value="/kiwi/memberjoin.do",method=RequestMethod.GET)
	public String memberjoin(){
		return "member/memberjoin";
	}
	
	/**회원가입 처리-POST*/
	@RequestMapping(value="/kiwi/memberjoin.do",method=RequestMethod.POST)
	public String memberjoinEnd(Model model,
			@ModelAttribute("member") MemberVO member)
	{
		
		int n = kiwi.insertMember(member);
		
		String msg=(n>0)?"회원가입에 성공하였습니다!":"회원가입에 실패하였습니다.";
		String loc=(n>0)?"/KIWI/kiwi/home.do":"javascript:history.back()";
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "memo/message";
	}
	
	@RequestMapping(value="/emailCheck.do",method=RequestMethod.POST)
	public @ResponseBody int emailCheckForm(
			HttpServletResponse res,@RequestParam(defaultValue="")String email){
		res.setHeader("Cache-Control", "no-cache");
		int n = kiwi.emailCheck(email.trim());
		return n;
	}

	
	@RequestMapping(value="member/accountset.do",
			method=RequestMethod.POST)
	public String editForm(Model model,
			@RequestParam(defaultValue="0") int midx){
		MemberVO member=kiwi.findMemberByIdx(midx);
		model.addAttribute("member",member);
		return "member/accountset";
	}//-------------------------------
	
	@RequestMapping(value="/member/memberEditEnd.do",
			method=RequestMethod.POST)
	public String editEnd(Model model,
			@ModelAttribute("member") MemberVO member)
	{
		int n=kiwi.updateMember(member);
		String msg=(n>0)?"수정 성공":"수정 실패";
		String loc=(n>0)?"accountset.do":
			"javascript:history.back()";
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "memo/message";
	}//-------------------------------------
	/*<------------------------------------------------>*/
	
	/**전체 회원 목록 보기*/
	@RequestMapping("/admin/memberList.do")
	public String listMember(Model model,
			@RequestParam(defaultValue="1") int cpage)
	{
		//총 회원수 가져오기
		int total=kiwi.getTotalMember();
		int pageSize=5;
		int pageCount=(total-1)/pageSize+1;
		if(cpage<1){
			cpage=1;
		}
		if(cpage>pageCount){
			cpage=pageCount;
		}
		int end=cpage*pageSize;
		int start=end-(pageSize-1);
		
		List<MemberVO> arr=kiwi.getAllMembers(start,end);
		model.addAttribute("userList", arr);
		/*model.addAttribute("userTotal", total);
		model.addAttribute("pageCount",pageCount);
		model.addAttribute("cpage",cpage);*/
		
		return "admin/memberList";
	}//----------------------------
	
	/**검색한 회원 목록 보기*/
	@RequestMapping("/admin/memberFind.do")
	public String findMember(Model model,
			@RequestParam(defaultValue="0")int findType,
			@RequestParam(defaultValue="") String findString,
			@RequestParam(defaultValue="1") int cpage)
	{
		String colType="";
		switch(findType){
			case 0: colType="mname";break;
			case 1: colType="email";break;
					
		}
		
		//검색한 총 회원수 가져오기
		int total=kiwi.findMemberTotal(colType,findString);
		
		int pageSize=2;
		int pageCount=(total-1)/pageSize+1;
		if(cpage<1){
			cpage=1;
		}
		if(cpage>pageCount){
			cpage=pageCount;
		}
		int end=cpage*pageSize;
		int start=end-(pageSize-1);
		//검색한 회원 목록 가져오기
		List<MemberVO> arr
		=kiwi.findMember(colType,findString,start,end);
		
		model.addAttribute("userList", arr);
		model.addAttribute("userTotal", total);
		model.addAttribute("pageCount",pageCount);
		model.addAttribute("cpage",cpage);
		
		return "admin/memberFind";
	}//----------------------------
	
	@RequestMapping(value="/memberDel.do",
			method=RequestMethod.POST)
	public String deleteMember(
			Model model,
		@RequestParam(defaultValue="0") int idx)
	{
		if(idx==0){
			return "redirect:/memberList.do";
		}
		
		int n=kiwi.deleteMember(idx);
		String msg=(n>0)?"삭제 성공":"삭제 실패";
		model.addAttribute("msg",msg);
		model.addAttribute("loc","memberList.do");
		
		return "memo/message";
	}//-------------------------------
	
	@RequestMapping(value="/member/findpwd.do", method=RequestMethod.POST)
	public String finduserid(Model model, 
			@RequestParam ("namef")String mname,
			@RequestParam ("emailf")String email,
			@RequestParam ("telf")String tel) {		
			
			String m=kiwi.findUserEmail(mname, email, tel);

			model.addAttribute("findpwd",m);

			return "member/emailfind/find";

		}
	
	@RequestMapping(value="/member/findemail.do", method=RequestMethod.POST)
	public String findemail(Model model, 
			@RequestParam ("fname")String mname,
			@RequestParam ("ftel")String tel) {		
			String pwd1=kiwi.findUserEmail1(mname, tel);
			model.addAttribute("findemail",pwd1);
			return "member/emailfind/find";

		}

	@RequestMapping("/member/mypage.do")
	public void mypage(){
		
	}
	
	@RequestMapping("/member/memberEdit.do")
	public void memberedit(){
		
	}
	
	@RequestMapping("/member/accountset.do")
	public void accountset(){
		
	}
	@RequestMapping("/member/mybuy/mybuy.do")
	public void mybuy(){
		
	}
	@RequestMapping("/member/mybuy/buydetail.do")
	public void buydetail(){
		
	}
	@RequestMapping("/member/mysell/mysell.do")
	public void mysell(){
		
	}
	@RequestMapping("/member/mysell/selldetail.do")
	public void selldetail(){
		
	}
	
	/** 재능 통계 */
	@RequestMapping("/member/mypageajax/ajaxregtalent1.do")
	public void ajaxregtalent1(Model model, HttpSession ses){
		// 1. 판매 재능 갯수 및 내가 판매한 재능 목록 구하기
		MemberVO loginMember = (MemberVO)ses.getAttribute("loginMember");
		
		int scnt = kiwi.getMySellCnt(loginMember.getMidx());
		/*List<TalentVO> mysell= kiwi.getMySell(loginMember.getMidx());*/
		
		// 2. 구매 재능 갯수 및 내가 구매한 재능 목록 구하기
		int bcnt = kiwi.getMyBuyCnt(loginMember.getMidx());
		List<OrderVO> mybuy= kiwi.getMyBuy(loginMember.getMidx());
		
		// 3. 총 구매 금액 및 판매 금액 구하기
		int totbuy = kiwi.getTotBuy(loginMember.getMidx());
		int totsell = kiwi.getTotSell(loginMember.getMidx());
		
		model.addAttribute("scnt", scnt);
		/*model.addAttribute("mysell", mysell);*/
		model.addAttribute("bcnt", bcnt);
		model.addAttribute("mybuy", mybuy);
		model.addAttribute("totbuy", totbuy);
		model.addAttribute("totsell", totsell);
		
	}
	@RequestMapping("/member/mypageajax/ajaxregtalent2.do")
	public void ajaxregtalent2(Model model, HttpSession ses){
		MemberVO loginMember = (MemberVO) ses.getAttribute("loginMember");
		
		int totbuy = kiwi.getTotBuy(loginMember.getMidx());
		int hcnt = kiwi.getHelpCnt(loginMember.getMidx());
		List<SuggestVO> slist = kiwi.getMySellList(loginMember.getMidx());
		
		model.addAttribute("totbuy",totbuy);
		model.addAttribute("hcnt",hcnt);
		model.addAttribute("slist",slist);
		
	}
	@RequestMapping("/member/mypageajax/ajaxregtalent3.do")
	public void ajaxregtalent3(){
		
	}
	@RequestMapping("/member/mypageajax/ajaxregtalent4.do")
	public void ajaxregtalent4(){
		
	}
}
