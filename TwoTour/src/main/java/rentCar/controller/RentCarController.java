package rentCar.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import payInform.bean.PayInformDTO;
import payInform.dao.PayInformDAO;
import rentCar.bean.RentCarDTO;
import rentCar.bean.RentCarPaging;
import rentCar.dao.RentCarDAO;
import reservationInform.bean.ReservationInformDTO;
import reservationInform.dao.ReservationInformDAO;
import travelerInform.bean.TravelerInformDTO;
import travelerInform.dao.TravelerInformDAO;

@Component
@Controller
public class RentCarController {
	@Autowired
	private RentCarDAO rentCarDAO;
	@Autowired
	ReservationInformDAO reservationInformDAO;
	@Autowired
	TravelerInformDAO travelerInformDAO;
	@Autowired
	PayInformDAO payInformDAO;
	@RequestMapping(value="/rentCar/rentCar1.do", method=RequestMethod.GET)
	public ModelAndView rentCar1() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/main/index");
		mav.addObject("display", "/rentCar/rentCar1.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		
		return mav;
	}
	@RequestMapping(value="/rentCar/rentCar2.do")
	public ModelAndView rentCar2(HttpServletRequest request,@RequestParam(required=false) String rentlocation ,@RequestParam(required=false) String arrive_city, @RequestParam(required=false) String returnlocation, @RequestParam(required=false) String rentTime,
			 @RequestParam(required=false) String returnTime, @RequestParam(required=false) String rentMinute, @RequestParam(required=false) String rentHour, @RequestParam(required=false) String returnMinute, @RequestParam(required=false) String returnHour) {
		
		String page = null;
	      
	      if(request.getParameter("pg")==null) {
	         page="1";
	      }
	      else {
	         page = request.getParameter("pg");
	      }
	      
	      if(arrive_city!=null) {
	         rentlocation = arrive_city;
	      }
	      
	      int pg = Integer.parseInt(page);   
		
		
		//int pg = Integer.parseInt(request.getParameter("pg"));	
		int endNum = pg*3;
		int startNum = endNum-2; 
		
		List<RentCarDTO> list = rentCarDAO.rentCarList(startNum,endNum,rentlocation);
		int totalA =rentCarDAO.getTotalA(rentlocation);
		int eurocarTotal =rentCarDAO.eurocarTotal(rentlocation);
		int herlzTotal =rentCarDAO.herlzTotal(rentlocation);
		int mediumTotal =rentCarDAO.mediumTotal(rentlocation);
		int smallTotal =rentCarDAO.smallTotal(rentlocation);
		int autoTotal =rentCarDAO.autoTotal(rentlocation);
		int manualTotal =rentCarDAO.manualTotal(rentlocation);
		int fiveTotal =rentCarDAO.fiveTotal(rentlocation);
		int fourTotal =rentCarDAO.fourTotal(rentlocation);
		
		RentCarPaging rentCarPaging =new RentCarPaging();
		rentCarPaging.setCurrentPage(pg);
		rentCarPaging.setPageBlock(3);
		rentCarPaging.setPageSize(10);
		rentCarPaging.setTotalA(totalA);
		rentCarPaging.makePagingHTML();
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("rentlocation", rentlocation);
		mav.addObject("returnlocation", returnlocation);
		mav.addObject("rentTime", rentTime);
		mav.addObject("returnTime", returnTime);
		mav.addObject("rentMinute", rentMinute);
		mav.addObject("rentHour", rentHour);
		mav.addObject("returnMinute", returnMinute);
		mav.addObject("returnHour", returnHour);
		
		mav.addObject("eurocarTotal", eurocarTotal);
		mav.addObject("herlzTotal", herlzTotal);
		mav.addObject("mediumTotal", mediumTotal);
		mav.addObject("smallTotal", smallTotal);
		mav.addObject("autoTotal", autoTotal);
		mav.addObject("manualTotal", manualTotal);
		mav.addObject("fiveTotal", fiveTotal);
		mav.addObject("fourTotal", fourTotal);
		
		mav.addObject("list", list);
		
		mav.addObject("rentCarPaging", rentCarPaging);
		mav.addObject("pg", pg);
		mav.addObject("totalA", totalA);
		
		mav.setViewName("/main/index");
		mav.addObject("display", "/rentCar/rentCar2.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		
		return mav;
	}
	
		
	@RequestMapping(value="/rentCar/rentCar3.do", method=RequestMethod.GET)
	public ModelAndView rentCar3(@RequestParam int seq,@RequestParam String rentlocation , @RequestParam String returnlocation, @RequestParam String rentTime,
			 @RequestParam String returnTime, @RequestParam String rentMinute, @RequestParam String rentHour, @RequestParam String returnMinute, @RequestParam String returnHour
			 ,@RequestParam String no_member) {
		ModelAndView mav = new ModelAndView();
		System.out.println(no_member+","+seq);
		
		
		RentCarDTO rentCarDTO = rentCarDAO.rentCarReservation(seq);
		int cost= (rentCarDTO.getPrice()*10)/11;

		int tax= rentCarDTO.getPrice()-((rentCarDTO.getPrice()*10)/11);

		mav.addObject("cost", cost);

		mav.addObject("tax", tax);
		mav.addObject("rentlocation", rentlocation);
		mav.addObject("returnlocation", returnlocation);
		mav.addObject("rentTime", rentTime);
		mav.addObject("returnTime", returnTime);
		mav.addObject("rentMinute", rentMinute);
		mav.addObject("rentHour", rentHour);
		mav.addObject("returnMinute", returnMinute);
		mav.addObject("returnHour", returnHour);
		mav.addObject("seq", seq);
		mav.addObject("rentCarDTO", rentCarDTO);
		mav.addObject("no_member",no_member);
		
		mav.setViewName("/main/index");
		mav.addObject("display", "/rentCar/rentCar3.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		
		return mav;
	}
	@RequestMapping(value="/rentCar/rentCar4.do", method=RequestMethod.POST)
	public ModelAndView rentCar4(HttpSession session,@ModelAttribute PayInformDTO payInformDTO,@RequestParam int seq,@RequestParam String car_name) {
		System.out.println(seq);
		ModelAndView mav = new ModelAndView();
	
		
		payInformDTO.setPay_name((String) session.getAttribute("memId"));
		payInformDTO.setStatus("예약완료");
		payInformDTO.setRentcar_code(seq+"");
		payInformDTO.setAirplane_code("");
		payInformDTO.setAirplane_name("");
		payInformDTO.setArrive_time("");
		payInformDTO.setDepart_time("");
		payInformDTO.setHotel_code("");
		payInformDTO.setHotel_name("");
		payInformDTO.setLocation("");
		payInformDTO.setPackage_code("");
		payInformDTO.setPackage_name(car_name);
		payInformDTO.setTotal_member(1);
		System.out.println("1");
		payInformDAO.insertPayInform(payInformDTO);
		System.out.println("2");
		rentCarDAO.updateRentCar(seq);
		mav.addObject("total_price",payInformDTO.getTotal_price());
		mav.addObject("result","pay");
		mav.setViewName("/main/index");
		mav.addObject("display", "/rentCar/rentCar4.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		
		return mav;
	}
	@RequestMapping(value="/rentCar/rentCarRadioChecked.do", method=RequestMethod.POST)
	public ModelAndView rentCarRadioChecked(HttpServletRequest request,
			@RequestParam String rentlocation,@RequestParam String eurocar,@RequestParam String herlz,@RequestParam String small
			,@RequestParam String medium,@RequestParam String auto,@RequestParam String manual,@RequestParam String five,@RequestParam String four) {
		ModelAndView mav = new ModelAndView();
		int pg = Integer.parseInt(request.getParameter("pg"));

		Map<String,String> map = new HashMap<String,String>();
		map.put("rentlocation", rentlocation);
		map.put("eurocar",eurocar );
		map.put("herlz",herlz );
		map.put("small",small );
		map.put("medium",medium );
		map.put("auto", auto);
		map.put("manual", manual);
		map.put("five",five );
		map.put("four",four );
		
		List<RentCarDTO> list = rentCarDAO.rentCarRadioChecked(map);
		mav.addObject("list", list);
		mav.setViewName("jsonView");
				
		return mav;
	}
	@RequestMapping(value="/rentCar/rentCarRadioTotal.do", method=RequestMethod.POST)
	public ModelAndView rentCarRadioTotal(HttpServletRequest request,
			@RequestParam String rentlocation) {
		ModelAndView mav = new ModelAndView();
		
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		List<RentCarDTO> list = rentCarDAO.rentCarRadioTotal(rentlocation);
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
}
