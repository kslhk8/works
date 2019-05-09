package trip.controller;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import basketInform.dao.BasketInformDAO;
import clause.bean.ClauseDTO;
import clause.dao.ClauseDAO;
import hotel.bean.HotelDTO;
import hotel.dao.HotelDAO;
import maincityInform.bean.MaincityInformDTO;
import maincityInform.dao.MaincityInformDAO;
import member.bean.MemberDTO;
import member.dao.MemberDAO;
import payInform.bean.PayInformDTO;
import payInform.dao.PayInformDAO;
import productFree.bean.AirplaneDTO;
import productFree.dao.ProductFreeDAO;
import rentCar.dao.RentCarDAO;
import reservationInform.bean.ReservationInformDTO;
import reservationInform.dao.ReservationInformDAO;
import safetyInform.bean.SafetyInformDTO;
import safetyInform.dao.SafetyInformDAO;
import travelerInform.bean.TravelerInformDTO;
import travelerInform.dao.TravelerInformDAO;
import trip.bean.HDTO;
import trip.bean.PackagePaging;
import trip.bean.PackageTripDTO;
import trip.bean.TripDTO;
import trip.dao.PackageTripDAO;
import tripPlan.bean.TripPlanDTO;
import tripPlan.dao.TripPlanDAO;

