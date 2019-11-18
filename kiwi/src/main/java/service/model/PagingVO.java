package service.model;

import java.io.Serializable;

public class PagingVO  implements Serializable {
	
	//페이징 처리 관련 프로퍼티 선언
	private int cpage=1;//현재 보여줄 페이지 번호
	private int pageSize=10;//한 페이지 당 보여줄 목록 갯수
	private int totalCount;//총 게시글 수
	private int pageCount;//페이지 수
	
	//DB에서 레코드 끊어올 때 사용할 시작값, 끝값 프로퍼티
	private int start;
	private int end;
	
	//페이징 블럭 처리 관련 프로퍼티
	private int pagingBlock=10;//한 블럭 당 보여줄 페이지 갯수
	private int prevBlock;//이전 
	private int nextBlock;//이후 
	
	//검색 관련 프로퍼티
	private String findType;
	private String findString;
	
	public PagingVO()
	{
		init();
	}

	public PagingVO(int cpage, int pageSize,
			int totalCount, int pagingBlock) {
		super();
		this.cpage = cpage;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.pagingBlock = pagingBlock;
		/////페이징 연산 메소드 호출////
		init();
		////////////////////////////
	}
	

	public void init(){
		pageCount=(totalCount-1)/pageSize+1;
		if(cpage<1){
			cpage=1;
		}
		if(cpage>pageCount){
			cpage=pageCount;
		}
		end=cpage*pageSize;
		start=end-(pageSize-1);
		
		prevBlock=(cpage-1)/pagingBlock *pagingBlock;
		nextBlock=prevBlock+(pagingBlock+1);
		
	}

	//setter, getter
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

	public String getFindType() {
		return findType;
	}

	public void setFindType(String findType) {		
		this.findType = findType;
	}

	public String getFindString() {
		return findString;
	}

	public void setFindString(String findString) {
		this.findString = findString;
	}
	/***/
	public String getPageNavi(String myctx, String loc)
	{
		findType=(findType==null)?"0":findType;
		findString=(findString==null)?"":findString;
		
		
		String str="";
		//검색시 필요한 쿼리 스트링
		String queryStr="?findType="+findType
		+"&findString="+findString+"&pageSize="+pageSize;
		
		StringBuilder buf=new StringBuilder()
			.append("<ul class='pagination'>");
			if(prevBlock>0){
	buf.append("<li><a href='"+myctx+"/"+loc+queryStr
			+"&cpage="+prevBlock+"'>");
	buf.append("Prev </a></li>");
			}
		for(int i=prevBlock+1;i<= nextBlock-1 && i<=pageCount ;i++)
		{
			if(cpage==i){
				buf.append("<li class='active'><a href='#'>");
				buf.append(i+"</a></li>");
			}else{
				buf.append("<li><a href='"+myctx+"/"+loc+queryStr+"&cpage="+i+"'>");
				buf.append(i+"</a></li>");
			}
		}//for-----
		if(nextBlock<=pageCount){
			buf.append("<li><a href='"+myctx+"/"+loc+queryStr
					+"&cpage="+nextBlock+"'>");
			buf.append("Next</a></li>");
		}
			buf.append("</ul>");
		str=buf.toString();
		return str;
	}
	

	
	

}//////////////////////////////////





