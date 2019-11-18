package service.model;

import java.util.List;
import java.util.Map;

public interface QnaDAO {

	int QnaInsert(QnaVO vo);
	
	
	
/*	int insertBoard(FAQVO board);
	
	List<FAQVO> selectBoardAll(Map<String,Integer> map);	
	List<FAQVO> selectBoardAll(PagingVO paging);

	//검색 목록 가져오기
	List<FAQVO> findBoard(PagingVO paging);		
		
	int getTotalCount();//총 게시글 수
	int getTotalCount(PagingVO paging);//총 게시글 수(검색 포함)
	
	boolean updateReadnum(Integer idx);
	FAQVO selectBoardByIdx(Integer idx);
	
	
	String selectPwd(Integer idx);
	
	int deleteBoard(Integer idx);
	
	int updateBoard(FAQVO board);
	
	int insertReply(ReplyVO reply);//꼬리글 등록	
	List<ReplyVO> selectReplyAll(Integer idx);
	
	int selectReplyCount(Integer idx);
	
	//특정 게시글에 대한 꼬리글 목록 가져오기	
	int deleteReply(Integer num);//꼬리글 번호로 꼬리글 삭제하기
	
	//계층형 게시판에서 답변글 달기
	int rewriteBoard(FAQVO board);
	
	FAQVO selectRefLevSunbun(int idx);
	
	int updateSunbun(FAQVO parent);*/
	
	
}




