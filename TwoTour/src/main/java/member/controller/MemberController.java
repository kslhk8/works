package member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.bean.MemberDTO;
import member.dao.MemberDAO;
import payInform.bean.PayInformDTO;
import payInform.dao.PayInformDAO;
import reservationInform.bean.ReservationInformDTO;
import reservationInform.dao.ReservationInformDAO;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	MemberDAO memberDAO;
	@Autowired
	ReservationInformDAO reservationInformDAO;
	@Autowired
	PayInformDAO payInformDAO;
	//회원가입창
	@RequestMapping(value="/writeForm", method=RequestMethod.GET)
	public ModelAndView writeForm() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/main/index");
		mav.addObject("display", "/member/writeForm.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		return mav;
	}
	//중복체크
	@RequestMapping(value="/checkId",method=RequestMethod.POST)
	public @ResponseBody String checkId(@RequestParam String id) {
		MemberDTO memberDTO = memberDAO.getMember(id);
			if (memberDTO == null) {
				return "not_exist";
			}
			else {
				return "exist";	
			}
	}
	
	//회원가입완료
	@RequestMapping(value="/write",method=RequestMethod.POST)
	public ModelAndView write(@ModelAttribute MemberDTO memberDTO) {
		memberDAO.insertMember(memberDTO);
		System.out.println(memberDTO.getId());
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/member/loginForm.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	//로그인창
	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	public ModelAndView loginForm() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/main/index");
		mav.addObject("display", "/member/loginForm.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		return mav;
	}
	//로그인하기
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public @ResponseBody String login(@RequestParam String id,@RequestParam String pwd,HttpSession session) {
		if(id.equals("") || pwd.equals("")) return "empty";
		if(id.equals("admin")) return "no_accept";
		MemberDTO memberDTO = memberDAO.checkLogin(id, pwd);
		if (memberDTO == null) {
			return "not_exist";
		}
		
	else {
		session.setAttribute("memName", memberDTO.getName()); //서버가 인코드 다함
		session.setAttribute("memId",id);
		return "exist";	
		}
	}
	
	@RequestMapping(value="/adminLogin",method=RequestMethod.POST)
	public @ResponseBody String adminLogin(@RequestParam String id,@RequestParam String pwd,HttpSession session) {
		if(id.equals("") || pwd.equals("")) return "empty";
		if(id.equals("admin")) {
		MemberDTO memberDTO = memberDAO.checkLogin(id, pwd);
		
		if (memberDTO == null) {
			return "not_exist";
		}
		
			else {
				session.setAttribute("memName", memberDTO.getName()); //서버가 인코드 다함
				session.setAttribute("memId",id);
				return "exist";	
		}
	}
		else {
			return "not_exist";
		}
		
	}
	
	//로그아웃
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav= new ModelAndView();
		session.invalidate();
		mav.setViewName("/member/logout");
		return mav;
	}
	@RequestMapping(value="/findInform", method=RequestMethod.GET)
	public ModelAndView findInform() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/main/index");
		mav.addObject("display", "/member/findInform.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		return mav;
	}
	
	@RequestMapping(value="/findId",method=RequestMethod.POST)
	public @ResponseBody String findId(@RequestParam Map<String,String> map) {
		String email[] =map.get("emails").split("@");
		map.put("email", email[0]);
		map.put("email1", email[1]);
		System.out.print(map.get("year")+map.get("month")+map.get("day")+map.get("email"));
		String id= memberDAO.getId(map);
			if (id == null) {
				return "not_exist";
			}
			else {
				return id;	
			}
	}
	@RequestMapping(value = "/findPw", method = RequestMethod.POST)
	public ModelAndView FindPw(@RequestParam String id, @RequestParam String email){	
		String[] email_ar = email.split("@");
		
		Map<String,String> map = new HashMap<String,String>();
		System.out.println(email);
		map.put("id", id);
		map.put("email", email_ar[0]);
		map.put("email1", email_ar[1]);
		
		String result = null;
				
		MemberDTO memberDTO = memberDAO.checkIdEmail(map);
		
		if(memberDTO == null) {
			result =  "fail";
		}
		else {
			String pwd = "";
			for (int i = 0; i < 12; i++) {
				pwd += (char) ((Math.random() * 26) + 97);
			}
		
			// 임시비밀번호 변경 
			memberDTO.setPwd(pwd);
			memberDAO.update_pwd(memberDTO);
			
			String charSet = "utf-8";
			String hostSMTP = "smtp.naver.com";
			String hostSMTPid = "kslhk8@naver.com";
			String hostSMTPpwd = "dydqja950206";
			
			String fromEmail = "kslhk8@naver.com";
			String fromName = "TowTour Company";
			String subject = "";
			String msg = "";
			
			subject = "TwoTour 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += memberDTO.getId() + "님의 임시 비밀번호 입니다.</h3>";
			msg += "<h3>비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += memberDTO.getPwd() + "</p></div>";
			
			try {
				HtmlEmail htmlEmail = new HtmlEmail();
				htmlEmail.setDebug(true);
				htmlEmail.setCharset(charSet);
				htmlEmail.setHostName(hostSMTP);
				htmlEmail.setSmtpPort(587);

				htmlEmail.setAuthentication(hostSMTPid, hostSMTPpwd);
				htmlEmail.addTo(email, charSet);
				htmlEmail.setFrom(fromEmail, fromName, charSet);
				htmlEmail.setSubject(subject);
				htmlEmail.setHtmlMsg(msg);
				htmlEmail.send();
			} catch (Exception e) {
				System.out.println("메일발송 실패 : " + e);
			}
			
			result =  "success";		
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/main/index");
		mav.addObject("display", "/member/findPwdOk.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		mav.addObject("result", "result");
		
		return mav;
	}
	
	@RequestMapping(value = "/checkEmail", method = RequestMethod.POST)
	public @ResponseBody String checkEmail(@RequestParam String email,@RequestParam String email1){	
		
		String result = null;
			email+="@"+email1;
			System.out.println(email);
			String check_number = "";
			for (int i = 0; i < 9; i++) {
				check_number += (char) ((Math.random() * 26) + 97);
			}
		
			String charSet = "utf-8";
			String hostSMTP = "smtp.naver.com";
			String hostSMTPid = "kslhk8@naver.com";
			String hostSMTPpwd = "dydqja950206";
			
			String fromEmail = "kslhk8@naver.com";
			String fromName = "TwoTour Company";
			String subject = "";
			String msg = "";
			
			subject = "TwoTour 이메일 인증번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg +="이메일 인증번호는"+check_number+"입니다.</h3>";
			msg +="</div>";
			
			try {
				HtmlEmail htmlEmail = new HtmlEmail();
				htmlEmail.setDebug(true);
				htmlEmail.setCharset(charSet);
				htmlEmail.setHostName(hostSMTP);
				htmlEmail.setSmtpPort(587);

				htmlEmail.setAuthentication(hostSMTPid, hostSMTPpwd);
				htmlEmail.addTo(email, charSet);
				htmlEmail.setFrom(fromEmail, fromName, charSet);
				htmlEmail.setSubject(subject);
				htmlEmail.setHtmlMsg(msg);
				htmlEmail.send();
			} catch (Exception e) {
				System.out.println("메일발송 실패 : " + e);
			}
			
			result =  "success";		
		
		
		return check_number;
	}
	//멤버정보 가져오기
		@RequestMapping(value="/getMemberById",method=RequestMethod.POST)
		public ModelAndView getMemberById(@RequestParam String id) {
			ModelAndView mav = new ModelAndView();
			MemberDTO memberDTO = memberDAO.getMember(id);
			mav.addObject("memberDTO", memberDTO);
			mav.setViewName("jsonView");
			return mav;
		}
	
		@RequestMapping(value="/noLogin",method=RequestMethod.POST)
		public @ResponseBody String noLogin(@RequestParam String name,@RequestParam String reservation_number,@RequestParam String email) {
			if(name.equals("") || reservation_number.equals("") || email.equals("")) return "empty";

			String emails[] =email.split("@");
			Map<String,String> map = new HashMap<String,String>();
			map.put("reservation_name", name);
			map.put("reservation_number", reservation_number);
			map.put("reservation_email", emails[0]);
			map.put("reservation_email1", emails[1]);
			ReservationInformDTO reservationInformDTO = reservationInformDAO.getNoResevationInform(map);
			PayInformDTO payInformDTO= payInformDAO.getNoPayInform(map);
			if (reservationInformDTO == null && payInformDTO==null) {
				return "not_exist";
			}
			else {
				return "exist";	
			}
		
		}
}


