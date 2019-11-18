package common.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import common.service.KiwiService;
import common.util.CommonUtil;
import member.model.MemberVO;
import service.model.NoticeVO;
import service.service.NoticeService;
import talent.controller.TalentController;
import talent.model.CategoryVO;
import talent.model.ReviewVO;
import talent.model.TalentVO;

@Controller
public class HomeController {
   
   @Autowired
   private KiwiService kiwi;
   
   @Autowired
   private NoticeService notiService;
   
   @Autowired
   private CommonUtil util;
   
   @Autowired
   private static final Logger log = LoggerFactory.getLogger(TalentController.class);
   
   @RequestMapping("/kiwi/home.do")
   public void home(Model model){
      //뷰이름이 반환되지 않으면 RequestMapping에 지정된 매핑 url에 .do를 빼고 .jsp를 붙여 찾아간다.
      //WEB-INF/view/index.jsp
      List<CategoryVO> upList=kiwi.getUpCategory();
      List<TalentVO> tlist = kiwi.allTalentList();
      List<ReviewVO> rvList = kiwi.allReviewList();
      List<NoticeVO> notilist=notiService.selectNoticeBydate();
      List<MemberVO> mrank = kiwi.getMrank();
      
      model.addAttribute("upList", upList);
      model.addAttribute("tlist", tlist);
      model.addAttribute("rvList", rvList);
      model.addAttribute("notilist",notilist);
      model.addAttribute("mrank", mrank);
   }
   
   
   @RequestMapping("/kiwi/top.do")
   public void top(){   // WEB-INF/view/top.jsp
      
   }
   
   @RequestMapping("/kiwi/foot.do")
   public void foot(){// WEB-INF/view/foot.jsp
      
   }
   
   @RequestMapping("/common/msg.do")
   public String message(){
      return "/memo/message";
   }
   
   @RequestMapping("/use/agreement.do")
   public void agreement(){
      
   }

   @RequestMapping("/use/personal.do")
   public void personal(){
      
   }
}