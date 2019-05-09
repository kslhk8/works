package productFree.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import productFree.bean.AirplaneDTO;
import productFree.dao.ProductFreeDAO;

@Component
@RequestMapping("/productFree")
public class ProductFreeController {

	private HashMap<Integer, List<AirplaneDTO>> combiMap1;
	@Autowired
	private ProductFreeDAO productFreeDAO;
	@Autowired
	PayInformDAO payInformDAO;
	

	@RequestMapping(value="/freeResult", method=RequestMethod.POST)
	public ModelAndView freeResult(@RequestParam Map<String, Object> map) {

		String[] tempDate = map.get("depart_date").toString().split("-");
		tempDate[1] = "0" + tempDate[1];
		map.replace("depart_date", tempDate[0]+tempDate[1]+tempDate[2]);
		tempDate = map.get("return_date").toString().split("-");
		tempDate[1] = "0" + tempDate[1];
		map.replace("return_date", tempDate[0]+tempDate[1]+tempDate[2]);

		String tripType = null;
		if(!map.containsKey("tripType")) {
			tripType="편도";
			map.replace("tripType", tripType);
		}else{
			tripType = map.get("tripType").toString();
		}

		List<AirplaneDTO> airplaneList = null;

		ModelAndView mav = new ModelAndView();
		if(tripType.equals("편도")) {
				airplaneList = productFreeDAO.getAirplaneScheduleUni(map);
		}else if(tripType.equals("왕복")) {
			airplaneList = productFreeDAO.getAirplaneScheduleReTurn(map);
			CombinationPrice cp = new CombinationPrice(airplaneList);
			combiMap1 = cp.makeSeq();
			mav.addObject("combiMap1", combiMap1);
		}

		mav.setViewName("/main/index");
		//mav.addObject("display", "/productFree/listtest.jsp");
		mav.addObject("display", "/productFree/freeResult.jsp");
		mav.addObject("firstMap", map);
		mav.addObject("menu", "/menu/whole_menu.jsp");
		mav.addObject("airplaneList", airplaneList);

		return mav;
	}	

	@RequestMapping(value="showPre_AirTicketInform", method=RequestMethod.POST)
	public ModelAndView showPre_airTicketInform(@RequestParam Map<String, Object> map){
		System.out.println("show:"+map);
		//show편도:{airplane_code=7C1382, depart_city=인천ICN
		//, depart_date=20180114, depart_time=12:05, arrive_city=삿포로CTS}
		//show:{airplane_code=KE0765, depart_city=인천ICN, depart_date=20180114
		//, depart_time=10:05, arrive_city=삿포로CTS, airplane_code1=KE0796
		//, depart_city1=삿포로CTS, depart_date1=20180117, depart_time1=08:40, arrive_city1=인천ICN}
		AirplaneDTO airplaneDTO = productFreeDAO.getOneAirplaneSchedule(map);
		ModelAndView mav = new ModelAndView();
		
		if(map.get("airplane_code1")!=null) {
			Map<String, Object> mapRT = new HashMap<String, Object>();
			mapRT.put("airplane_code", map.get("airplane_code1"));
			mapRT.put("depart_city", map.get("depart_city1"));
			mapRT.put("depart_date", map.get("depart_date1"));
			mapRT.put("depart_time", map.get("depart_time1"));
			mapRT.put("arrive_city", map.get("arrive_city1"));
			AirplaneDTO airplaneDTO_RT = productFreeDAO.getOneAirplaneSchedule(mapRT);
			mav.addObject("airplaneDTO_RT", airplaneDTO_RT);
		}
		
		

		mav.setViewName("/main/index");
		mav.addObject("display", "/productFree/preAirInform.jsp");
		mav.addObject("airplaneDTO",airplaneDTO);
		mav.addObject("menu", "/menu/whole_menu.jsp");

		return mav;
	}

