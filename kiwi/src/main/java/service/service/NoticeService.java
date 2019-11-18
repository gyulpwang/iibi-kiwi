package service.service;

import java.util.List;
import java.util.Map;

import service.model.NoticeVO;
import service.model.PagingVO;

public interface NoticeService {
	
		//공지 등록
		int insertNotice(NoticeVO notice);
		
		//공지 모두 가져오기 
		
		List<NoticeVO> selectNoticeAll(Map<String,Integer> map);
		List<NoticeVO> selectNoticeAll(PagingVO paging);
		
		List<NoticeVO> selectNoticeBydate();
		/********** 페이징 ******************/
		
		
		//검색 공지 가져오기 
		List<NoticeVO> findNotice(PagingVO paging);
		
		//공지번호로 공지 가져오기 
		NoticeVO selectNoticeByNidx(int nidx);
		
		
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
		public List<NoticeVO> searchNotice(String keyword);


}
