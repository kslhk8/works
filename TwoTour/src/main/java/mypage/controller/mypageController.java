package mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import basketInform.bean.BasketInformDTO;
import basketInform.dao.BasketInformDAO;
import member.bean.MemberDTO;
import member.dao.MemberDAO;
import payInform.bean.PayInformDTO;
import payInform.dao.PayInformDAO;
import reservationInform.bean.ReservationInformDTO;
import reservationInform.dao.ReservationInformDAO;

@Component
@Controller
public class mypageController {
	@Autowired MemberDAO memberDAO;
	@Autowired MemberDTO memberDTO;
	@Autowired
	BasketInformDAO basketInformDAO;
	@Autowired
	ReservationInformDAO reservationInformDAO;
	@Autowired
	PayInformDAO payInformDAO;
	@RequestMapping(value="/mypage/mypage.do", method=RequestMethod.GET)
	public ModelAndView index(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		//아이디가 세션에 없으면 로그인페이지로 이동
		if(session.getAttribute("memId")==null) {
			mav.addObject("display", "/member/loginForm.jsp");
		}else {
			mav.addObject("contents", "/mypage/content01_reservation.jsp");
			mav.addObject("display", "/mypage/mypage.jsp");
		}
		
		
		mav.setViewName("/main/index");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		
		return mav;
	}
	
	@RequestMapping(value="/mypage/commingsoon.do", method=RequestMethod.GET)
	public ModelAndView checkBenefit() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/main/index");
		mav.addObject("display", "/mypage/mypage.jsp");
		mav.addObject("contents", "/mypage/commingsoon.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		
		return mav;
	}
	
