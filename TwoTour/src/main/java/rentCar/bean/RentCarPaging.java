package rentCar.bean;

import lombok.Data;

@Data
public class RentCarPaging {
	private int currentPage;//����������
	private int pageBlock;//[����][1][2][3][����] ������ ǥ���Ҷ� ���� ũ�� 
	private int pageSize;//1�������� 5����
	private StringBuffer pagingHTML;
	private int totalA;
	
	public void makePagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+(pageSize-1))/pageSize;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if(endPage > totalP) endPage = totalP;
		
		if(startPage > pageBlock) pagingHTML.append("[<span id=privious onclick=rentCarPaging("+(startPage-1)+")>이전</span>]");
		
		for(int i=startPage; i<=endPage ; i++ ) {
			if(i==currentPage)
				pagingHTML.append("[<span id=currentPaging onclick=rentCarPaging("+i+")>"+i+"</span>]");
			else
				pagingHTML.append("[<span id=paging onclick=rentCarPaging("+i+")>"+i+"</span>]");
		}
		if(totalP > endPage)
			pagingHTML.append("[<span id=next onclick=rentCarPaging("+(endPage+1)+")>다음</span>]");
	}
}
