package trip.bean;
import java.util.Map;

import org.springframework.stereotype.Component;

import lombok.Data;
@Data
@Component
public class PackagePaging {
	private int currentPage; //����������
	private int pageBlock;//[����][1][2][3][����]
	private int pageSize;//1�������� 5����
	private StringBuffer pagingHTML;
	private int totalA;//�� �ۼ�
	public void makePagingHTML(TripDTO tripDTO) {
		pagingHTML = new StringBuffer();
		int totalP =(totalA+pageSize-1)/pageSize;//����������
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if(endPage> totalP) endPage = totalP;
		if(startPage>pageBlock) {
			pagingHTML.append("[<a id=paging href='packageList.do?arrive_city="+tripDTO.getArrive_city()+"&depart_date="+tripDTO.getDepart_date()+"&depart_city="+tripDTO.getDepart_city()+"&week="+tripDTO.getWeek()+"&grade="+tripDTO.getGrade()+"&pg="+(startPage-1)+"'>이전</a>]");
		}
		for(int i=startPage;i<=endPage;i++) {
			if(i==currentPage) 
				pagingHTML.append("[<a id=currentPaging href='/TwoTour/packageTrip/packageList.do?arrive_city="+tripDTO.getArrive_city()+"&depart_date="+tripDTO.getDepart_date()+"&depart_city="+tripDTO.getDepart_city()+"&week="+tripDTO.getWeek()+"&grade="+tripDTO.getGrade()+"&pg="+i+"'>"+i+"</a>]");
			
			else
				pagingHTML.append("[<a id=paging href='/TwoTour/packageTrip/packageList.do?arrive_city="+tripDTO.getArrive_city()+"&depart_date="+tripDTO.getDepart_date()+"&depart_city="+tripDTO.getDepart_city()+"&week="+tripDTO.getWeek()+"&grade="+tripDTO.getGrade()+"&pg="+i+"'>"+i+"</a>]");
		}
		if(endPage<totalP) {
			pagingHTML.append("[<a id=paging href='/TwoTour/packageTrip/packageList.do?arrive_city="+tripDTO.getArrive_city()+"&depart_date="+tripDTO.getDepart_date()+"&depart_city="+tripDTO.getDepart_city()+"&week="+tripDTO.getWeek()+"&grade="+tripDTO.getGrade()+"&pg="+(endPage+1)+"'>다음</a>]");
		}
		
		
	}
	public void makePagingHTML1(TripDTO tripDTO) {
		pagingHTML = new StringBuffer();
		int totalP =(totalA+pageSize-1)/pageSize;//����������
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if(endPage> totalP) endPage = totalP;
		if(startPage>pageBlock) {
			pagingHTML.append("[<a id=paging onclick=lowprice('"+tripDTO.getArrive_city()+"','"+tripDTO.getDepart_date()+"','"+tripDTO.getDepart_city()+"','"+tripDTO.getWeek()+"','"+tripDTO.getGrade()+"',"+(startPage-1)+")>이전</a>]");
		}
		for(int i=startPage;i<=endPage;i++) {
			if(i==currentPage) 
				pagingHTML.append("[<a id=currentPaging onclick=lowprice('"+tripDTO.getArrive_city()+"','"+tripDTO.getDepart_date()+"','"+tripDTO.getDepart_city()+"','"+tripDTO.getWeek()+"','"+tripDTO.getGrade()+"',"+i+")>"+i+"</a>]");
			
			else
				pagingHTML.append("[<a id=paging onclick=lowprice('"+tripDTO.getArrive_city()+"','"+tripDTO.getDepart_date()+"','"+tripDTO.getDepart_city()+"','"+tripDTO.getWeek()+"','"+tripDTO.getGrade()+"',"+i+")>"+i+"</a>]");
		}
		if(endPage<totalP) {
			pagingHTML.append("[<a id=paging onclick=lowprice('"+tripDTO.getArrive_city()+"','"+tripDTO.getDepart_date()+"','"+tripDTO.getDepart_city()+"','"+tripDTO.getWeek()+"','"+tripDTO.getGrade()+"',"+(endPage+1)+")>다음</a>]");
		}
		
		
		
	}
	
	
	public void makePagingHTML2(TripDTO tripDTO) {
		pagingHTML = new StringBuffer();
		int totalP =(totalA+pageSize-1)/pageSize;//����������
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if(endPage> totalP) endPage = totalP;
		if(startPage>pageBlock) {
			pagingHTML.append("[<a id=paging href='/TwoTour/packageTrip/productList.do?depart_city="+tripDTO.getDepart_city()+"&seq="+tripDTO.getSeq()+"&depart_date="+tripDTO.getDepart_date()+"&week="+tripDTO.getWeek()+"&grade="+tripDTO.getGrade()+"&pg="+(startPage-1)+"'>이전</a>]");
		}
		for(int i=startPage;i<=endPage;i++) {
			if(i==currentPage) 
				pagingHTML.append("[<a id=currentPaging href='/TwoTour/packageTrip/productList.do?depart_city="+tripDTO.getDepart_city()+"&seq="+tripDTO.getSeq()+"&depart_date="+tripDTO.getDepart_date()+"&week="+tripDTO.getWeek()+"&grade="+tripDTO.getGrade()+"&pg="+i+"'>"+i+"</a>]");
			
			else
				pagingHTML.append("[<a id=paging href='/TwoTour/packageTrip/productList.do?depart_city="+tripDTO.getDepart_city()+"&seq="+tripDTO.getSeq()+"&depart_date="+tripDTO.getDepart_date()+"&week="+tripDTO.getWeek()+"&grade="+tripDTO.getGrade()+"&pg="+i+"'>"+i+"</a>]");
		}
		if(endPage<totalP) {
			pagingHTML.append("[<a id=paging href='/TwoTour/packageTrip/productList.do?depart_city="+tripDTO.getDepart_city()+"&seq="+tripDTO.getSeq()+"&depart_date="+tripDTO.getDepart_date()+"&week="+tripDTO.getWeek()+"&grade="+tripDTO.getGrade()+"&pg="+(endPage+1)+"'>다음</a>]");
		}	
	}
	
}