	//장바구니
	@RequestMapping(value="/mypage/basket.do", method=RequestMethod.GET)
	public ModelAndView basket(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		String id= (String) session.getAttribute("memId");
		mav.setViewName("/main/index");
		mav.addObject("display", "/mypage/mypage.jsp");
		mav.addObject("contents", "/mypage/content03_basket.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		
		return mav;
	}
	@RequestMapping(value="/mypage/basketList.do", method=RequestMethod.POST)
	public ModelAndView basketList(@RequestParam String id) {
		ModelAndView mav = new ModelAndView();
		List<BasketInformDTO> basketInformList= basketInformDAO.getBasketInformList(id);
		System.out.println(basketInformList.size());
		mav.setViewName("jsonView");
		mav.addObject("basketInformList",basketInformList);
		return mav;
	}
	//장바구니 삭제
			@RequestMapping(value="/mypage/deleteBasketList.do", method=RequestMethod.POST)
			public ModelAndView deleteBasketList(@RequestParam int basket_seq) {
				ModelAndView mav = new ModelAndView();
				basketInformDAO.deleteBasketList(basket_seq);
				return mav;
			}
	

	//나의 정보관리 처음 누를 때  
	@RequestMapping(value="/mypage/checkpwd.do")
	public ModelAndView checkpwd() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/main/index");
		mav.addObject("display", "/mypage/mypage.jsp");
		mav.addObject("contents", "/mypage/checkpwd.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		
		return mav;
	}
	
	//비밀번호 재확인
	@ResponseBody
	@RequestMapping(value="/mypage/checkidandpwd.do")
	public String checkidandpwd(@RequestParam String id, String pwd) {
		
		memberDTO = memberDAO.checkLogin(id, pwd);
		
		if(memberDTO==null) {
			return "incorrect";
		
		}else {
			return "correct";
		}
	}
	
	//기본정보 변경
	@RequestMapping(value="/mypage/changeinfo.do")
	public ModelAndView changeinfo() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/main/index");
		mav.addObject("display", "/mypage/mypage.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		mav.addObject("contents", "/mypage/content05_changeinfo.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		
		mav.addObject("memberDTO", memberDTO);
		return mav;
	}
	
	
	
	//기본정보 변경 저장하기
	   @RequestMapping(value="/mypage/changeinfosave.do")
	   public ModelAndView changeinfosave(@RequestParam String id, String email, String pwd) {
	      ModelAndView mav = new ModelAndView();
	      
	      String[] emailArr = email.split("@");
	      email = emailArr[0];
	      String email1 = emailArr[1];
	      
	      Map<String, String> map = new HashMap<>();
	      map.put("id", id);
	      map.put("email", email);
	      map.put("email1", email1);
	      
	      if(pwd!="") {
	         map.put("pwd", pwd);
	      }
	      System.out.println("id="+id);
	      System.out.println("email="+email);
	      System.out.println("email1="+email1);
	      System.out.println("pwd="+pwd);
	      
	      	
	       memberDAO.updateBasicInfo(map);
	      
	      memberDTO.setEmail(email);
	      memberDTO.setEmail1(email1);
	     mav.setViewName("jsonView");
	     mav.addObject("memberDTO",memberDTO);
	         
	      return mav;
	   }
	
	//회원탈퇴
		@RequestMapping(value="/mypage/memberleave.do", method=RequestMethod.POST)
		public ModelAndView passport() {
			
			ModelAndView mav = new ModelAndView();
			
			mav.setViewName("/main/index");
			mav.addObject("display", "/mypage/mypage.jsp");
			mav.addObject("contents", "/mypage/content07_memberleave.jsp");
			mav.addObject("menu", "/menu/whole_menu.jsp");
			
			return mav;
		}
		//회원탈퇴
		@RequestMapping(value="/mypage/deleteMember.do")
		public void deleteMember(@RequestParam String id, HttpSession session) {
			memberDAO.deleteMember(id);
			System.out.println(id);
			session.invalidate();
		}
		
		
		//예약확인 -예약자 정보 가져오기
		@RequestMapping(value="/mypage/reservationList.do", method=RequestMethod.POST)
		public ModelAndView reservationList(@RequestParam String id) {
			ModelAndView mav = new ModelAndView();
			List<ReservationInformDTO> reservationInformList = reservationInformDAO.getReservationInformList(id);
			
			for(ReservationInformDTO dto : reservationInformList) {
				dto.setLogtime(dto.getLogtime().substring(0, 10));
				dto.setDepart_time(dto.getDepart_time().substring(0, 8));
				dto.setArrive_time(dto.getArrive_time().substring(0, 8));
				
				if(dto.getAirplane_code()==null) dto.setAirplane_code("");
				if(dto.getAirplane_name()==null) dto.setAirplane_name("");
				if(dto.getPackage_code()==null) dto.setPackage_code("");
				if(dto.getPackage_name()==null) dto.setPackage_name("");
				if(dto.getHotel_code()==null) dto.setHotel_code("");
				if(dto.getHotel_name()==null) dto.setHotel_name("");
			} 
			
			mav.addObject("reservationInformList",reservationInformList);
			mav.setViewName("jsonView");
			return mav;
			
		}
		
		@RequestMapping(value="/mypage/noReservationList.do", method=RequestMethod.POST)
		public ModelAndView noReservationList(@RequestParam(required=false) String reservation_number) {
			System.out.println(reservation_number);
			ModelAndView mav = new ModelAndView();
			if(!reservation_number.equals("")) {
			ReservationInformDTO reservationInformDTO = reservationInformDAO.getReservationByNumber(reservation_number);
			if(reservationInformDTO!=null) {
				System.out.println(reservationInformDTO+"hi");
				reservationInformDTO.setLogtime(reservationInformDTO.getLogtime().substring(0, 10));
				reservationInformDTO.setDepart_time(reservationInformDTO.getDepart_time().substring(0, 8));
				reservationInformDTO.setArrive_time(reservationInformDTO.getArrive_time().substring(0, 8));
				mav.addObject("reservationInformDTO",reservationInformDTO);
				}
			}
			mav.setViewName("jsonView");
			return mav;
			
		}
		//예약확인 -예약취소자 정보 가져오기
				@RequestMapping(value="/mypage/reservationCancleList.do", method=RequestMethod.POST)
				public ModelAndView reservationCancleList(@RequestParam String id) {
					ModelAndView mav = new ModelAndView();
					List<ReservationInformDTO> reservationCancelList = reservationInformDAO.getReservationCancelList(id);
					
					for(ReservationInformDTO dto : reservationCancelList) {
						dto.setLogtime(dto.getLogtime().substring(0, 10));
						dto.setDepart_time(dto.getDepart_time().substring(0, 8));
						dto.setArrive_time(dto.getArrive_time().substring(0, 8));
						if(dto.getAirplane_code()==null) dto.setAirplane_code("");
						if(dto.getAirplane_name()==null) dto.setAirplane_name("");
						if(dto.getPackage_code()==null) dto.setPackage_code("");
						if(dto.getPackage_name()==null) dto.setPackage_name("");
						if(dto.getHotel_code()==null) dto.setHotel_code("");
						if(dto.getHotel_name()==null) dto.setHotel_name("");
					}
					
					mav.addObject("reservationCancelList",reservationCancelList);
					mav.setViewName("jsonView");
					return mav;
					
				}
			
		
		
		//예약확인 -예약취소자 정보 가져오기
			@RequestMapping(value="/mypage/noReservationCancle.do", method=RequestMethod.POST)
			public ModelAndView noReservationCancle(@RequestParam(required=false) String reservation_number) {
				ModelAndView mav = new ModelAndView();
				if(!reservation_number.equals("")) {
					ReservationInformDTO reservationInformDTO= reservationInformDAO.getNoReservationCancle(reservation_number);
					if(reservationInformDTO!=null) {
						reservationInformDTO.setLogtime(reservationInformDTO.getLogtime().substring(0, 10));
						reservationInformDTO.setDepart_time(reservationInformDTO.getDepart_time().substring(0, 8));
						reservationInformDTO.setArrive_time(reservationInformDTO.getArrive_time().substring(0, 8));
						mav.addObject("reservationInformDTO",reservationInformDTO);
					}
				}
				mav.setViewName("jsonView");
				return mav;
				
			}
			//예약확인 - 결제자 정보 가져오기
			@RequestMapping(value="/mypage/payInformList.do", method=RequestMethod.POST)
			public ModelAndView payInformList(@RequestParam String id) {
				ModelAndView mav = new ModelAndView();
				List<PayInformDTO> payInformList = payInformDAO.getPayInformList(id);
				
				for(PayInformDTO dto : payInformList) {
					dto.setLogtime(dto.getLogtime().substring(0, 10));
					dto.setDepart_time(dto.getDepart_time().substring(0, 8));
					dto.setArrive_time(dto.getArrive_time().substring(0, 8));
					
					if(dto.getAirplane_code()==null) dto.setAirplane_code("");
					if(dto.getAirplane_name()==null) dto.setAirplane_name("");
					if(dto.getPackage_code()==null) dto.setPackage_code("");
					if(dto.getPackage_name()==null) dto.setPackage_name("");
					if(dto.getHotel_code()==null) dto.setHotel_code("");
					if(dto.getHotel_name()==null) dto.setHotel_name("");
				}
				mav.addObject("payInformList",payInformList);
				mav.setViewName("jsonView");
				return mav;
				
			}
			
			@RequestMapping(value="/mypage/noPayInform.do", method=RequestMethod.POST)
			public ModelAndView noPayInform(@RequestParam(required=false) String pay_number) {
				ModelAndView mav = new ModelAndView();
				
				
				if(!pay_number.equals("")) {
					PayInformDTO payInformDTO= payInformDAO.getPayByNumber(pay_number);
					if(payInformDTO!=null) {
						payInformDTO.setLogtime(payInformDTO.getLogtime().substring(0, 10));
						payInformDTO.setDepart_time(payInformDTO.getDepart_time().substring(0, 8));
						payInformDTO.setArrive_time(payInformDTO.getArrive_time().substring(0, 8));
						mav.addObject("payInformDTO",payInformDTO);
					}
				}
				
			
				mav.setViewName("jsonView");
				return mav;
				
			}
			
			//예약확인 - 결제자 정보 가져오기
			@RequestMapping(value="/mypage/payCancelList.do", method=RequestMethod.POST)
			public ModelAndView payCancelList(@RequestParam String id) {
				ModelAndView mav = new ModelAndView();
				List<PayInformDTO> payCancelList = payInformDAO.getPayCancelList(id);
				
				for(PayInformDTO dto : payCancelList) {
					dto.setLogtime(dto.getLogtime().substring(0, 10));
					dto.setDepart_time(dto.getDepart_time().substring(0, 8));
					dto.setArrive_time(dto.getArrive_time().substring(0, 8));
					
					if(dto.getAirplane_code()==null) dto.setAirplane_code("");
					if(dto.getAirplane_name()==null) dto.setAirplane_name("");
					if(dto.getPackage_code()==null) dto.setPackage_code("");
					if(dto.getPackage_name()==null) dto.setPackage_name("");
					if(dto.getHotel_code()==null) dto.setHotel_code("");
					if(dto.getHotel_name()==null) dto.setHotel_name("");
				}
				
				mav.addObject("payCancelList",payCancelList);
				mav.setViewName("jsonView");
				return mav;
				
			}
					//예약확인 - 결제자 정보 가져오기
					@RequestMapping(value="/mypage/noPayCancel.do", method=RequestMethod.POST)
					public ModelAndView noPayCancelList(@RequestParam(required=false) String pay_number) {
						ModelAndView mav = new ModelAndView();
						if(!pay_number.equals("")) {
							PayInformDTO payInformDTO = payInformDAO.getPayCancel(pay_number);
							if(payInformDTO!=null) {
								payInformDTO.setLogtime(payInformDTO.getLogtime().substring(0, 10));
								payInformDTO.setDepart_time(payInformDTO.getDepart_time().substring(0, 8));
								payInformDTO.setArrive_time(payInformDTO.getArrive_time().substring(0, 8));
								mav.addObject("payInformDTO",payInformDTO);
							}
						}
						mav.setViewName("jsonView");
						return mav;
						
					}
					
		
					@RequestMapping(value="/mypage/no_memberInform.do", method=RequestMethod.POST)
					public ModelAndView no_memberInform(@RequestParam String name,@RequestParam String reservation_number,@RequestParam String email) {
						ModelAndView mav = new ModelAndView();
						String emails[] =email.split("@");
						Map<String,String> map = new HashMap<String,String>();
						map.put("reservation_name", name);
						map.put("reservation_number", reservation_number);
						map.put("reservation_email", emails[0]);
						map.put("reservation_email1", emails[1]);
						ReservationInformDTO reservationInformDTO = reservationInformDAO.getNoResevationInform(map);
						PayInformDTO payInformDTO = payInformDAO.getNoPayInform(map);
						mav.addObject("payInformDTO",payInformDTO);
						mav.addObject("reservationInformDTO",reservationInformDTO);
						mav.addObject("display", "/mypage/no_content01_reservation.jsp");
						mav.setViewName("/main/index");
						mav.addObject("menu", "/menu/whole_menu.jsp");
						
						return mav;
					}
					
					//포인트 내역조회
					@RequestMapping(value="/mypage/searchPoint.do")
					public ModelAndView searchPoint() {
						ModelAndView mav = new ModelAndView();
						
						mav.setViewName("/main/index");
						mav.addObject("display", "/mypage/mypage.jsp");
						mav.addObject("contents", "/mypage/content02_mileage.jsp");
						mav.addObject("menu", "/menu/whole_menu.jsp");
						
						return mav;
						
					}
					//렌트카
					@RequestMapping(value="/mypage/rentPayInformList.do", method=RequestMethod.POST)
					public ModelAndView rentPayInformList(@RequestParam String id) {
						ModelAndView mav = new ModelAndView();
						List<PayInformDTO> rentPayInformList = payInformDAO.getRentPayInformList(id);
						
						for(PayInformDTO dto : rentPayInformList) {
							dto.setLogtime(dto.getLogtime().substring(0, 10));
						}
						mav.addObject("rentPayInformList",rentPayInformList);
						mav.setViewName("jsonView");
						return mav;
						
					}
					//렌트카 결제취소내역
					@RequestMapping(value="/mypage/rentPayCancelList.do", method=RequestMethod.POST)
					public ModelAndView rentPayCancelList(@RequestParam String id) {
						ModelAndView mav = new ModelAndView();
						List<PayInformDTO> rentPayCancelList = payInformDAO.getRentPayCancelList(id);
						
						for(PayInformDTO dto : rentPayCancelList) {
							dto.setLogtime(dto.getLogtime().substring(0, 10));
						}
						mav.addObject("rentPayCancelList",rentPayCancelList);
						mav.setViewName("jsonView");
						return mav;
						
					}
					
					//항공
					@RequestMapping(value="/mypage/airPayInformList.do", method=RequestMethod.POST)
					public ModelAndView airPayInformList(@RequestParam String id) {
						ModelAndView mav = new ModelAndView();
						List<PayInformDTO> airPayInformList = payInformDAO.getAirPayInformList(id);
						
						for(PayInformDTO dto : airPayInformList) {
							if(dto.getArrive_time()==null) {dto.setArrive_time("");}
							dto.setLogtime(dto.getLogtime().substring(0, 10));
						}
						mav.addObject("airPayInformList",airPayInformList);
						mav.setViewName("jsonView");
						return mav;
						
					}
					
					@RequestMapping(value="/mypage/airPayCancelList.do", method=RequestMethod.POST)
					public ModelAndView airPayCancelList(@RequestParam String id) {
						ModelAndView mav = new ModelAndView();
						List<PayInformDTO> airPayCancelList = payInformDAO.getAirPayCancelList(id);
						
						for(PayInformDTO dto : airPayCancelList) {
							if(dto.getArrive_time()==null) {dto.setArrive_time("");}
							dto.setLogtime(dto.getLogtime().substring(0, 10));
						}
						mav.addObject("airPayCancelList",airPayCancelList);
						mav.setViewName("jsonView");
						return mav;
						
					}
					

	
}
