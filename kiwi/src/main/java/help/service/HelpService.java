package help.service;

import java.util.List;

import help.model.HelpVO;
import help.model.PagingVO;
import help.model.SuggestVO;
import talent.model.CategoryVO;

public interface HelpService {

	int insertHelp(HelpVO help);
	
	/*List<HelpVO> selectHelpAll(Map<String,Integer> map);*/
	List<HelpVO> selectHelpAll(PagingVO paging);
	
	List<HelpVO> findHelp(PagingVO paging);		
	
	int getTotalCount();
	int getTotalCount(PagingVO paging);
	
	HelpVO selectHelpByhidx(Integer hidx);
	
	int deleteHelp(Integer helpidx);
	
	int updateHelp(HelpVO help);
	
	CategoryVO infoByCate(int dwcode);
	
	CategoryVO infoByUpCate(int upcode);
	
	List<CategoryVO> infoByCategory();
	
	List<CategoryVO> infoByUpCategory();
	
	CategoryVO DetailCate(int helpidx);
	
	int insertSuggest(SuggestVO suggest);
	
	int selectSuggestCount(Integer helpidx);
	
	List<SuggestVO> selectSuggestName(int helpidx);
	
	int choiceSuggest(Integer helpidx,Integer no);
	
	int updateSuggest(Integer helpidx);
	
	int updateSuggestSmode(Integer helpidx, Integer no);
	
	public List<HelpVO> searchHelp(String keyword);
	
	int selectCate(int upcode);

	int updateBuySug(int midx, int iprice);
	
	int updateSellSug(int no, int iprice);
	
	
}
