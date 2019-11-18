package service.service;

import java.util.List;

import service.model.FaqVO;

public interface FaqService {
	
	public List<FaqVO> allFaqList(int faq_uptype);
}



