package talent.controller;

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

import common.service.KiwiService;
import common.util.CommonUtil;
import talent.model.OrderVO;
import talent.model.TalentVO;

@Controller
@RequestMapping("/member/talent")
public class OrderController {
	
	@Autowired
	private KiwiService kiwi;
	
	@Autowired
	private CommonUtil util;
	
	private static Logger log = LoggerFactory.getLogger(OrderController.class);
	
	/** 주문하기 화면으로 이동 */
	@RequestMapping("/orderTalent.do")
	public String orderTalent(Model model, int tnum, int oqty){
		
		TalentVO tlist = kiwi.selectByTnum(tnum);
		
		model.addAttribute("tlist", tlist);
		model.addAttribute("oqty", oqty);
		
		return "talent/buyTalent";
	}
	
	@RequestMapping(value="/orderTalentEnd.do", method=RequestMethod.POST)
	public String orderTalentEnd(Model model,
			@ModelAttribute("order") OrderVO order){
		
		// 주문처리
		if(order.getPaymethod() == 101){
			order.setOpaystate("지불완료");
			// 구매 결과를 orderdesc 테이블에 저장
			kiwi.setPayResult(order.getOqty(), order.getTnum());
			
			// 판매자의 총 판매금액 및 순이익 금액 추가
			// 파라미터 : 판매자 회원번호가 없으므로 재능번호 및 결제금액 
			kiwi.setPRtoSeller(order.getTnum(), order.getOtotalprice());

			// 구매자의 총구매금액에 추가
			// 파라미터 : 구매자 회원번호 및 결제금액
			kiwi.setPRtoBuyer(order.getMidx(), order.getOtotalprice());
		}
		if(order.getPaymethod() == 102 || order.getPaymethod() == 103){
			order.setOpaystate("미지불");
		}
		
		int n = kiwi.insertOrder(order);

		/*String msg = (n > 0) ? "구매가 완료되었습니다.":"구매에 실패하였습니다.";
		String loc = (n > 0) ? "/KIWI/talent/orderDesc.do" : "javascript:history.back()";
		return util.addMsgLoc(model, msg, loc);*/
		
		// 5. 주문번호를 세션에 저장
		//ses.setAttribute("onum", onum);
		
		if(n < 0){return "javascript:history.back()";}
		return "redirect:/member/talent/orderDesc.do";
	}
	
	@RequestMapping(value="/orderDesc.do")
	public String orderDesc(Model model){
		
		OrderVO oresult = kiwi.getOrderDesc();
		TalentVO otresult = kiwi.getOrderTalentDesc(oresult.getTnum());
		
		model.addAttribute("oresult", oresult);
		model.addAttribute("otresult", otresult);
		
		return "talent/orderDesc";
	}
	
}
