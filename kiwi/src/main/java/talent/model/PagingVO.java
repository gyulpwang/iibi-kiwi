package talent.model;

import java.io.Serializable;

public class PagingVO implements Serializable {

	// 페이징 처리 관련 프로퍼티 선언
	private int	cpage=1;	// 현재 보여줄 페이지 번호
	private int pageSize=9;	// 한 페이지 당 보여줄 목록 갯수
	private int totalCount;	// 총 게시글 수
	private int pageCount;	// 페이지 수

	// DB에서 레코드 끊어올 때 사용할 시작 값, 끝 값 프로퍼티
	private int start;
	private int end;
	
	// 페이징 블럭 처리 관련 프로퍼티
	private int pagingBlock=5;	// 한 블럭당 보여줄 페이지 갯수
	private int prevBlock;		// 이전 5개
	private int nextBlock;		// 이후 5개
	
	// 검색 관련 프로퍼티
	private String keyword;
	
	public PagingVO(){init();}

	public PagingVO(int cpage, int pageSize, int totalCount, int pagingBlock) {
		super();
		this.cpage = cpage;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.pagingBlock = pagingBlock;
		
		// 페이징 연산 메소드 호출 /////////////
		init();
		////////////////////////////////////////
	}

	/** 페이징 관련 연산하는 메소드 
	
	총 게시물 수   pageSize
	100개          5
	
	[1][2][3][4][5] | [6][7][8][9][10] | [11][12][13][14][15]
	
	prevBlock = (cpage-1)/pagingBlock*pagingBlock
	nextBlock = prevBlock+(pagingBlock+1)
	
	cpage              pagingBlock     prevBlock     newBlock
	 1, 2, 3, 4, 5     5               0             6 
	 6, 7, 8, 9,10     5               5             11
	11,12,13,14,15     5               10            16 */
	public void init(){
		pageCount=(totalCount-1)/pageSize+1;
		
		if(cpage < 1)		 {cpage = 1;}
		if(cpage > pageCount){cpage=pageCount;}
		
		end=cpage*pageSize;
		start=end-(pageSize-1);
		
		// 이전 5개, 이후 5개 구하는 로직 여기에
		prevBlock = (cpage-1)/pagingBlock * pagingBlock;
		nextBlock = prevBlock+(pagingBlock+1);
	}
	
	// setter, getter
	public int getCpage() {
		return cpage;
	}

