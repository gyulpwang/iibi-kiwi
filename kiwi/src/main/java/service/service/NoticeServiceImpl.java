package service.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.model.NoticeDAO;
import service.model.NoticeVO;
import service.model.PagingVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDAO noticeDao;

	public int insertNotice(NoticeVO notice) {
		
		return noticeDao.insertNotice(notice);
	}
	

	
	public List<NoticeVO> selectNoticeAll(PagingVO paging) {
		return noticeDao.selectNoticeAll(paging);
	}

	public List<NoticeVO> selectNoticeAll(Map<String, Integer> map) {
		
		return null;
	}

	public int getTotalCount() {
		return noticeDao.getTotalCount();
	}
	public int getTotalCount(PagingVO paging) {
		return noticeDao.getTotalCount(paging);
	}

	public NoticeVO selectNoticeByNidx(int nidx) {
		return noticeDao.selectNoticeByNidx(nidx);
	}

	public boolean updateReadnum(int nidx) {
		return noticeDao.updateReadnum(nidx);
	}

	public int deleteNotice(int nidx) {
		return noticeDao.deleteNotice(nidx);
	}

	public int updateNotice(NoticeVO notice) {
		return noticeDao.updateNotice(notice);
	}



	public List<NoticeVO> findNotice(PagingVO paging) {
		// TODO Auto-generated method stub
		return null;
	}



	public List<NoticeVO> searchNotice(String keyword) {
		return noticeDao.searchNotice(keyword);
	}



	public List<NoticeVO> selectNoticeBydate() {
		return noticeDao.selectNoticeBydate();
	}

	

}