	@RequestMapping(value="buyItNow", method=RequestMethod.POST)
	public ModelAndView buyItNow(HttpSession session, @RequestParam Map<String, Object> map){
		System.out.println("buy:"+map);
		//buy:{airplane_code=KE0765, depart_city=인천ICN, depart_date=20180114
		//, depart_time=10:05, arrive_city=삿포로CTS
		//, airplane_code1=, depart_city1=, depart_date1=, depart_time1=, arrive_city1=}

		ModelAndView mav = new ModelAndView();
		if(map.get("airplane_code1")==null){
		AirplaneDTO airplaneDTO = productFreeDAO.getOneAirplaneSchedule(map);
		PayInformDTO payInformDTO = new PayInformDTO();
		payInformDTO.setPay_name((String) session.getAttribute("memId"));
		payInformDTO.setAirplane_code(airplaneDTO.getAirplane_code());
		payInformDTO.setAirplane_name(airplaneDTO.getAirplane_name());
		String depart=airplaneDTO.getDepart_date()+" "+airplaneDTO.getDepart_day()+" "+airplaneDTO.getDepart_time();
		String arrive = airplaneDTO.getArrive_date()+" "+airplaneDTO.getArrive_day()+" "+airplaneDTO.getArrive_time();
		payInformDTO.setDepart_time(depart);
		payInformDTO.setArrive_time("");
		System.out.println(payInformDTO.getArrive_time());
		payInformDTO.setHotel_code("");
		payInformDTO.setHotel_name("");
		payInformDTO.setLocation("");
		payInformDTO.setPackage_code("");
		payInformDTO.setPackage_name("");
		payInformDTO.setPay_email("");
		payInformDTO.setPay_email1("");
		payInformDTO.setRentcar_code("");
		payInformDTO.setTotal_member(1);
		payInformDTO.setStatus("결제완료");
		payInformDTO.setTotal_price(airplaneDTO.getAdult_cost());
		payInformDAO.insertPayInform(payInformDTO);
		mav.addObject("total_price",airplaneDTO.getAdult_cost());
		}
		else {
			Map<String, Object> mapRT = new HashMap<String, Object>();
			mapRT.put("airplane_code", map.get("airplane_code1"));
			mapRT.put("depart_city", map.get("depart_city1"));
			mapRT.put("depart_date", map.get("depart_date1"));
			mapRT.put("depart_time", map.get("depart_time1"));
			mapRT.put("arrive_city", map.get("arrive_city1"));
			AirplaneDTO airplaneDTO_RT = productFreeDAO.getOneAirplaneSchedule(mapRT);
			System.out.println(airplaneDTO_RT.getDepart_date());
			AirplaneDTO airplaneDTO = productFreeDAO.getOneAirplaneSchedule(map);

			PayInformDTO payInformDTO = new PayInformDTO();
			payInformDTO.setPay_name((String) session.getAttribute("memId"));
			payInformDTO.setAirplane_code(airplaneDTO_RT.getAirplane_code());
			payInformDTO.setAirplane_name(airplaneDTO_RT.getAirplane_name());
			String depart=airplaneDTO.getDepart_date()+" "+airplaneDTO.getDepart_day()+" "+airplaneDTO.getDepart_time();
			String arrive = airplaneDTO_RT.getArrive_date()+" "+airplaneDTO_RT.getArrive_day()+" "+airplaneDTO_RT.getArrive_time();
			payInformDTO.setDepart_time(depart);
			payInformDTO.setArrive_time(arrive);
			payInformDTO.setStatus("결제완료");
			payInformDTO.setHotel_code("");
			payInformDTO.setHotel_name("");
			payInformDTO.setLocation("");
			payInformDTO.setPackage_code("");
			payInformDTO.setPackage_name("");
			payInformDTO.setPay_email("");
			payInformDTO.setPay_email1("");
			payInformDTO.setRentcar_code("");
			payInformDTO.setTotal_member(1);
			payInformDTO.setTotal_price(airplaneDTO_RT.getAdult_cost());
			payInformDAO.insertPayInform(payInformDTO);
			System.out.println(airplaneDTO_RT);
			mav.addObject("total_price",airplaneDTO_RT.getAdult_cost());
		}
		mav.setViewName("/main/index");
		mav.addObject("display", "/template/end.jsp");
		mav.addObject("result","pay");
		mav.addObject("menu", "/menu/whole_menu.jsp");

		return mav;	
	}


	@RequestMapping(value="test_freeResult", method=RequestMethod.POST)
	public ModelAndView test_freeResult(@RequestParam Map<String, Object> map){
		System.out.println("test"+map);
		/*String hardCell = null;
		if(map.get("hidden_air_code")!=null) {
			hardCell = (String) map.get("hidden_air_code");
			map.replace("airplane_code", hardCell);
		}*/
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");	
		if(map.get("tripType").equals("편도")) {
			List<AirplaneDTO> airplaneList = productFreeDAO.getAirplaneScheduleUni(map);
			List<AirplaneDTO> hiddenList = new ArrayList<AirplaneDTO>();
			for(int i=1; i<airplaneList.size(); i++) {
				AirplaneDTO tempAir1 = airplaneList.get(i);			
				for(int j=0; j<i; j++) {
					Integer tempCost2 = airplaneList.get(j).getAdult_cost();
					if(tempCost2.intValue()==tempAir1.getAdult_cost()) {
						hiddenList.add(tempAir1);
					}
				}
			}
			System.out.println(hiddenList);
			mav.addObject("hiddenList", hiddenList);
		}else if(map.get("tripType").equals("왕복")) {
			/*for(Map.Entry<Integer, List<AirplaneDTO>> e : combiMap1.entrySet()) {
				System.out.println(e.getKey() + " : " + e.getValue());
			}*/
			List<AirplaneDTO> rtList = null;
			HashMap<Integer, List<AirplaneDTO>> rtMap = new HashMap<Integer, List<AirplaneDTO>>();
			for(Map.Entry<Integer, List<AirplaneDTO>> e : combiMap1.entrySet()) {
				if(e.getValue().size()>2) {
					rtList = new ArrayList<AirplaneDTO>();
					for(int i=2; i<e.getValue().size(); i++) {
						rtList.add(e.getValue().get(i));
					}
					rtMap.put(e.getKey(),rtList);
				}
			}
			mav.addObject("rtMap", rtMap);
		}
		
		return mav;	
	}
}


