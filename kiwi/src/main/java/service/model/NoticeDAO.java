package service.model;

import java.util.List;
import java.util.Map;





public interface NoticeDAO {
	
	//공지 등록
	int insertNotice(NoticeVO notice);
	
	//공지 모두 가져오기 
	
	List<NoticeVO> selectNoticeAll(Map<String,Integer> map);
	List<NoticeVO> selectNoticeAll(PagingVO paging);
	/********** 페이징 ******************/
	//int getTotalCount();//총 게시글 수
	//int getTotalCount(PagingVO paging);//검색한 게시글 수
	
	//검색 공지 가져오기 
	List<NoticeVO> findNotice(PagingVO paging);
	
	//공지번호로 공지 가져오기 
	NoticeVO selectNoticeByNidx(int nidx);
	
	List<NoticeVO> selectNoticeBydate();
	
	
	//총 게시글수 가져오기
	int getTotalCount();
	//총 게시글 수 검색 포함 
	int getTotalCount(PagingVO paging);
	
	
	//조회수
	boolean updateReadnum(int nidx);
	

	//공지 삭제 
	int deleteNotice(int nidx);
	
	//공지 수정
	int updateNotice(NoticeVO notice);
	
	//검색
	List<NoticeVO> searchNotice(String keyword);


}
