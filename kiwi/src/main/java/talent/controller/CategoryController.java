package talent.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import common.service.KiwiService;
import talent.model.CategoryVO;

@Controller
public class CategoryController {

	@Autowired
	private KiwiService kiwi;
	
	/** 상위분류명과 상위분류코드를 가져오기 */
	@RequestMapping("/talent/upCategory.do")
	public String getUpCategory(Model model){
		List<CategoryVO> upList = kiwi.getUpCategory();
		
		model.addAttribute("upList", upList);
	
		return "/talent/category";
	}
	
	/** 상위분류에 해당하는 하위분류 목록 가져오기 
	 * - Ajax 요청에 의해 JSON 형태로 반환한다. */
	@RequestMapping("/talent/dwCategory.do")
	public @ResponseBody List<CategoryVO> getDwCategory(
			Model model, HttpServletResponse res, 
			@RequestParam(defaultValue="0")int upcode){
		res.setHeader("Cache-Control", "no-cache");
		
		List<CategoryVO> dwList = kiwi.getDwCategory(upcode);
		
		model.addAttribute(dwList);
		
		return dwList;
	}
	
}
