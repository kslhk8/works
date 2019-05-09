package clientCenter.bean;

import lombok.Data;

@Data
public class NoticePaging {
	private int currentPage;//현재페이지
	private int pageBlock;//[이전][1][2][3][다음]
	private int pageSize;//1페이지당 5개씩
	private int totalA;//총글수
	private StringBuffer pagingHTML;
	
	public void makePagingHTML(){
		
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;//총페이지수
		
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if(endPage > totalP) endPage = totalP;
		/*System.out.println(startPage);//1
		System.out.println(endPage);//0
		System.out.println(totalA);//0
		System.out.println(pageBlock);//1
		System.out.println(pageSize);//2
		System.out.println(currentPage);//1*/
		if(startPage > pageBlock)
			pagingHTML.append("[<a id=paging href='/TwoTour/clientCenter/notice.do?pg="+(startPage-1)+"'>이전</a>]");
		
		for(int i=startPage; i<=endPage; i++){
			if(i==currentPage)
				pagingHTML.append("[<a id=currentPaging href='/TwoTour/clientCenter/notice.do?pg="+i+"'>"+i+"</a>]");
			else
				pagingHTML.append("[<a id=paging href='/TwoTour/clientCenter/notice.do?pg="+i+"'>"+i+"</a>]");
	
		}
		
		if(endPage<totalP)
			pagingHTML.append("[<a id=paging href='/TwoTour/clientCenter/notice.do?pg="+(endPage+1)+"'>다음</a>]");
	
	
	}
}