	public void setCpage(int cpage) {
		this.cpage = cpage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getPagingBlock() {
		return pagingBlock;
	}

	public void setPagingBlock(int pagingBlock) {
		this.pagingBlock = pagingBlock;
	}

	public int getPrevBlock() {
		return prevBlock;
	}

	public void setPrevBlock(int prevBlock) {
		this.prevBlock = prevBlock;
	}

	public int getNextBlock() {
		return nextBlock;
	}

	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String getPageNavi(String myctx, String loc) {
		// myctx	: 컨텍스트 명 	/SpringShop
		// loc		: 경로			/board/list.do
		// queryStr	: 쿼리 스트링(파라미터명 = 값)
		String str = "";
		// 검색 시 필요한 쿼리 스트링
		
		keyword = (keyword == null) ? "" : keyword;
		
		String queryStr = "?keyword="+keyword+"&pageSize="+pageSize;
		
		StringBuilder buf = new StringBuilder()
				.append("<ul class='pagination pagination-sm'>");
				if(prevBlock > 0){ // 이전 5개
					buf.append("<li><a href='"+myctx+"/"+loc+queryStr+"&cpage="+prevBlock+"'>");
					buf.append("&lt;&lt; Prev</a></li>");
				}
				for(int i=prevBlock+1; i<=nextBlock-1 && i<=pageCount; i++){
					if(cpage == i){// 현재 페이지 활성화
						buf.append("<li class='active'><a href='#' class='clrWhite'>");
						buf.append(i+"</a></li>");
					}else{// 현재 페이지가 아닌 페이지들은 비활성화(숫자만)
						buf.append("<li><a href='"+myctx+"/"+loc+queryStr+"&cpage="+i+"'>");
						buf.append(i+"</a></li>");
					}
				}
				if(nextBlock <= pageCount){	// 이후 5개
					buf.append("<li><a href='"+myctx+"/"+loc+queryStr+"&cpage="+nextBlock+"'>");
					buf.append("Next &gt;&gt;</a></li>");
				}
				buf.append("</ul>");
		str=buf.toString();
		return str;
	}
	
	public String getPageNaviUp(String myctx, String loc, int upcode) {
		String str = "";
		
		keyword = (keyword == null) ? "" : keyword;
		
		String queryStr = "?upcode="+upcode+"&keyword="+keyword+"&pageSize="+pageSize;
		
		StringBuilder buf = new StringBuilder()
				.append("<ul class='pagination pagination-sm'>");
				if(prevBlock > 0){ // 이전 5개
					buf.append("<li><a href='"+myctx+"/"+loc+queryStr+"&cpage="+prevBlock+"'>");
					buf.append("&lt;&lt; Prev</a></li>");
				}
				for(int i=prevBlock+1; i<=nextBlock-1 && i<=pageCount; i++){
					if(cpage == i){// 현재 페이지 활성화
						buf.append("<li class='active'><a href='#' class='clrWhite'>");
						buf.append(i+"</a></li>");
					}else{// 현재 페이지가 아닌 페이지들은 비활성화(숫자만)
						buf.append("<li><a href='"+myctx+"/"+loc+queryStr+"&cpage="+i+"'>");
						buf.append(i+"</a></li>");
					}
				}
				if(nextBlock <= pageCount){	// 이후 5개
					buf.append("<li><a href='"+myctx+"/"+loc+queryStr+"&cpage="+nextBlock+"'>");
					buf.append("Next &gt;&gt;</a></li>");
				}
				buf.append("</ul>");
		str=buf.toString();
		return str;
	}
	
	public String getPageNaviDw(String myctx, String loc, int upcode, int dwcode) {
		String str = "";
		
		keyword = (keyword == null) ? "" : keyword;
		
		String queryStr = "?upcode="+upcode+"&dwcode="+dwcode+"&keyword="+keyword+"&pageSize="+pageSize;
		
		StringBuilder buf = new StringBuilder()
				.append("<ul class='pagination pagination-sm'>");
				if(prevBlock > 0){ // 이전 5개
					buf.append("<li><a href='"+myctx+"/"+loc+queryStr+"&cpage="+prevBlock+"'>");
					buf.append("&lt;&lt; Prev</a></li>");
				}
				for(int i=prevBlock+1; i<=nextBlock-1 && i<=pageCount; i++){
					if(cpage == i){// 현재 페이지 활성화
						buf.append("<li class='active'><a href='#' class='clrWhite'>");
						buf.append(i+"</a></li>");
					}else{// 현재 페이지가 아닌 페이지들은 비활성화(숫자만)
						buf.append("<li><a href='"+myctx+"/"+loc+queryStr+"&cpage="+i+"'>");
						buf.append(i+"</a></li>");
					}
				}
				if(nextBlock <= pageCount){	// 이후 5개
					buf.append("<li><a href='"+myctx+"/"+loc+queryStr+"&cpage="+nextBlock+"'>");
					buf.append("Next &gt;&gt;</a></li>");
				}
				buf.append("</ul>");
		str=buf.toString();
		return str;
	}
	
	@Override
	public String toString() {
		return "PagingVO [cpage=" + cpage + ", pageSize=" + pageSize + ", totalCount=" + totalCount + ", pageCount="
				+ pageCount + ", start=" + start + ", end=" + end + ", pagingBlock=" + pagingBlock + ", prevBlock="
				+ prevBlock + ", nextBlock=" + nextBlock + ", keyword=" + keyword + "]";
	}
}