@Component
@Controller
public class PackageTripController {
	@Autowired
	PackageTripDAO packageTripDAO;
	@Autowired
	PackagePaging packagePaging;
	@Autowired
	ProductFreeDAO airplaneDAO;
	@Autowired
	TripPlanDAO tripPlanDAO;
	@Autowired
	MaincityInformDAO maincityInformDAO;
	@Autowired
	HotelDAO hotelDAO;
	@Autowired
	ClauseDAO clauseDAO;
	@Autowired
	SafetyInformDAO safetyInformDAO;
	@Autowired
	MemberDAO memberDAO;
	@Autowired
	TravelerInformDAO travelerInformDAO;
	@Autowired
	PayInformDAO payInformDAO;
	@Autowired
	ReservationInformDTO reservationInformDTO;
	@Autowired
	ReservationInformDAO reservationInformDAO;
	@Autowired
	BasketInformDAO basketInformDAO;
	@Autowired
	RentCarDAO rentCarDAO;
	@RequestMapping(value="/packageTrip/packageList.do")
	public ModelAndView package1(@ModelAttribute TripDTO tripDTO,@RequestParam(required=false) String pg) {
		ModelAndView mav = new ModelAndView();
		if(pg==null) pg="1";
		int endNum= Integer.parseInt(pg)*3;
		int startNum= endNum-2;
		System.out.println(pg);
		System.out.println(); 
		System.out.println("여행도시: "+tripDTO.getArrive_city());
		System.out.println("출발월: "+tripDTO.getDepart_date());
		System.out.println("출발도시: "+tripDTO.getDepart_city());
		System.out.println("출발요일: "+tripDTO.getWeek());
		System.out.println("상품등급: "+tripDTO.getGrade());
		System.out.println();
		
		if(tripDTO.getDepart_date()==null && tripDTO.getDepart_city()==null
				&& tripDTO.getWeek()==null && tripDTO.getGrade()==null) {
			tripDTO.setWeek("week,weekend");
			tripDTO.setDepart_date("01");
			tripDTO.setDepart_city("인천");
			tripDTO.setGrade("캐주얼,클래식,이세이브");
			
		}
		
		Map<String,String> map = new HashMap<String,String>();

		map.put("arrive_city",tripDTO.getArrive_city());
		map.put("depart_date", tripDTO.getDepart_date());
		map.put("depart_city", tripDTO.getDepart_city());
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		
		String arr_Week[] = new String[2];
		if(tripDTO.getWeek()!=null) {
			 arr_Week = tripDTO.getWeek().split(",");
		}
		
		String arr_Grade[] = new String[3];
		if(tripDTO.getGrade()!=null) {
			arr_Grade = tripDTO.getGrade().split(",");
		}
		
		if(arr_Week.length==1) {
			map.put("week", tripDTO.getWeek());
			
			if(arr_Grade.length==1) {
				map.put("grade", tripDTO.getGrade());
				
			}
			else if(arr_Grade.length==2) {
				map.put("grade", arr_Grade[0]);
				map.put("grade2", arr_Grade[1]);
				mav.addObject("arr_Grade1",arr_Grade[1]);
			}
			else if(arr_Grade.length==3) {
				mav.addObject("arr_Grade2",arr_Grade[2]);
			}
		}
		else if(arr_Week.length==2){
			mav.addObject("arr_Week1",arr_Week[1]);
			
			if(arr_Grade.length==1) {
				map.put("grade", tripDTO.getGrade());
			}
			else if(arr_Grade.length==2) {
				map.put("grade", arr_Grade[0]);
				map.put("grade2", arr_Grade[1]);
				mav.addObject("arr_Grade1",arr_Grade[1]);
			}
			else if(arr_Grade.length==3) {
				mav.addObject("arr_Grade2",arr_Grade[2]);
			}
		}
		
		int totalA = packageTripDAO.getPackageTotalA(map);
		System.out.println("총페이지"+totalA);
		packagePaging.setCurrentPage(Integer.parseInt(pg));
		packagePaging.setPageBlock(3);
		packagePaging.setPageSize(3);
		packagePaging.setTotalA(totalA);
		packagePaging.makePagingHTML(tripDTO);
		List<PackageTripDTO> imageList = packageTripDAO.getImage(tripDTO.getArrive_city());
		List<TripDTO> packageList = packageTripDAO.getPackage(map);
		System.out.println("개수"+packageList.size());
		
		mav.setViewName("/main/index");
		mav.addObject("imageList",imageList);
		mav.addObject("packageList",packageList);
		mav.addObject("arrive_city",tripDTO.getArrive_city());
		mav.addObject("packagePaging",packagePaging);
		mav.addObject("display", "/packageTrip/packageList.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		mav.addObject("arr_Week0",arr_Week[0]);
		mav.addObject("arr_Grade0",arr_Grade[0]);
		mav.addObject("tripDTO",tripDTO);
		mav.addObject("depart_city",tripDTO.getDepart_city());
		mav.addObject("depart_date",tripDTO.getDepart_date());
		return mav;
	}
	@RequestMapping(value="/packageTrip/lowprice.do")
	public ModelAndView lowprice(@ModelAttribute TripDTO tripDTO,@RequestParam(required=false) String pg) {
		System.out.println("여기왔니?");
		ModelAndView mav=  new ModelAndView();
		if(pg==null) pg="1";
		int endNum= Integer.parseInt(pg)*3;
		int startNum= endNum-2;
		System.out.println(pg);
		System.out.println(); 
		System.out.println("여행도시: "+tripDTO.getArrive_city());
		System.out.println("출발월: "+tripDTO.getDepart_date());
		System.out.println("출발도시: "+tripDTO.getDepart_city());
		System.out.println("출발요일: "+tripDTO.getWeek());
		System.out.println("상품등급: "+tripDTO.getGrade());
		System.out.println();
		
		Map<String,String> map = new HashMap<String,String>();

		map.put("arrive_city",tripDTO.getArrive_city());
		map.put("depart_date", tripDTO.getDepart_date());
		map.put("depart_city", tripDTO.getDepart_city());
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		String arr_Week[] = tripDTO.getWeek().split(",");
		String arr_Grade[] = tripDTO.getGrade().split(",");
		
		if(arr_Week.length==1) {
			map.put("week", tripDTO.getWeek());
			
			if(arr_Grade.length==1) {
				map.put("grade", tripDTO.getGrade());
				
			}
			else if(arr_Grade.length==2) {
				map.put("grade", arr_Grade[0]);
				map.put("grade2", arr_Grade[1]);
				mav.addObject("arr_Grade1",arr_Grade[1]);
			}
			else if(arr_Grade.length==3) {
				mav.addObject("arr_Grade2",arr_Grade[2]);
			}
		}
		else if(arr_Week.length==2){
			mav.addObject("arr_Week1",arr_Week[1]);
			
			if(arr_Grade.length==1) {
				map.put("grade", tripDTO.getGrade());
			}
			else if(arr_Grade.length==2) {
				map.put("grade", arr_Grade[0]);
				map.put("grade2", arr_Grade[1]);
				mav.addObject("arr_Grade1",arr_Grade[1]);
			}
			else if(arr_Grade.length==3) {
				mav.addObject("arr_Grade2",arr_Grade[2]);
			}
		}
		
		int totalA = packageTripDAO.getPackageTotalA(map);
		System.out.println("총페이지"+totalA);
		packagePaging.setCurrentPage(Integer.parseInt(pg));
		packagePaging.setPageBlock(3);
		packagePaging.setPageSize(3);
		packagePaging.setTotalA(totalA);
		packagePaging.makePagingHTML1(tripDTO);
		List<PackageTripDTO> imageList = packageTripDAO.getImage(tripDTO.getArrive_city());
		List<TripDTO> packageList = packageTripDAO.getPackageLow(map);
		
		System.out.println("개수"+packageList.size());
		mav.addObject("packagePaging",packagePaging);
		mav.setViewName("jsonView");
		mav.addObject("packageList",packageList);
		return mav;
	}
	
	@RequestMapping(value="/packageTrip/highprice.do")
	public ModelAndView highprice(@ModelAttribute TripDTO tripDTO,@RequestParam(required=false) String pg) {
		System.out.println("여기왔니?");
		ModelAndView mav=  new ModelAndView();
		if(pg==null) pg="1";
		int endNum= Integer.parseInt(pg)*3;
		int startNum= endNum-2;
		System.out.println(pg);
		System.out.println(); 
		System.out.println("여행도시: "+tripDTO.getArrive_city());
		System.out.println("출발월: "+tripDTO.getDepart_date());
		System.out.println("출발도시: "+tripDTO.getDepart_city());
		System.out.println("출발요일: "+tripDTO.getWeek());
		System.out.println("상품등급: "+tripDTO.getGrade());
		System.out.println();
		
		Map<String,String> map = new HashMap<String,String>();

		map.put("arrive_city",tripDTO.getArrive_city());
		map.put("depart_date", tripDTO.getDepart_date());
		map.put("depart_city", tripDTO.getDepart_city());
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		String arr_Week[] = tripDTO.getWeek().split(",");
		String arr_Grade[] = tripDTO.getGrade().split(",");
		
		if(arr_Week.length==1) {
			map.put("week", tripDTO.getWeek());
			
			if(arr_Grade.length==1) {
				map.put("grade", tripDTO.getGrade());
				
			}
			else if(arr_Grade.length==2) {
				map.put("grade", arr_Grade[0]);
				map.put("grade2", arr_Grade[1]);
				mav.addObject("arr_Grade1",arr_Grade[1]);
			}
			else if(arr_Grade.length==3) {
				mav.addObject("arr_Grade2",arr_Grade[2]);
			}
		}
		else if(arr_Week.length==2){
			mav.addObject("arr_Week1",arr_Week[1]);
			
			if(arr_Grade.length==1) {
				map.put("grade", tripDTO.getGrade());
			}
			else if(arr_Grade.length==2) {
				map.put("grade", arr_Grade[0]);
				map.put("grade2", arr_Grade[1]);
				mav.addObject("arr_Grade1",arr_Grade[1]);
			}
			else if(arr_Grade.length==3) {
				mav.addObject("arr_Grade2",arr_Grade[2]);
			}
		}
		
		int totalA = packageTripDAO.getPackageTotalA(map);
		System.out.println("총페이지"+totalA);
		packagePaging.setCurrentPage(Integer.parseInt(pg));
		packagePaging.setPageBlock(3);
		packagePaging.setPageSize(3);
		packagePaging.setTotalA(totalA);
		packagePaging.makePagingHTML(tripDTO);
		List<PackageTripDTO> imageList = packageTripDAO.getImage(tripDTO.getArrive_city());
		List<TripDTO> packageList = packageTripDAO.getPackage(map);
		System.out.println("개수"+packageList.size());
		mav.addObject("packagePaging",packagePaging);
		mav.setViewName("jsonView");
		mav.addObject("packageList",packageList);
		return mav;
	}
	
	/*@RequestMapping(value="/packageTrip/productList.do")
	public ModelAndView productList(@ModelAttribute TripDTO tripDTO,@RequestParam(required=false) String pg,@RequestParam int seq) {
		ModelAndView mav = new ModelAndView();
		if(pg==null) pg="1";
		int endNum= Integer.parseInt(pg)*3;
		int startNum= endNum-2;
		System.out.println(pg);
		System.out.println(); 
		System.out.println(seq+"는몇일까");
		System.out.println("여행도시: "+tripDTO.getArrive_city());
		System.out.println("출발월: "+tripDTO.getDepart_date());
		System.out.println("출발도시: "+tripDTO.getDepart_city());
		System.out.println("출발요일: "+tripDTO.getWeek());
		System.out.println("상품등급: "+tripDTO.getGrade());
		System.out.println();
		
		TripDTO parentTripDTO = packageTripDAO.getParentPackage(seq);
		Map<String,String> map = new HashMap<String,String>();

		map.put("arrive_city",tripDTO.getArrive_city());
		map.put("depart_date", tripDTO.getDepart_date());
		map.put("depart_city", tripDTO.getDepart_city());
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		String arr_Week[] = tripDTO.getWeek().split(",");
		String arr_Grade[] = tripDTO.getGrade().split(",");
		
		if(arr_Week.length==1) {
			map.put("week", tripDTO.getWeek());
			
			if(arr_Grade.length==1) {
				map.put("grade", tripDTO.getGrade());
				
			}
			else if(arr_Grade.length==2) {
				map.put("grade", arr_Grade[0]);
				map.put("grade2", arr_Grade[1]);
				mav.addObject("arr_Grade1",arr_Grade[1]);
			}
			else if(arr_Grade.length==3) {
				mav.addObject("arr_Grade2",arr_Grade[2]);
			}
		}
		else if(arr_Week.length==2){
			mav.addObject("arr_Week1",arr_Week[1]);
			
			if(arr_Grade.length==1) {
				map.put("grade", tripDTO.getGrade());
			}
			else if(arr_Grade.length==2) {
				map.put("grade", arr_Grade[0]);
				map.put("grade2", arr_Grade[1]);
				mav.addObject("arr_Grade1",arr_Grade[1]);
			}
			else if(arr_Grade.length==3) {
				mav.addObject("arr_Grade2",arr_Grade[2]);
			}
		}
		
		int totalA = packageTripDAO.getPackageTotalA(map);
		System.out.println("총페이지"+totalA);
		packagePaging.setCurrentPage(Integer.parseInt(pg));
		packagePaging.setPageBlock(3);
		packagePaging.setPageSize(3);
		packagePaging.setTotalA(totalA);
		packagePaging.makePagingHTML(tripDTO);
		List<PackageTripDTO> imageList = packageTripDAO.getImage(tripDTO.getArrive_city());
		List<TripDTO> packageList = packageTripDAO.getPackage(map);
		System.out.println("개수"+packageList.size());
		
		mav.addObject("parentTripDTO",parentTripDTO);
		mav.setViewName("/main/index");
		mav.addObject("imageList",imageList);
		mav.addObject("packageList",packageList);
		mav.addObject("arrive_city",tripDTO.getArrive_city());
		mav.addObject("packagePaging",packagePaging);
		mav.addObject("display", "/packageTrip/productList.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		mav.addObject("arr_Week0",arr_Week[0]);
		mav.addObject("arr_Grade0",arr_Grade[0]);
		mav.addObject("tripDTO",tripDTO);
		mav.addObject("depart_city",tripDTO.getDepart_city());
		mav.addObject("depart_date",tripDTO.getDepart_date());
		return mav;
	}*/
	
	@RequestMapping(value="/packageTrip/productList.do")
	public ModelAndView productList(@ModelAttribute TripDTO tripDTO, @RequestParam(required=false) String pg, @RequestParam(required=false) String val) {
		System.out.println("productList_search");
		
		ModelAndView mav = new ModelAndView();
		if(pg==null) pg="1";
		if(val==null) val="not_json";
		int endNum= Integer.parseInt(pg)*3;
		int startNum= endNum-2;
		
		System.out.println("depart_date: "+tripDTO.getDepart_date());
		
		//System.out.println(pg);
		//System.out.println(); 
		//System.out.println(seq+"는몇일까");
		//System.out.println("여행도시: "+tripDTO.getArrive_city());
		//System.out.println("출발월: "+tripDTO.getDepart_date());
		//System.out.println("출발도시: "+tripDTO.getDepart_city());
		//System.out.println("출발요일: "+tripDTO.getWeek());
		//System.out.println("상품등급: "+tripDTO.getGrade());
		//System.out.println();
		
		TripDTO parentTripDTO = packageTripDAO.getParentPackage(tripDTO.getSeq());
		
		Map<String,String> map = new HashMap<String,String>();

		//map.put("arrive_city",tripDTO.getArrive_city());
		map.put("depart_date", tripDTO.getDepart_date());
		//map.put("depart_city", tripDTO.getDepart_city());
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		map.put("seq", tripDTO.getSeq()+"");
		
		String arr_Week[] = tripDTO.getWeek().split(",");
		String arr_Grade[] = tripDTO.getGrade().split(",");
		
		if(arr_Week.length==1) {
			map.put("week", tripDTO.getWeek());
			
			if(arr_Grade.length==1) {
				map.put("grade", tripDTO.getGrade());
				
			}
			else if(arr_Grade.length==2) {
				map.put("grade", arr_Grade[0]);
				map.put("grade2", arr_Grade[1]);
				mav.addObject("arr_Grade1",arr_Grade[1]);
			}
			else if(arr_Grade.length==3) {
				mav.addObject("arr_Grade2",arr_Grade[2]);
			}
		}
		else if(arr_Week.length==2){
			mav.addObject("arr_Week1",arr_Week[1]);
			
			if(arr_Grade.length==1) {
				map.put("grade", tripDTO.getGrade());
			}
			else if(arr_Grade.length==2) {
				map.put("grade", arr_Grade[0]);
				map.put("grade2", arr_Grade[1]);
				mav.addObject("arr_Grade1",arr_Grade[1]);
			}
			else if(arr_Grade.length==3) {
				mav.addObject("arr_Grade2",arr_Grade[2]);
			}
		}
		
		int totalA = packageTripDAO.getProductTotalA(map);
		
		//System.out.println("총페이지"+totalA);
		
		packagePaging.setCurrentPage(Integer.parseInt(pg));
		packagePaging.setPageBlock(3);
		packagePaging.setPageSize(3);
		packagePaging.setTotalA(totalA);
		packagePaging.makePagingHTML2(tripDTO);
		
		//List<PackageTripDTO> imageList = packageTripDAO.getImage(tripDTO.getArrive_city());
		List<TripDTO> packageList = null;
		packageList = packageTripDAO.getProductList(map);	
		
		
		System.out.println("개수"+packageList.size());
		
		System.out.println("val"+val);
		
		if(val.equals("not_json")) {
			mav.setViewName("/main/index");
		}
		else if(val.equals("json")) {
			mav.setViewName("jsonView");
		}
		
		mav.addObject("parentTripDTO",parentTripDTO);		
		//mav.addObject("image",tripDTO.getImageName());
		//mav.addObject("imageList",imageList);
		mav.addObject("packageList",packageList);
		mav.addObject("arrive_city",tripDTO.getArrive_city());
		mav.addObject("packagePaging",packagePaging);
		
		mav.addObject("display", "/packageTrip/productList.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		mav.addObject("arr_Week0",arr_Week[0]);
		mav.addObject("arr_Grade0",arr_Grade[0]);
		mav.addObject("tripDTO",tripDTO);
		mav.addObject("depart_city",tripDTO.getDepart_city());
		mav.addObject("depart_date",parentTripDTO.getDepart_date());
		mav.addObject("seq",tripDTO.getSeq());
		
		
		return mav;
	} 	
	
	
	@RequestMapping(value="/packageTrip/productView.do")
	public ModelAndView productView(@ModelAttribute TripDTO tripDTO,@RequestParam int son_seq,HttpSession session) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today= sdf.format(date);
		System.out.println("부모는"+tripDTO.getSeq()+"자식은"+son_seq);
		//부모DTO
		TripDTO parentDTO = packageTripDAO.getParentPackage(tripDTO.getSeq());
		System.out.println("1");
		//자식DTO
		TripDTO sonDTO = packageTripDAO.getParentPackage(son_seq);
		System.out.println("2");
		//출발 비행기
		System.out.println(sonDTO.getDepart_code()+","+sonDTO.getDepart_date());
		AirplaneDTO departAirDTO = airplaneDAO.getDepart_airplane(sonDTO.getDepart_code(),sonDTO.getDepart_date());
		//도착 비행기
		System.out.println(sonDTO.getArrive_code()+","+sonDTO.getArrive_date());
		AirplaneDTO arriveAirDTO = airplaneDAO.getArrive_airplane(sonDTO.getArrive_code(),sonDTO.getArrive_date());
		System.out.println(departAirDTO.getTotalTime());
		//여행계획 1일차,2일차
		TripPlanDTO tripPlanDTO = tripPlanDAO.getTripPlan(parentDTO.getArrive_city());
		System.out.println("5");
		//주요도시 정보
		MaincityInformDTO maincityInformDTO = maincityInformDAO.getMaincityInform(parentDTO.getArrive_city());
		//호텔 정보
		HotelDTO hotelDTO = hotelDAO.getHotelInform(sonDTO.getHotel_name().trim());
		//약관및참고사항
		System.out.println(sonDTO.getHotel_name().trim());
		ClauseDTO clauseDTO = clauseDAO.getClause(tripDTO.getArrive_city());	
		//해외안전정보
		SafetyInformDTO safetyInformDTO = safetyInformDAO.getSafetyInform(tripDTO.getArrive_city());
		int minimum_guest = sonDTO.getTotal_member()/3;
		
		java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("package_name", parentDTO.getPackage_name());
		map.put("hotel_name", "");
		map.put("adult_price", parentDTO.getAdult_price());
		map.put("imageName", parentDTO.getImageName());
		map.put("insertDate", sqlDate);
		
		packageTripDAO.insertRecentProductViewed(map);
		
		List<TripDTO> parentDTO_list = packageTripDAO.selectRecentProductViewed();
	
		session.setAttribute("parentDTO_list", parentDTO_list);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/main/index");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		mav.addObject("display","/packageTrip/productView.jsp");
		mav.addObject("parentDTO",parentDTO);
		mav.addObject("sonDTO",sonDTO);
		mav.addObject("today",today);
		mav.addObject("minimum_guest",minimum_guest);
		mav.addObject("tripPlanDTO",tripPlanDTO);
		mav.addObject("hotelDTO",hotelDTO);
		mav.addObject("maincityInformDTO",maincityInformDTO);
		mav.addObject("departAirDTO",departAirDTO);
		mav.addObject("arriveAirDTO",arriveAirDTO);
		mav.addObject("clauseDTO",clauseDTO);
		mav.addObject("safetyInformDTO",safetyInformDTO);
		return mav;
	
	
	}
	@RequestMapping(value="/packageTrip/basket.do")
	public ModelAndView basket(@RequestParam Map<String,String> map) {
		ModelAndView mav= new ModelAndView();
		String id = map.get("id");
		String product_name= map.get("product_name");
		String depart_date = map.get("depart_date");
		String adult_price= map.get("adult_price");
		String teen_price= map.get("teen_price");
		String baby_price= map.get("baby_price");
		String search = map.get("search");
		search+="&arrive_city="+map.get("arrive_city")+"&seq="+map.get("seq");
		map.put("search",search);
		System.out.println(id+","+product_name+","+depart_date+adult_price+teen_price+baby_price+search+map.get("arrive_city")+map.get("seq"));
		basketInformDAO.insertBasketInform(map);
		mav.setViewName("/main/index");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		mav.addObject("display","/mypage/mypage.jsp");
		mav.addObject("contents", "/mypage/content03_basket.jsp");
		return mav;
	}

	@RequestMapping(value="/packageTrip/member_reservation.do")
	public ModelAndView member_reservation(@RequestParam Map<String,String> map,HttpSession session,@ModelAttribute PayInformDTO payInformDTO) {
		ModelAndView mav= new ModelAndView();
		int son_seq = Integer.parseInt(map.get("son_seq"));
		int total_price= payInformDTO.getTotal_price();
		int adult_number= Integer.parseInt(map.get("adult_number"));
		int teen_number= Integer.parseInt(map.get("teen_number"));
		int baby_number= Integer.parseInt(map.get("baby_number"));
		int total_member= adult_number+teen_number+baby_number;
		System.out.println(son_seq+","+total_price+","+adult_number+","+teen_number+","+baby_number);
		//자식DTO
		TripDTO sonDTO = packageTripDAO.getParentPackage(son_seq);
		if(session.getAttribute("memId")!=null) {
			MemberDTO memberDTO = memberDAO.getMember((String) session.getAttribute("memId"));
			mav.addObject("memberDTO",memberDTO);
		}
		mav.addObject("sonDTO",sonDTO);
		mav.addObject("payInformDTO",payInformDTO);
		mav.addObject("display","/packageTrip/member_reservation.jsp");
		mav.addObject("adult_number",adult_number);
		mav.addObject("teen_number",teen_number);
		mav.addObject("baby_number",baby_number);
		mav.addObject("total_member",total_member);
		mav.addObject("menu", "/menu/whole_menu.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping(value="/packageTrip/noMember_reservation.do")
	public ModelAndView noMember_reservation(@RequestParam Map<String,String> map,@ModelAttribute PayInformDTO payDTO) {
		ModelAndView mav= new ModelAndView();
		//자식DTO
		int son_seq = Integer.parseInt(map.get("son_seq"));
		int total_price= payDTO.getTotal_price();
		int adult_number= Integer.parseInt(map.get("adult_number"));
		int teen_number= Integer.parseInt(map.get("teen_number"));
		int baby_number= Integer.parseInt(map.get("baby_number"));
		int total_member= adult_number+teen_number+baby_number;

		System.out.println(son_seq+","+total_price+","+adult_number+","+teen_number+","+baby_number);
		TripDTO sonDTO = packageTripDAO.getParentPackage(son_seq);
		mav.addObject("sonDTO",sonDTO);
		mav.addObject("total_price",total_price);
		mav.addObject("adult_number",adult_number);
		mav.addObject("payDTO",payDTO);
		mav.addObject("teen_number",teen_number);
		mav.addObject("baby_number",baby_number);
		mav.addObject("total_member",total_member);
		mav.addObject("display","/packageTrip/noMember_reservation.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		mav.setViewName("/main/index");
	
		return mav;
	}
	
	@RequestMapping(value="/packageTrip/hello.do")
	public ModelAndView hello(@RequestParam String[] id, @RequestParam String[] pwd) {
		ModelAndView mav = new ModelAndView();
		System.out.println(id[0]+":"+pwd[0]);
		System.out.println(id[1]+":"+pwd[1]);
		return mav;
	}
	
	@RequestMapping(value="/packageTrip/payComplete.do")
	public ModelAndView payComplete(@RequestParam String[] name, @RequestParam String[] first_name, @RequestParam String[] last_name,@RequestParam String[] year,
									@RequestParam String[] month, @RequestParam String[] day, @RequestParam String[] email, @RequestParam String[] email1,
									@RequestParam String[] phone, @RequestParam String[] phone1, @RequestParam String[] passport_num, @RequestParam String[] gender,
									@RequestParam String[] passport_year, @RequestParam String[] passport_month, @RequestParam String[] passport_day,@ModelAttribute PayInformDTO payInformDTO,
									@RequestParam int adult_number,@RequestParam int teen_number,@RequestParam int baby_number,@RequestParam String no_member,@RequestParam int son_seq) {
	int size= name.length;
	ModelAndView mav= new ModelAndView();
	//결제값
	payInformDTO.setAirplane_code("");
	payInformDTO.setHotel_code("");
	payInformDTO.setHotel_name("");
	payInformDTO.setAirplane_name("");
	payInformDTO.setLocation("");
	payInformDTO.setRentcar_code("");
	payInformDAO.insertPayInform(payInformDTO);
	//결제번호
	String pay_number = payInformDAO.getPayNumber(payInformDTO.getPay_name());
	System.out.println("pay_number+"+pay_number);
	for(int i=0; i<adult_number; i++) {
		TravelerInformDTO travelerInformDTO=new TravelerInformDTO();
		travelerInformDTO.setNum(pay_number);
		travelerInformDTO.setName(name[i]);
		travelerInformDTO.setAges("성인");
		travelerInformDTO.setFirst_name(first_name[i]);
		travelerInformDTO.setLast_name(last_name[i]);
		travelerInformDTO.setYear(year[i]);
		travelerInformDTO.setGender(gender[i]);
		travelerInformDTO.setMonth(month[i]);
		travelerInformDTO.setDay(day[i]);
		travelerInformDTO.setEmail(email[i]);
		travelerInformDTO.setEmail1(email1[i]);
		travelerInformDTO.setPhone(phone[i]);
		travelerInformDTO.setPhone1(phone1[i]);
		travelerInformDTO.setPassport_num(passport_num[i]);
		travelerInformDTO.setPassport_year(passport_year[i]);
		travelerInformDTO.setPassport_month(passport_month[i]);
		travelerInformDTO.setPassport_day(passport_day[i]);
		travelerInformDAO.insertTraveler(travelerInformDTO);
		System.out.println(name[i]+","+first_name[i]+","+last_name[i]+","+year[i]+","+month[i]+","+day[i]+email[i]+email1[i]+phone[i]+phone1[i]+passport_num[i]+passport_year[i]+passport_month[i]+passport_day[i]);	
		}
		for(int i=adult_number; i<size-baby_number; i++) {
			TravelerInformDTO travelerInformDTO=new TravelerInformDTO();
			travelerInformDTO.setNum(pay_number);
			travelerInformDTO.setName(name[i]);
			travelerInformDTO.setAges("아동");
			travelerInformDTO.setFirst_name(first_name[i]);
			travelerInformDTO.setLast_name(last_name[i]);
			travelerInformDTO.setYear(year[i]);
			travelerInformDTO.setGender(gender[i]);
			travelerInformDTO.setMonth(month[i]);
			travelerInformDTO.setDay(day[i]);
			travelerInformDTO.setEmail(email[i]);
			travelerInformDTO.setEmail1(email1[i]);
			travelerInformDTO.setPhone(phone[i]);
			travelerInformDTO.setPhone1(phone1[i]);
			travelerInformDTO.setPassport_num(passport_num[i]);
			travelerInformDTO.setPassport_year(passport_year[i]);
			travelerInformDTO.setPassport_month(passport_month[i]);
			travelerInformDTO.setPassport_day(passport_day[i]);
			travelerInformDAO.insertTraveler(travelerInformDTO);
			System.out.println(name[i]+","+first_name[i]+","+last_name[i]+","+year[i]+","+month[i]+","+day[i]+email[i]+email1[i]+phone[i]+phone1[i]+passport_num[i]+passport_year[i]+passport_month[i]+passport_day[i]);	
			}
		for(int i=size-baby_number; i<size; i++) {
			TravelerInformDTO travelerInformDTO=new TravelerInformDTO();
			travelerInformDTO.setNum(pay_number);
			travelerInformDTO.setName(name[i]);
			travelerInformDTO.setAges("유아");
			travelerInformDTO.setFirst_name(first_name[i]);
			travelerInformDTO.setLast_name(last_name[i]);
			travelerInformDTO.setYear(year[i]);
			travelerInformDTO.setGender(gender[i]);
			travelerInformDTO.setMonth(month[i]);
			travelerInformDTO.setDay(day[i]);
			travelerInformDTO.setEmail(email[i]);
			travelerInformDTO.setEmail1(email1[i]);
			travelerInformDTO.setPhone(phone[i]);
			travelerInformDTO.setPhone1(phone1[i]);
			travelerInformDTO.setPassport_num(passport_num[i]);
			travelerInformDTO.setPassport_year(passport_year[i]);
			travelerInformDTO.setPassport_month(passport_month[i]);
			travelerInformDTO.setPassport_day(passport_day[i]);
			travelerInformDAO.insertTraveler(travelerInformDTO);
			System.out.println(name[i]+","+first_name[i]+","+last_name[i]+","+year[i]+","+month[i]+","+day[i]+email[i]+email1[i]+phone[i]+phone1[i]+passport_num[i]+passport_year[i]+passport_month[i]+passport_day[i]);	
			}
		if(!no_member.equals("no_member")) {
			System.out.println(payInformDTO.getTotal_price());
			String point =  (payInformDTO.getTotal_price()*0.01)+"";
			//System.out.println(point);
			memberDAO.addPoint(payInformDTO.getPay_name(), point);
			//System.out.println(5);
			}
		
		
		if(no_member.equals("no_member")) {
			  DecimalFormat df = new DecimalFormat("#,###");

			String send_email =payInformDTO.getPay_email()+"@"+payInformDTO.getPay_email1();
			
			String charSet = "utf-8";
			String hostSMTP = "smtp.naver.com";
			String hostSMTPid = "kslhk8@naver.com";
			String hostSMTPpwd = "qja950206";
			
			String fromEmail = "kslhk8@naver.com";
			String fromName = "TwoTour Company";
			String subject = "";
			String msg = "";
			
			subject = "TwoTour 결제번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg +="결제번호는"+pay_number+"입니다.</h3>";
			msg += "<h3>결제금액은"+df.format(payInformDTO.getTotal_price())+"원 입니다.</h3>";
			msg +="</div>";
			
			try {
				HtmlEmail htmlEmail = new HtmlEmail();
				htmlEmail.setDebug(true);
				htmlEmail.setCharset(charSet);
				htmlEmail.setHostName(hostSMTP);
				htmlEmail.setSmtpPort(587);

				htmlEmail.setAuthentication(hostSMTPid, hostSMTPpwd);
				htmlEmail.addTo(send_email, charSet);
				htmlEmail.setFrom(fromEmail, fromName, charSet);
				htmlEmail.setSubject(subject);
				htmlEmail.setHtmlMsg(msg);
				htmlEmail.send();
				mav.addObject("pay_result","결제성공");
			} catch (Exception e) {
				System.out.println("메일발송 실패 : " + e);
			}
			
			
		}
		
		packageTripDAO.updateReservationNumber(son_seq,size);
		
		mav.setViewName("/main/index");
		mav.addObject("total_price",payInformDTO.getTotal_price());
		mav.addObject("result","pay");
		mav.addObject("display","/template/end.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
	return mav;
	}
	
	@RequestMapping(value="/packageTrip/reservationComplete.do")
			public ModelAndView reservationComplete(@RequestParam String[] name, @RequestParam String[] first_name, @RequestParam String[] last_name,@RequestParam String[] year,
					@RequestParam String[] month, @RequestParam String[] day, @RequestParam String[] email, @RequestParam String[] email1,
					@RequestParam String[] phone, @RequestParam String[] phone1, @RequestParam String[] passport_num, @RequestParam String[] gender,
					@RequestParam String[] passport_year, @RequestParam String[] passport_month, @RequestParam String[] passport_day,@ModelAttribute ReservationInformDTO reservationInformDTO,
					@RequestParam int adult_number,@RequestParam int teen_number,@RequestParam int baby_number,@RequestParam String no_member, @RequestParam int son_seq) {
			int size= name.length;
			System.out.println(adult_number+","+teen_number+","+baby_number);
			System.out.println(no_member+"입니다");
			ModelAndView mav= new ModelAndView();
			System.out.println(reservationInformDTO.getReservation_name()+","+reservationInformDTO.getArrive_time()+reservationInformDTO.getDepart_time()+reservationInformDTO.getPackage_name()+reservationInformDTO.getPackage_code()+reservationInformDTO.getReservation_email()+reservationInformDTO.getReservation_email1()+reservationInformDTO.getTotal_member()+reservationInformDTO.getTotal_price());
			reservationInformDTO.setAirplane_code("");
			reservationInformDTO.setHotel_code("");
			reservationInformDTO.setHotel_name("");
			reservationInformDTO.setAirplane_name("");
			reservationInformDTO.setLocation("");
			reservationInformDTO.setRentcar_code("");
			reservationInformDAO.insertReservaionInform(reservationInformDTO);
			String reservation_number= reservationInformDAO.getReservationNumber(reservationInformDTO.getReservation_name());
			System.out.println(reservation_number+"예약번호");
			for(int i=0; i<adult_number; i++) {
			TravelerInformDTO travelerInformDTO=new TravelerInformDTO();
			travelerInformDTO.setNum(reservation_number);
			travelerInformDTO.setName(name[i]);
			travelerInformDTO.setAges("성인");
			travelerInformDTO.setFirst_name(first_name[i]);
			travelerInformDTO.setLast_name(last_name[i]);
			travelerInformDTO.setYear(year[i]);
			travelerInformDTO.setGender(gender[i]);
			travelerInformDTO.setMonth(month[i]);
			travelerInformDTO.setDay(day[i]);
			travelerInformDTO.setEmail(email[i]);
			travelerInformDTO.setEmail1(email1[i]);
			travelerInformDTO.setPhone(phone[i]);
			travelerInformDTO.setPhone1(phone1[i]);
			travelerInformDTO.setPassport_num(passport_num[i]);
			travelerInformDTO.setPassport_year(passport_year[i]);
			travelerInformDTO.setPassport_month(passport_month[i]);
			travelerInformDTO.setPassport_day(passport_day[i]);
			travelerInformDAO.insertTraveler(travelerInformDTO);
			System.out.println(name[i]+","+first_name[i]+","+last_name[i]+","+year[i]+","+month[i]+","+day[i]+email[i]+email1[i]+phone[i]+phone1[i]+passport_num[i]+passport_year[i]+passport_month[i]+passport_day[i]);	
			}
			for(int i=adult_number; i<size-baby_number; i++) {
				TravelerInformDTO travelerInformDTO=new TravelerInformDTO();
				travelerInformDTO.setNum(reservation_number);
				travelerInformDTO.setName(name[i]);
				travelerInformDTO.setAges("아동");
				travelerInformDTO.setFirst_name(first_name[i]);
				travelerInformDTO.setLast_name(last_name[i]);
				travelerInformDTO.setYear(year[i]);
				travelerInformDTO.setGender(gender[i]);
				travelerInformDTO.setMonth(month[i]);
				travelerInformDTO.setDay(day[i]);
				travelerInformDTO.setEmail(email[i]);
				travelerInformDTO.setEmail1(email1[i]);
				travelerInformDTO.setPhone(phone[i]);
				travelerInformDTO.setPhone1(phone1[i]);
				travelerInformDTO.setPassport_num(passport_num[i]);
				travelerInformDTO.setPassport_year(passport_year[i]);
				travelerInformDTO.setPassport_month(passport_month[i]);
				travelerInformDTO.setPassport_day(passport_day[i]);
				travelerInformDAO.insertTraveler(travelerInformDTO);
				System.out.println(name[i]+","+first_name[i]+","+last_name[i]+","+year[i]+","+month[i]+","+day[i]+email[i]+email1[i]+phone[i]+phone1[i]+passport_num[i]+passport_year[i]+passport_month[i]+passport_day[i]);	
				}
			for(int i=size-baby_number; i<size; i++) {
				TravelerInformDTO travelerInformDTO=new TravelerInformDTO();
				travelerInformDTO.setNum(reservation_number);
				travelerInformDTO.setName(name[i]);
				travelerInformDTO.setAges("유아");
				travelerInformDTO.setFirst_name(first_name[i]);
				travelerInformDTO.setLast_name(last_name[i]);
				travelerInformDTO.setYear(year[i]);
				travelerInformDTO.setGender(gender[i]);
				travelerInformDTO.setMonth(month[i]);
				travelerInformDTO.setDay(day[i]);
				travelerInformDTO.setEmail(email[i]);
				travelerInformDTO.setEmail1(email1[i]);
				travelerInformDTO.setPhone(phone[i]);
				travelerInformDTO.setPhone1(phone1[i]);
				travelerInformDTO.setPassport_num(passport_num[i]);
				travelerInformDTO.setPassport_year(passport_year[i]);
				travelerInformDTO.setPassport_month(passport_month[i]);
				travelerInformDTO.setPassport_day(passport_day[i]);
				travelerInformDAO.insertTraveler(travelerInformDTO);
				System.out.println(name[i]+","+first_name[i]+","+last_name[i]+","+year[i]+","+month[i]+","+day[i]+email[i]+email1[i]+phone[i]+phone1[i]+passport_num[i]+passport_year[i]+passport_month[i]+passport_day[i]);	
				}
			if(no_member.equals("no_member")) {
				String send_email =reservationInformDTO.getReservation_email()+"@"+reservationInformDTO.getReservation_email1();
				
				String charSet = "utf-8";
				String hostSMTP = "smtp.naver.com";
				String hostSMTPid = "kslhk8@naver.com";
				String hostSMTPpwd = "qja950206";
				
				String fromEmail = "kslhk8@naver.com";
				String fromName = "TowTour Company";
				String subject = "";
				String msg = "";
				
				subject = "TwoTour 예약번호 입니다.";
				msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
				msg += "<h3 style='color: blue;'>";
				msg +="예약번호는"+reservation_number+"입니다.</h3>";
				msg +="</div>";
				
				try {
					HtmlEmail htmlEmail = new HtmlEmail();
					htmlEmail.setDebug(true);
					htmlEmail.setCharset(charSet);
					htmlEmail.setHostName(hostSMTP);
					htmlEmail.setSmtpPort(587);

					htmlEmail.setAuthentication(hostSMTPid, hostSMTPpwd);
					htmlEmail.addTo(send_email, charSet);
					htmlEmail.setFrom(fromEmail, fromName, charSet);
					htmlEmail.setSubject(subject);
					htmlEmail.setHtmlMsg(msg);
					htmlEmail.send();
					mav.addObject("reservation_result","예약성공");
				} catch (Exception e) {
					System.out.println("메일발송 실패 : " + e);
				}
				
				
			}
			
			packageTripDAO.updateReservationNumber(son_seq,size);
			
			List<TravelerInformDTO> travelerList = travelerInformDAO.getTravelerInform(reservation_number);
			System.out.println(travelerList.size()+"개");
			mav.setViewName("/main/index");
			mav.addObject("result","reservation");
			mav.addObject("display","/template/end.jsp");
			mav.addObject("menu", "/menu/whole_menu.jsp");
			return mav;
	}
	
		//예약확인 보기
			@RequestMapping(value="/packageTrip/reservationInformView.do")
			public ModelAndView reservationInformView(@RequestParam String num, String check_status,
					String package_code, String package_name, String total_price, String totalPrice) {
				ModelAndView mav= new ModelAndView();
				mav.addObject("num", num);
				mav.addObject("package_code", package_code);
				mav.addObject("package_name", package_name);
				mav.addObject("total_price", total_price);
				mav.addObject("totalPrice", totalPrice);
				mav.addObject("check_status", check_status);
				mav.addObject("display","/packageTrip/reservationInformView.jsp");
				mav.addObject("menu", "/menu/whole_menu.jsp");
				
				mav.setViewName("/main/index");
				return mav;
			}
			//결제완료 보기
			@RequestMapping(value="/packageTrip/paymentInformView.do")
			public ModelAndView paymentInformView(@RequestParam String num, String totalPrice, String check_status,
											String package_code, String package_name, String total_price) {
				ModelAndView mav= new ModelAndView();
				mav.addObject("num", num);
				mav.addObject("package_code", package_code);
				mav.addObject("package_name", package_name);
				mav.addObject("total_price", total_price);
				mav.addObject("totalPrice", totalPrice);
				mav.addObject("check_status", check_status);
				mav.addObject("display","/packageTrip/paymentInformView.jsp");
				mav.addObject("menu", "/menu/whole_menu.jsp");
				mav.setViewName("/main/index");
				return mav;
			}
		
			
			
			@RequestMapping(value="/packageTrip/no_reservationInformView.do")
			public ModelAndView no_reservationInformView(@RequestParam String num, String package_code, String package_name) {
				ModelAndView mav= new ModelAndView();
				ReservationInformDTO reservationInformDTO = reservationInformDAO.getReservationByNumber(num);
				mav.addObject("num", num);
				mav.addObject("reservationInformDTO",reservationInformDTO);
				mav.addObject("package_code", package_code);
				mav.addObject("package_name", package_name);
				mav.addObject("display","/packageTrip/no_reservationInformView.jsp");
				mav.addObject("menu", "/menu/whole_menu.jsp");
				mav.setViewName("/main/index");
				return mav;
			}
		
			
			//예약확인- 패키지 정보 가져오기
			@RequestMapping(value="/packageTrip/getTripInformByCode.do")
			public ModelAndView getTripInformByCode(@RequestParam String package_code) {
				ModelAndView mav= new ModelAndView();
				TripDTO tripDTO = packageTripDAO.getTripInformByCode(package_code);
				mav.addObject("tripDTO", tripDTO);
				mav.setViewName("jsonView");
				return mav;
			}
			
			//예약확인 - 여행자 정보 가져오기
			@RequestMapping(value="/packageTrip/getTravelerInform.do")
			public ModelAndView getTravelerInform(@RequestParam String num) {
				ModelAndView mav= new ModelAndView();
				List<TravelerInformDTO> list = travelerInformDAO.getTravelerInform(num);
				for(TravelerInformDTO dto : list) {
					if(dto.getEmail()==null) dto.setEmail("");
					if(dto.getPhone1()==null) dto.setPhone1("");
					if(dto.getPassport_day()==null) dto.setPassport_day("");
					if(dto.getPassport_month()==null) dto.setPassport_month("");
					if(dto.getPassport_num()==null) dto.setPassport_num("");
					if(dto.getPassport_year()==null) dto.setPassport_year("");
				}
				mav.addObject("list", list);
				mav.setViewName("jsonView");
				return mav;
			}
			
			//결제완료 - 여행자 정보 가져오기
			@RequestMapping(value="/packageTrip/getPayedTravelerInform.do")
			public ModelAndView getPayedTravelerInform(@RequestParam String num) {
				ModelAndView mav= new ModelAndView();
				List<TravelerInformDTO> list = payInformDAO.getTravelerInform(num);
				for(TravelerInformDTO dto : list) {
					if(dto.getEmail()==null) dto.setEmail("");
					if(dto.getPhone1()==null) dto.setPhone1("");
					if(dto.getPassport_day()==null) dto.setPassport_day("");
					if(dto.getPassport_month()==null) dto.setPassport_month("");
					if(dto.getPassport_num()==null) dto.setPassport_num("");
					if(dto.getPassport_year()==null) dto.setPassport_year("");
				}
				mav.addObject("list", list);
				mav.setViewName("jsonView");
				return mav;
			}
			
			//예약확인 - 예약 인원 추가&수정
			@RequestMapping(value="/packageTrip/modifyTravelerInsert.do")
			   public ModelAndView modifyTraveler(
					    @RequestParam String[] name, @RequestParam String[] first_name, @RequestParam String[] last_name,@RequestParam String[] year,
						@RequestParam String[] month, @RequestParam String[] day, @RequestParam String[] email, @RequestParam String[] email1,
						@RequestParam String[] phone, @RequestParam String[] phone1, @RequestParam String[] passport_num, @RequestParam String[] gender,
						@RequestParam String[] passport_year, @RequestParam String[] passport_month, @RequestParam String[] passport_day,
						@RequestParam String[] passport_origin, @RequestParam String reservation_number, @RequestParam String[] ages,
						
						@RequestParam String[] name2, @RequestParam String[] first_name2, @RequestParam String[] last_name2, @RequestParam String[] year2,
						@RequestParam String[] month2, @RequestParam String[] day2, @RequestParam String[] email2, @RequestParam String[] email12,
						@RequestParam String[] phone2, @RequestParam String[] phone12, @RequestParam String[] passport_num2, @RequestParam String[] gender2,
						@RequestParam String[] passport_year2, @RequestParam String[] passport_month2, @RequestParam String[] passport_day2,
						@RequestParam String[] ages2, @RequestParam int son_seq, @RequestParam int size,
						
						@RequestParam int adult_price, @RequestParam int teen_price, @RequestParam int baby_price
			   ) 
			
			{
				ModelAndView mav= new ModelAndView();
				
				System.out.println("성인가격="+adult_price);
				System.out.println("아동가격="+teen_price);
				System.out.println("유아가격="+baby_price);
				System.out.println(reservation_number+": 예약번호"+", moremeber="+size);
				
				int adult_number= 0;
				int teen_number= 0;
				int baby_number=0;
				
				for(int i=0; i<ages.length; i++) {
					if(ages[i].equals("성인")) adult_number++;
					else if(ages[i].equals("아동")) teen_number++;
					else if(ages[i].equals("유아")) baby_number++;
				
				TravelerInformDTO travelerInformDTO=new TravelerInformDTO();
				travelerInformDTO.setNum(reservation_number);
				travelerInformDTO.setName(name[i]);
				travelerInformDTO.setAges(ages[i]);
				travelerInformDTO.setFirst_name(first_name[i]);
				travelerInformDTO.setLast_name(last_name[i]);
				travelerInformDTO.setYear(year[i]);
				travelerInformDTO.setGender(gender[i]);
				travelerInformDTO.setMonth(month[i]);
				travelerInformDTO.setDay(day[i]);
				travelerInformDTO.setEmail(email[i]);
				travelerInformDTO.setEmail1(email1[i]);
				travelerInformDTO.setPhone(phone[i]);
				travelerInformDTO.setPhone1(phone1[i]);
				travelerInformDTO.setPassport_num(passport_num[i]);
				travelerInformDTO.setPassport_year(passport_year[i]);
				travelerInformDTO.setPassport_month(passport_month[i]);
				travelerInformDTO.setPassport_day(passport_day[i]);
				travelerInformDTO.setPassport_origin(passport_origin[i]);
				System.out.println(passport_origin[i]);
				travelerInformDAO.modifyTraveler(travelerInformDTO);
				//System.out.println(ages[i]+","+name[i]+","+first_name[i]+","+last_name[i]+","+year[i]+","+month[i]+","+day[i]+email[i]+email1[i]+phone[i]+phone1[i]+passport_num[i]+passport_year[i]+passport_month[i]+passport_day[i]);	
			
				}

				for(int i=0; i<ages2.length; i++) {
					if(ages2[i].equals("성인")) adult_number++;
					else if(ages2[i].equals("아동")) teen_number++;
					else if(ages2[i].equals("유아")) baby_number++;
				
				TravelerInformDTO travelerInformDTO=new TravelerInformDTO();
				travelerInformDTO.setNum(reservation_number);
				travelerInformDTO.setName(name2[i]);
				travelerInformDTO.setAges(ages2[i]);
				travelerInformDTO.setFirst_name(first_name2[i]);
				travelerInformDTO.setLast_name(last_name2[i]);
				travelerInformDTO.setYear(year2[i]);
				travelerInformDTO.setGender(gender2[i]);
				travelerInformDTO.setMonth(month2[i]);
				travelerInformDTO.setDay(day2[i]);
				travelerInformDTO.setEmail(email2[i]);
				travelerInformDTO.setEmail1(email12[i]);
				travelerInformDTO.setPhone(phone2[i]);
				travelerInformDTO.setPhone1(phone12[i]);
				travelerInformDTO.setPassport_num(passport_num2[i]);
				travelerInformDTO.setPassport_year(passport_year2[i]);
				travelerInformDTO.setPassport_month(passport_month2[i]);
				travelerInformDTO.setPassport_day(passport_day2[i]);
				travelerInformDAO.insertTraveler(travelerInformDTO);
				//System.out.println(ages[i]+","+name[i]+","+first_name[i]+","+last_name[i]+","+year[i]+","+month[i]+","+day[i]+email[i]+email1[i]+phone[i]+phone1[i]+passport_num[i]+passport_year[i]+passport_month[i]+passport_day[i]);	
			
				}

			
				//인원수 변경 -reservationInformTable
				int total_member = adult_number+teen_number+baby_number;
				Map map = new HashMap();
				map.put("total_member", total_member);
				map.put("reservation_number", reservation_number);
				
				
				//총금액 변경 -reservationInformTable
				int total_price = (adult_number * adult_price) 
									   + (teen_number * teen_price) 
									   + (baby_number * baby_price);
				
				map.put("total_price", total_price);
				reservationInformDAO.updateTotalMember(map);
				
				
				//인원수 변경-tripInformTable
				 packageTripDAO.updateReservationNumber(son_seq,size);
				
				mav.setViewName("/main/index");
				mav.addObject("result","modify");
				mav.addObject("display","/template/end.jsp");
				mav.addObject("menu", "/menu/whole_menu.jsp");
				
				return mav;
				
		}
			//예약확인 - 예약 수정
			@RequestMapping(value="/packageTrip/modifyTraveler.do")
			   public ModelAndView modifyTraveler(
					    @RequestParam String[] name, @RequestParam String[] first_name, @RequestParam String[] last_name,@RequestParam String[] year,
						@RequestParam String[] month, @RequestParam String[] day, @RequestParam String[] email, @RequestParam String[] email1,
						@RequestParam String[] phone, @RequestParam String[] phone1, @RequestParam String[] passport_num, @RequestParam String[] gender,
						@RequestParam String[] passport_year, @RequestParam String[] passport_month, @RequestParam String[] passport_day,
						@RequestParam String[] passport_origin, @RequestParam String reservation_number, @RequestParam String[] ages
			   ) 
			
			{
				ModelAndView mav= new ModelAndView();
				
				System.out.println(reservation_number+"예약번호");
				
				
				
				for(int i=0; i<ages.length; i++) {
				
				TravelerInformDTO travelerInformDTO=new TravelerInformDTO();
				travelerInformDTO.setNum(reservation_number);
				travelerInformDTO.setName(name[i]);
				travelerInformDTO.setAges(ages[i]);
				travelerInformDTO.setFirst_name(first_name[i]);
				travelerInformDTO.setLast_name(last_name[i]);
				travelerInformDTO.setYear(year[i]);
				travelerInformDTO.setGender(gender[i]);
				travelerInformDTO.setMonth(month[i]);
				travelerInformDTO.setDay(day[i]);
				travelerInformDTO.setEmail(email[i]);
				travelerInformDTO.setEmail1(email1[i]);
				travelerInformDTO.setPhone(phone[i]);
				travelerInformDTO.setPhone1(phone1[i]);
				travelerInformDTO.setPassport_num(passport_num[i]);
				travelerInformDTO.setPassport_year(passport_year[i]);
				travelerInformDTO.setPassport_month(passport_month[i]);
				travelerInformDTO.setPassport_day(passport_day[i]);
				travelerInformDTO.setPassport_origin(passport_origin[i]);
				//System.out.println(ages[i]+","+name[i]+","+first_name[i]+","+last_name[i]+","+year[i]+","+month[i]+","+day[i]+email[i]+email1[i]+phone[i]+phone1[i]+passport_num[i]+passport_year[i]+passport_month[i]+passport_day[i]);	
				System.out.println("갑니다:"+passport_origin[i]);
				travelerInformDAO.modifyTraveler(travelerInformDTO);
				}

				mav.setViewName("/main/index");
				mav.addObject("result","modify");
				mav.addObject("display","/template/end.jsp");
				mav.addObject("menu", "/menu/whole_menu.jsp");
				return mav;
				
		}
			//결제하기
			@RequestMapping(value="/packageTrip/modifyPayComplete.do")
			public ModelAndView payComplete(@RequestParam String reservation_number,@RequestParam(required=false) String total_price,@RequestParam(required=false) String id,@RequestParam(required=false) String no_member) {
				ModelAndView mav= new ModelAndView();	
			
				//예약정보 가져오기
				String num = reservation_number;
				ReservationInformDTO	reservationDTO = reservationInformDAO.getReservationByNumber(num);
				System.out.println(1);
				//예약정보를 payInform 테이블에 insert (결제완료)
				payInformDAO.modifyPayCompleteInsert(reservationDTO);
				System.out.println(2);
				//travelerInform 테이블 num 을 pay_number로 바꿔주기
				travelerInformDAO.updateToPayNum(reservation_number);
				System.out.println(3);
				//reservationinform 테이블에서 예약 삭제
				reservationInformDAO.removePayed(reservation_number);
				System.out.println(4);
				//포인트 추가	
				if(id!=null) {
				System.out.println(total_price);
				String point =  (int)(Integer.parseInt(total_price.trim())*0.01)+"";
				//System.out.println(point);
				memberDAO.addPoint(id, point);
				//System.out.println(5);
				}
				PayInformDTO payInformDTO = payInformDAO.getLastPayInform();

				if(no_member!=null &&no_member.equals("no_member")) {
					DecimalFormat df = new DecimalFormat("#,###");
					String send_email =payInformDTO.getPay_email()+"@"+payInformDTO.getPay_email1();
					
					String charSet = "utf-8";
					String hostSMTP = "smtp.naver.com";
					String hostSMTPid = "kslhk8@naver.com";
					String hostSMTPpwd = "qja950206";
					
					String fromEmail = "kslhk8@naver.com";
					String fromName = "TowTour Company";
					String subject = "";
					String msg = "";
					
					subject = "TwoTour 결제번호 입니다.";
					msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
					msg += "<h3 style='color: blue;'>";
					msg +="결제번호는"+payInformDTO.getPay_number()+"입니다.</h3>";
					msg += "<h3>결제금액은"+df.format(payInformDTO.getTotal_price())+"원 입니다.</h3>";
					msg +="</div>";
					
					try {
						HtmlEmail htmlEmail = new HtmlEmail();
						htmlEmail.setDebug(true);
						htmlEmail.setCharset(charSet);
						htmlEmail.setHostName(hostSMTP);
						htmlEmail.setSmtpPort(587);

						htmlEmail.setAuthentication(hostSMTPid, hostSMTPpwd);
						htmlEmail.addTo(send_email, charSet);
						htmlEmail.setFrom(fromEmail, fromName, charSet);
						htmlEmail.setSubject(subject);
						htmlEmail.setHtmlMsg(msg);
						htmlEmail.send();
						mav.addObject("pay_result","결제성공");
					} catch (Exception e) {
						System.out.println("메일발송 실패 : " + e);
					}
				}
				
				mav.setViewName("/main/index");
				mav.addObject("result","pay");
				mav.addObject("total_price",payInformDTO.getTotal_price());
				mav.addObject("display","/template/end.jsp");
				mav.addObject("menu", "/menu/whole_menu.jsp");
				return mav;
			}
			
			//예약 취소
			@RequestMapping(value="/packageTrip/cancelReservation.do")
			public ModelAndView cancelReservation(@RequestParam String reservation_number,@RequestParam String reserved_total_member,@RequestParam int son_seq,@RequestParam(required=false) String no_member) {
				ModelAndView mav= new ModelAndView();	
				System.out.println(no_member);
				//예약테이블 status: 예약취소 
				reservationInformDAO.cancelReservation(reservation_number);
				//패키지 reservation_member 인원 줄이기
				Map<String, Integer> map = new HashMap<String, Integer>();
				map.put("reserved_total_member", Integer.parseInt(reserved_total_member));
				map.put("son_seq", son_seq);
				packageTripDAO.reduceReservedMember(map);
			
				if(no_member!=null && no_member.equals("no_member")) {
					ReservationInformDTO reservationInformDTO = reservationInformDAO.getNoReservationCancle(reservation_number);
					String send_email =reservationInformDTO.getReservation_email()+"@"+reservationInformDTO.getReservation_email1();
					
					String charSet = "utf-8";
					String hostSMTP = "smtp.naver.com";
					String hostSMTPid = "kslhk8@naver.com";
					String hostSMTPpwd = "qja950206";
					
					String fromEmail = "kslhk8@naver.com";
					String fromName = "TowTour Company";
					String subject = "";
					String msg = "";
					
					subject = "TwoTour 예약취소 내역 입니다.";
					msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
					msg += "<h3>투투어 홈페이지에서 예약취소 내역을 보시려면 예약 번호가 필요합니다.</h3>";
					msg +="<h3>예약번호는"+reservationInformDTO.getReservation_number()+"입니다.</h3>";
					msg +="</div>";
					
					try {
						HtmlEmail htmlEmail = new HtmlEmail();
						htmlEmail.setDebug(true);
						htmlEmail.setCharset(charSet);
						htmlEmail.setHostName(hostSMTP);
						htmlEmail.setSmtpPort(587);

						htmlEmail.setAuthentication(hostSMTPid, hostSMTPpwd);
						htmlEmail.addTo(send_email, charSet);
						htmlEmail.setFrom(fromEmail, fromName, charSet);
						htmlEmail.setSubject(subject);
						htmlEmail.setHtmlMsg(msg);
						htmlEmail.send();
						mav.addObject("reservation_result","예약취소");
					} catch (Exception e) {
						System.out.println("메일발송 실패 : " + e);
					}
				}
				
				mav.setViewName("/main/index");
				mav.addObject("display","/template/end.jsp");
				mav.addObject("result","cancel");
				mav.addObject("menu", "/menu/whole_menu.jsp");
				return mav;
			}
			@RequestMapping(value="/packageTrip/noPayDelete.do")
			public ModelAndView noPayDelete(@RequestParam String pay_number,@RequestParam String package_code,@RequestParam String total_price) {
				ModelAndView mav= new ModelAndView();	
				 DecimalFormat df = new DecimalFormat("#,###");
				
				//결제취소
				payInformDAO.cancelPaymentComplete(pay_number);
				//패키지 reservation_member 인원 줄이기
				Map<String, Integer> map = new HashMap<String, Integer>();
				String reserved_total_member= travelerInformDAO.getReservedMember(pay_number);
				int son_seq = packageTripDAO.getSon_seq(package_code);
				map.put("reserved_total_member", Integer.parseInt(reserved_total_member));
				map.put("son_seq", son_seq);
				packageTripDAO.reduceReservedMember(map);
				PayInformDTO payInformDTO = payInformDAO.getPayCancel(pay_number);
				
				String send_email =payInformDTO.getPay_email()+"@"+payInformDTO.getPay_email1();
				
				String charSet = "utf-8";
				String hostSMTP = "smtp.naver.com";
				String hostSMTPid = "kslhk8@naver.com";
				String hostSMTPpwd = "qja950206";
				
				String fromEmail = "kslhk8@naver.com";
				String fromName = "TowTour Company";
				String subject = "";
				String msg = "";
				
				subject = "TwoTour 결제취소 내역입니다.";
				msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
				msg +="<h3>결제번호는"+payInformDTO.getPay_number()+"입니다.</h3>";
				msg += "<h3>투투어 홈페이지에서 결제취소 내역을 보시려면 예약 번호가 필요합니다.</h3>";
				msg += "<h3>"+df.format(payInformDTO.getTotal_price())+"원 환불 되었습니다.</h3>";
				msg +="</div>";
				
				try {
					HtmlEmail htmlEmail = new HtmlEmail();
					htmlEmail.setDebug(true);
					htmlEmail.setCharset(charSet);
					htmlEmail.setHostName(hostSMTP);
					htmlEmail.setSmtpPort(587);

					htmlEmail.setAuthentication(hostSMTPid, hostSMTPpwd);
					htmlEmail.addTo(send_email, charSet);
					htmlEmail.setFrom(fromEmail, fromName, charSet);
					htmlEmail.setSubject(subject);
					htmlEmail.setHtmlMsg(msg);
					htmlEmail.send();
				} catch (Exception e) {
					System.out.println("메일발송 실패 : " + e);
				}
				
				
				mav.setViewName("/main/index");
				mav.addObject("pay_result","pay_cancel");
				mav.addObject("total_price",total_price);
				mav.addObject("display","/template/end.jsp");
				mav.addObject("menu", "/menu/whole_menu.jsp");
				return mav;
			}
			//결제 취소
			@RequestMapping(value="/packageTrip/cancelPaymentComplete.do")
			public ModelAndView cancelPaymentComplete(@RequestParam String num, String reserved_total_member, String total_price, String id, int son_seq) {
				ModelAndView mav= new ModelAndView();	
				
				//payinform 테이블 결제취소 update
				payInformDAO.cancelPaymentComplete(num);
				
				//패키지 reservation_member 인원 줄이기
				Map<String, Integer> map = new HashMap<String, Integer>();
				map.put("reserved_total_member", Integer.parseInt(reserved_total_member));
				map.put("son_seq", son_seq);
				packageTripDAO.reduceReservedMember(map);

				//포인트 차감
				System.out.println(total_price);
				String point =  (int)(Integer.parseInt(total_price.trim())*0.01)+"";
				memberDAO.reducePoint(id, point);
				//System.out.println(5);
				
				mav.setViewName("/main/index");
				mav.addObject("result","pay_cancel");
				mav.addObject("total_price",total_price);
				mav.addObject("display","/template/end.jsp");
				mav.addObject("menu", "/menu/whole_menu.jsp");
				return mav;
			}
			
			//렌트카 결제취소
			@RequestMapping(value="/packageTrip/rentPayCancel.do")
			public ModelAndView rentPayCancel(@RequestParam String num,@RequestParam String total_price,@RequestParam int rent_code) {
				ModelAndView mav= new ModelAndView();	
				System.out.println(rent_code);
				//payinform 테이블 결제취소 update
				payInformDAO.cancelPaymentComplete(num);
				rentCarDAO.returnRentCar(rent_code);
				mav.setViewName("/main/index");
				mav.addObject("result","pay_cancel");
				mav.addObject("total_price",total_price);
				mav.addObject("display","/template/end.jsp");
				mav.addObject("menu", "/menu/whole_menu.jsp");
				return mav;
			}
			//항공 취소
			@RequestMapping(value="/packageTrip/airPayCancel.do")
			public ModelAndView airPayCancel(@RequestParam String num,@RequestParam String total_price) {
				ModelAndView mav= new ModelAndView();	
				payInformDAO.cancelPaymentComplete(num);
				mav.setViewName("/main/index");
				mav.addObject("result","pay_cancel");
				mav.addObject("total_price",total_price);
				mav.addObject("display","/template/end.jsp");
				mav.addObject("menu", "/menu/whole_menu.jsp");
				return mav;
			}
			//호텔 결제하기
		      @RequestMapping(value="/packageTrip/hotelPayComplete.do")
		      public ModelAndView hotelPayComplete(@RequestParam String hotel_url, String id, String room_value2, String hotel_name, 
		                                                         String total_price, String checkin, String checkout) {
		         ModelAndView mav= new ModelAndView();   
		         
		         
		         PayInformDTO payInformDTO = new PayInformDTO();
		         String price[] = total_price.split(",");
		         total_price="";
		            for(int i=0; i<price.length; i++) {
		               total_price+=price[i];
		            }
		            System.out.println(total_price);
		         
		         int hotel_price = Integer.parseInt(total_price);
		         
		         if(room_value2.equals("객실 1 - 성인 1")) {
		            payInformDTO.setTotal_price(hotel_price);
		         }else if(room_value2.equals("객실 1 - 성인 2(더블요청)")) {
		            payInformDTO.setTotal_price(hotel_price + 10000);
		         }else if(room_value2.equals("객실 1 - 성인 3")) {
		            payInformDTO.setTotal_price(hotel_price + 20000);
		         }
		         
		         System.out.println(hotel_price);
		         
		         payInformDTO.setPay_name(id);
		         payInformDTO.setHotel_name(hotel_name);
		         payInformDTO.setArrive_time(checkin);
		         payInformDTO.setDepart_time(checkout);
		         payInformDTO.setLocation(room_value2);
		         payInformDTO.setHotel_code(hotel_url);
		         payInformDTO.setStatus("결제완료");
		         
		         payInformDAO.insertHotelPayCompletel(payInformDTO);
		         
		         
		         mav.setViewName("/main/index");
		         mav.addObject("result","pay");
		         mav.addObject("total_price",payInformDTO.getTotal_price());
		         mav.addObject("display","/template/end.jsp");
		         mav.addObject("menu", "/menu/whole_menu.jsp");
		         return mav;
		      }
		      
		      
		      //호텔 결제확인 목록
		         @RequestMapping(value="/packageTrip/hotelPaymentList.do")
		         public ModelAndView hotelPaymentList(@RequestParam String id) {
		            ModelAndView mav= new ModelAndView();   
		            List<PayInformDTO> list = payInformDAO.getPayInformListHotel(id);
		            
		            mav.addObject("list", list);
		            mav.setViewName("jsonView");
		            return mav;
		         }
		         
		      //호텔 결제취소하기
		      @RequestMapping(value="/packageTrip/cancelHotelPayment.do")
		      public ModelAndView cancelHotelPayment(@RequestParam String pay_number,@RequestParam String total_price) {
		         ModelAndView mav= new ModelAndView();   
		         payInformDAO.cancelHotelPayment(pay_number);
		         
		         mav.setViewName("/main/index");
		         mav.addObject("display","/template/end.jsp");
		         mav.addObject("menu", "/menu/whole_menu.jsp");
		         mav.addObject("result","pay_cancel");
		         mav.addObject("total_price",total_price);
		         return mav;
		      }
		      
		      //호텔 결제취소 목록
		      @RequestMapping(value="/packageTrip/hotelPaymentCancelList.do")
		      public ModelAndView hotelPaymentCancelList(@RequestParam String id) {
		         ModelAndView mav= new ModelAndView();   
		         List<PayInformDTO> list = payInformDAO.getPayCancelListHotel(id);
		         
		         mav.addObject("list", list);
		         mav.setViewName("jsonView");
		         return mav;
		      }
		      
		      
		      


}