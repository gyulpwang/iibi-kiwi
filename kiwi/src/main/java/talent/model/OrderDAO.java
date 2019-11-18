package talent.model;

import java.util.List;
import java.util.Map;

public interface OrderDAO {
	/** 주문 관련 메소드 ************************************************************* */
	/** 주문 개요 정보와 상품 정보를 insert 하는 메소드 */
	public int insertOrder(OrderVO order);
	
	/** 주문 정보 가져오기 */
	public OrderVO getOrderDesc();
	
	/** 주문 재능정보 가져오기 */
	public TalentVO getOrderTalentDesc(int tnum);

	/** 주문수량만큼 재능수량에서 빼주기 */
	public int setPayResult(int oqty, int tnum);
	
	/** 판매자의 총 판매금액 및 순이익 금액 추가 */
	public int setPRtoSeller(int tnum, int ototalprice);

	/** 구매자의 총구매금액에 추가 */
	public int setPRtoBuyer(int midx, int ototalprice);

	/** 마이페이지 - 재능 통계 ******************************** */
	public int getMySellCnt(Integer midx);

	public List<TalentVO> getMySell(Integer midx);

	public int getMyBuyCnt(Integer midx);
	
	public List<OrderVO> getMyBuy(Integer midx);

	public int getTotBuy(Integer midx);

	public int getTotSell(Integer midx);
	
}
