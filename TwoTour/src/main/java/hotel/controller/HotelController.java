package hotel.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import hotel.bean.HotelDTO;
import hotel.dao.HotelDAO;

@Component
@Controller
public class HotelController {
	@Autowired
	HotelDAO hotelDAO;

	
	@RequestMapping(value="/hotel/mainpage.do")
	public ModelAndView mainpage() {
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("/main/index");
		mav.addObject("display", "/hotel/mainpage.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		
		return mav;
	}
	
	
	@RequestMapping(value="/hotel/hotels.do")
	public ModelAndView hotels(@RequestParam Map<String, String> map){ 
		ModelAndView mav = new ModelAndView();
		String pg = (String) map.get("pg");
	
		int endNum=Integer.parseInt(pg)*4;
		int startNum= endNum-3;
		map.put("endNum", endNum+"");
		map.put("startNum", startNum+"");
		
		List<HotelDTO> list = hotelDAO.getHotel(map);
		
		//페이징처리
		int totalA = hotelDAO.getHotelTotalA(map);
		int pageSize = 3; //1페이지당 4개씩
		int totalP = (totalA + pageSize - 1) /pageSize; //총 페이지 수 
		
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("totalA", totalA);
		mav.addObject("totalP", totalP);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value="/hotel/searchRoom.do")
	public ModelAndView searchRoom(@RequestParam String hotel_name, String room_value){ 
		ModelAndView mav = new ModelAndView();
		
		HotelDTO hotelDTO = hotelDAO.getHotelInform(hotel_name);
		
		mav.addObject("hotelDTO", hotelDTO);
		mav.addObject("room_value", room_value);
		mav.setViewName("/main/index");
		mav.addObject("display", "/hotel/searchRoom.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		return mav;
	}
}



