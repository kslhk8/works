package administrator.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import administrator.dao.AdministratorDAO;

import hotel.bean.HotelDTO;
import payInform.bean.PayInformDTO;
import productFree.bean.AirplaneDTO;
import recentViewProduct.bean.RecentViewProductDTO;
import reservationInform.bean.ReservationInformDTO;
import trip.bean.TripDTO;

@Transactional
@RequestMapping("/administrator")
@Component
public class AdministratorController {
	@Autowired
	AdministratorDAO administratorDAO;
	
	//관리자메인
	@RequestMapping(value="/administratorPage.do", method=RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/main/index");
		mav.addObject("display", "/administrator/administratorPage.jsp");
		mav.addObject("contents", "/administrator/administratorBody.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		
		return mav;
	}
	
	
	
	//패키지등록
	@RequestMapping(value="/insertPackage.do", method=RequestMethod.GET)
	public ModelAndView insertPackage() {
		ModelAndView mav = new ModelAndView();	
		
		mav.setViewName("/main/index");
		mav.addObject("display", "/administrator/administratorPage.jsp");
		mav.addObject("contents", "/administrator/insertPackage.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		
		return mav;
	}
	
	@RequestMapping(value="/insertPackageSubmit.do")
	public ModelAndView insertPackageSubmit(@ModelAttribute TripDTO tripDTO, @RequestParam(required=false) MultipartFile[] image) {
		ModelAndView mav = new ModelAndView();	
		
		String[] imageName = new String[image.length];
		
		for(int i=0;i<image.length;i++) {
			imageName[i] = image[i].getOriginalFilename();
		}
		

		if(imageName.length==1) {
			tripDTO.setImageName(imageName[0]);
		}
		else if(imageName.length==2) {
			tripDTO.setImageName(imageName[0]);
			tripDTO.setImageName1(imageName[1]);
		}
		else if(imageName.length==3) {
			tripDTO.setImageName(imageName[0]);
			tripDTO.setImageName1(imageName[1]);
			tripDTO.setImageName2(imageName[2]);
		}
		
		administratorDAO.insertPackageSubmit(tripDTO);
		
		
		mav.setViewName("/main/index");
		mav.addObject("display", "/administrator/administratorPage.jsp");
		mav.addObject("contents", "/administrator/administratorInsertOk.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		
		return mav;
	}
	
	
	
	//상세패키지등록
	@RequestMapping(value="/insertPackageDetail.do", method=RequestMethod.GET)
	public ModelAndView insertPackageDetail() {
		ModelAndView mav = new ModelAndView();	
		
		List<TripDTO> list = administratorDAO.getPackageParent();
		
		mav.setViewName("/main/index");
		mav.addObject("display", "/administrator/administratorPage.jsp");
		mav.addObject("contents", "/administrator/insertPackageDetail.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value="/insertPackageDetailSubmit.do", method=RequestMethod.POST)
	public ModelAndView insertPackageDetailSubmit(@ModelAttribute TripDTO tripDTO) {
		ModelAndView mav = new ModelAndView();	
		
		System.out.println(tripDTO.getPseq());
		
		mav.setViewName("/main/index");
		mav.addObject("display", "/administrator/administratorPage.jsp");
		mav.addObject("contents", "/administrator/administratorInsertOk.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		
		administratorDAO.insertPackageDetailSubmit(tripDTO);
		
		return mav;
	}
	
	
	
	//항공등록
	@RequestMapping(value="/insertAirplane.do", method=RequestMethod.GET)
	public ModelAndView insertAirplane() {
		ModelAndView mav = new ModelAndView();	
		
		mav.setViewName("/main/index");
		mav.addObject("display", "/administrator/administratorPage.jsp");
		mav.addObject("contents", "/administrator/insertAirplane.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		
		return mav;
	}
	
	@RequestMapping(value="/insertAirplaneSubmit.do")
	public ModelAndView insertAirplaneSubmit(@ModelAttribute AirplaneDTO airplaneDTO, @RequestParam(required=false) MultipartFile image) {
		ModelAndView mav = new ModelAndView();	
		
		
		String imageName= image.getOriginalFilename();

		airplaneDTO.setImagename(imageName);
		airplaneDTO.setDepart_day("("+airplaneDTO.getDepart_day()+")");
		airplaneDTO.setArrive_day("("+airplaneDTO.getArrive_day()+")");

		
		administratorDAO.insertAirplaneSubmit(airplaneDTO);
		
		
		mav.setViewName("/main/index");
		mav.addObject("display", "/administrator/administratorPage.jsp");
		mav.addObject("contents", "/administrator/administratorInsertOk.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		
		return mav;
	}
	
	
	
	//호텔등록
	@RequestMapping(value="/insertHotel.do", method=RequestMethod.GET)
	public ModelAndView insertHotel() {
		ModelAndView mav = new ModelAndView();	
		
		List<TripDTO> list = administratorDAO.getPackageParent();
		
		mav.setViewName("/main/index");
		mav.addObject("display", "/administrator/administratorPage.jsp");
		mav.addObject("contents", "/administrator/insertHotel.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value="/insertHotelSubmit.do")
	public ModelAndView inserHotelSubmit(@ModelAttribute HotelDTO hotelDTO, @RequestParam(required=false) MultipartFile image) {
		ModelAndView mav = new ModelAndView();	
		
		
		String imageName= image.getOriginalFilename();

		hotelDTO.setImageName(imageName);
		
		administratorDAO.insertHotelSubmit(hotelDTO);
		
		
		mav.setViewName("/main/index");
		mav.addObject("display", "/administrator/administratorPage.jsp");
		mav.addObject("contents", "/administrator/administratorInsertOk.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		
		return mav;
	}
	
	
	
	
	//패키지관리
	@RequestMapping(value="/allPackageList.do", method=RequestMethod.GET)
	public ModelAndView allPackageList(@RequestParam(required=false) String data) {
		ModelAndView mav = new ModelAndView();	
		
		if(data==null) {
			data="all";
		}
		
		List<TripDTO> list = null;
		
		int year = Calendar.getInstance().get(Calendar.YEAR); 
		int month = Calendar.getInstance().get(Calendar.MONTH)+1;
		int date = Calendar.getInstance().get(Calendar.DAY_OF_MONTH);
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("year", year);
		map.put("month", month);
		map.put("date", date);
		
		
		
		if(data.equals("all")){
			list = administratorDAO.allPackageList();
		}
		else if(data.equals("past")){			
			list = administratorDAO.pastPackageList(map);
			
			//System.out.println("size:"+list.size());
		}
		else if(data.equals("not_past")){
			list = administratorDAO.notPastPackageList(map);
			//list = administratorDAO.notPastPackageList();
		}
		
		//System.out.println("가격:"+list.get(0).getAdult_price());
			
		mav.setViewName("/main/index");
		mav.addObject("display", "/administrator/administratorPage.jsp");
		mav.addObject("contents", "/administrator/allPackageList.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		mav.addObject("list", list);
		//mav.addObject("data",data);
		
		return mav;
	}
	
	
	
	
	//예약관리
	@RequestMapping(value="/reservationManagement.do", method=RequestMethod.GET)
	public ModelAndView reservationManagement() {
		ModelAndView mav = new ModelAndView();	
		
		List<ReservationInformDTO> list = administratorDAO.getReservationList();
		
		mav.setViewName("/main/index");
		mav.addObject("display", "/administrator/administratorPage.jsp");
		mav.addObject("contents", "/administrator/reservationManagement.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		mav.addObject("list", list);
		
		return mav;
	}
	
	//예약관리 삭제
	@RequestMapping(value="/reservationManagementSubmit.do", method=RequestMethod.POST)
	public ModelAndView reservationManagementSubmit(@RequestParam(required=false) String[] checkbox) {
		ModelAndView mav = new ModelAndView();	
		
		for(int i=0;i<checkbox.length;i++) {
			System.out.println(i+" : "+checkbox[i]);
			administratorDAO.deleteReservationProduct(checkbox[i]);
		}
		
		List<ReservationInformDTO> list = administratorDAO.getReservationList();
					
		mav.setViewName("/main/index");
		mav.addObject("display", "/administrator/administratorPage.jsp");
		mav.addObject("contents", "/administrator/reservationManagement.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		mav.addObject("list", list);
		
		return mav;
	}
	
	
	
	
	
	//결제관리
	@RequestMapping(value="/paymentManagement.do", method=RequestMethod.GET)
	public ModelAndView paymentManagement() {
		ModelAndView mav = new ModelAndView();	
		
		List<PayInformDTO> paymentList = administratorDAO.getPaymentList();
		List<PayInformDTO> wholeList = administratorDAO.getWholeList();
		List<PayInformDTO> cancelPaymentList = administratorDAO.getCancelPaymentList();
		
		mav.setViewName("/main/index");
		mav.addObject("display", "/administrator/administratorPage.jsp");
		mav.addObject("contents", "/administrator/paymentManagement.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		mav.addObject("paymentList", paymentList);
		mav.addObject("cancelPaymentList", cancelPaymentList);
		mav.addObject("wholeList", wholeList);
		
		return mav;
	}
	
	//최근본상품
	@RequestMapping(value="/recentViewProduct.do", method=RequestMethod.GET)
	public ModelAndView recentViewProduct() {
		ModelAndView mav = new ModelAndView();	
		
		List<RecentViewProductDTO> list = administratorDAO.getRecentViewProductList();
		
		//System.out.println(list.get(0).getAdult_price());
				
		mav.setViewName("/main/index");
		mav.addObject("display", "/administrator/administratorPage.jsp");
		mav.addObject("contents", "/administrator/recentViewProduct.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		mav.addObject("list", list);
		
		return mav;
	}
	
	//최근본상품 삭제
	@RequestMapping(value="/recentViewProductSubmit.do", method=RequestMethod.POST)
	public ModelAndView recentViewProductSubmit(@RequestParam(required=false) int[] checkbox) {
		ModelAndView mav = new ModelAndView();	
		
		for(int i=0;i<checkbox.length;i++) {
			System.out.println(i+" : "+checkbox[i]);
			administratorDAO.deleteRecentViewProduct(checkbox[i]);
		}
		
		List<RecentViewProductDTO> list = administratorDAO.getRecentViewProductList();
					
		mav.setViewName("/main/index");
		mav.addObject("display", "/administrator/administratorPage.jsp");
		mav.addObject("contents", "/administrator/recentViewProduct.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		mav.addObject("list", list);
		
		return mav;
	}
	
	
}
