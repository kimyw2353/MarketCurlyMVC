package com.myspring.domain;

public class PagingVO {
	// 페이징 처리 관련 프로퍼티
	private int cpage;// 현재 보여줄 페이지 번호
	private int pageSize;// 한 페이지 당 보여줄 목록 개수
	private int totalCount;// 총 게시글 수
	private int pageCount;// 페이지 수

	// DB에서 레코드를 끊어오기 위한 프로퍼티
	private int start;
	private int end;

	// 페이징 블럭 처리를 위한 프로퍼티
	private int pagingBlock = 5;// 한 블럭 당 보여줄 페이지 수
	private int prevBlock;// 이전 5개
	private int nextBlock;// 이후 5개

	// 검색 관련 프로퍼티
	private String findType;// 검색 유형
	private String findKeyword;// 검색 키워드
	
	//페이징관련한 연산을 수행하는 메소드
	public void init() {
		pageCount=(totalCount-1)/pageSize+1;
		if(cpage<1) {
			cpage=1;
		}
		
		if(cpage>pageCount) {
			cpage=pageCount;
		}
		
		end=this.cpage * this.pageSize;
		start=end-(pageSize-1);
		
		prevBlock=(cpage-1)/pagingBlock * pagingBlock;
		nextBlock=prevBlock+(pagingBlock+1);
	}
	
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
	public String getFindKeyword() {
		return findKeyword;
	}
	public void setFindKeyword(String findKeyword) {
		this.findKeyword = findKeyword;
	}
	@Override
	public String toString() {
		return "PagingVO [cpage=" + cpage + ", pageSize=" + pageSize + ", totalCount=" + totalCount + ", pageCount="
				+ pageCount + ", start=" + start + ", end=" + end + ", pagingBlock=" + pagingBlock + ", prevBlock="
				+ prevBlock + ", nextBlock=" + nextBlock + ", findType=" + findType + ", findKeyword=" + findKeyword
				+ "]";
	}
	//페이지 네비게이션 문자열 만들기
	public String getPageNavi(String myctx, String loc, String userAget) {
		
		String qStr="?findType="+findType+"&findKeyword"+findKeyword;
		String link=myctx+"/"+loc+qStr;
		
		StringBuilder buf = new StringBuilder();
		buf.append("<ul class='pagination'>");
		if(prevBlock>0) {
			buf.append("<li>");
			buf.append("<a href='"+link+"&cpage="+prevBlock+"'>");
			buf.append("Prev");
			buf.append("</a>");
			buf.append("</li>");
		}
		for(int i=prevBlock+1;i<=nextBlock-1 && i<=pageCount;i++) {
			String css="";
			if(i==cpage) {
				css="active";
			}
			
			buf.append("<li class='"+css+"'>");
			buf.append("<a href='"+link+"&cpage="+i+"'>");
			buf.append(i);
			buf.append("</a>");
			buf.append("</li>");
		}
		if(nextBlock <= pageCount) {
			buf.append("<li>");
			buf.append("<a href='"+link+"&cpage="+nextBlock+"'>");
			buf.append("Next");
			buf.append("</a>");
			buf.append("</li>");
		}
		buf.append("</ul>");
		
		return buf.toString();
	}
	
}
