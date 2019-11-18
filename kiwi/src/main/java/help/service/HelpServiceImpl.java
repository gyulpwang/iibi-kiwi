package help.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import help.model.HelpDAO;
import help.model.HelpVO;
import help.model.PagingVO;
import help.model.SuggestVO;
import talent.model.CategoryVO;

@Service
public class HelpServiceImpl implements HelpService{
	
	@Autowired
	private HelpDAO helpDao;
	
	public int insertHelp(HelpVO help) {
		return helpDao.insertHelp(help);
	}
/*
	public List<HelpVO> selectHelpAll(Map<String, Integer> map) {
		return helpDao.selectHelpAll(map);
	}*/

	public List<HelpVO> selectHelpAll(PagingVO paging) {
		return helpDao.selectHelpAll(paging);
	}

	public List<HelpVO> findHelp(PagingVO paging) {
		return helpDao.findHelp(paging);
	}

	public int getTotalCount() {
		return helpDao.getTotalCount();
	}

	public int getTotalCount(PagingVO paging) {
		return helpDao.getTotalCount(paging);
	}

	public HelpVO selectHelpByhidx(Integer helpidx) {
		return helpDao.selectHelpByhidx(helpidx);
	}

	public int deleteHelp(Integer helpidx) {
		return helpDao.deleteHelp(helpidx);
	}
	
	public int updateHelp(HelpVO help){
		return helpDao.updateHelp(help);
	}

	public CategoryVO infoByCate(int dwcode) {
		return helpDao.infoByCate(dwcode);
	}

	public CategoryVO infoByUpCate(int upcode) {
		return helpDao.infoByUpCate(upcode);
	}
	
	public List<CategoryVO> infoByCategory() {
		return helpDao.infoByCategory();
	}
	
	public List<CategoryVO> infoByUpCategory() {
		return helpDao.infoByUpCategory();
	}

	public CategoryVO DetailCate(int helpidx) {
		return helpDao.DetailCate(helpidx);
	}

	public int insertSuggest(SuggestVO suggest) {
		return helpDao.insertSuggest(suggest);
	}

	public int selectSuggestCount(Integer helpidx) { 
		return helpDao.selectSuggestCount(helpidx);
	}

	public List<SuggestVO> selectSuggestName(int helpidx) {
		return helpDao.selectSuggestName(helpidx);
	}

	public int choiceSuggest(Integer helpidx,Integer no) {
		return helpDao.choiceSuggest(helpidx,no);
	}

	public int updateSuggest(Integer helpidx) {
		return helpDao.updateSuggest(helpidx);
	}

	public List<HelpVO> searchHelp(String keyword) {
		return helpDao.searchHelp(keyword);
	}

	public int updateSuggestSmode(Integer helpidx, Integer no){
		return helpDao.updateSuggestSmode(helpidx, no);
	}

	public int selectCate(int upcode) {
		return helpDao.selectCate(upcode);
	}

	public int updateBuySug(int midx, int iprice) {
		return helpDao.updateBuySug(midx,iprice);
	}

	public int updateSellSug(int no, int iprice) {
		return helpDao.updateSellSug(no,iprice);
	}



	
	

}
