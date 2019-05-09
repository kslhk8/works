package main.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import city.bean.CityDTO;
import city.dao.CityDAO;
import trip.bean.TripDTO;
import trip.dao.PackageTripDAO;

@Component
@Controller
public class MainController {
	@Autowired
	CityDAO cityDAO;
	@Autowired
	PackageTripDAO packageTripDAO;
	@Autowired
	TripDTO tripDTO;
	@RequestMapping(value="/main/index.do", method=RequestMethod.GET)
	public ModelAndView index(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		List<TripDTO> parentDTO_list = packageTripDAO.selectRecentProductViewed();
		
		session.setAttribute("parentDTO_list", parentDTO_list);
		mav.setViewName("/main/index");
		mav.addObject("display", "/template/body.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		
		return mav;
	}
	//해외패키지여행: 도착도시 검색
		@RequestMapping(value="/main/search.do")
		public ModelAndView overseaPackageArriveCitySearch(@RequestParam String arrive_city) {
			ModelAndView mav = new ModelAndView();
			
			List<CityDTO> list = cityDAO.overseaPackageArriveCitySearch(arrive_city);
			mav.setViewName("jsonView");
			mav.addObject("list", list);
			return mav;
	
	
		}
		
		//전체검색
		@RequestMapping(value="/search/detailSearch.do")
	      public String detailSearch(@RequestParam String arrive_city, @RequestParam String type) {      
	          System.out.println("type: "+type);
	          
	          String goDo = null;
	          
	          if(type.equals("패키지")) {
	             goDo =  "forward:/packageTrip/packageList.do";
	          }
	          if(type.equals("호텔")) {
	             goDo =  "forward:/hotel/mainpage.do";
	          }
	          if(type.equals("렌트카")) {
	             goDo =  "forward:/rentCar/rentCar2.do";
	          }
	          
	          
	          
	          return goDo;
	       }
}
