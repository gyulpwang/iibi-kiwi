package service.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.model.FaqDAO;
import service.model.FaqVO;



@Service
public class FaqServiceImpl implements FaqService {

	@Autowired
	private FaqDAO faqDao;

	public List<FaqVO> allFaqList(int faq_uptype) {
	
		return faqDao.allFaqList(faq_uptype);
	}


	
}






