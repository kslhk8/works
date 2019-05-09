package clientCenter.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import clientCenter.bean.BoardPaging;
import clientCenter.bean.ClientBoardDTO;
import clientCenter.bean.ConsultDTO;
import clientCenter.bean.FaqDTO;
import clientCenter.bean.NoticeDTO;
import clientCenter.bean.NoticePaging;
import clientCenter.dao.ClientCenterDAO;
import member.bean.MemberDTO;
import member.dao.MemberDAO;



@Component
@RequestMapping("/clientCenter")
public class ClientCenterController {
	private String id = "admin";
	private String name = "관리자";
	private String memTel1 = "02";
	private String memTel2 = "000";
	private String memTel3 = "1234";
	private String email1 = "admin2ma1";
	private String email2 = "hanatour.com";
	private String reservation_num = "rev123123";
	
	@Autowired
	private ClientCenterDAO clientCenterDAO;
	
	@Autowired
	private BoardPaging boardPaging;
	@Autowired
	private MemberDAO memberDAO;
	
	
	//자주하는 질문 FAQ//
	@RequestMapping(value="faq", method=RequestMethod.GET)
	public String faq(@RequestParam String summary, Model model) {
	
		model.addAttribute("summary", summary);
		model.addAttribute("display", "/clientCenter/faq.jsp");//jsp:include 부분이다...젲장${display}
		model.addAttribute("display_faq", "/clientCenter/faq_list.jsp");
		model.addAttribute("menu", "/menu/whole_menu.jsp");
		
		return "/main/index";
	}
	@RequestMapping(value="faq_list", method=RequestMethod.GET)
	public ModelAndView faq_overseasTicket(@RequestParam Map<String, String> map, Model model) {
		String summary = null;
		if(map.get("summary")==null) {
			summary="해외항공권";
		}
		
		
		String types = clientCenterDAO.getSummary(summary);
		int totalA = clientCenterDAO.getTotalBySummary(summary);
		String[] summaryList = types.split(",");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		mav.addObject("summaryList", summaryList);
		mav.addObject("totalA", totalA);
		return mav;
	}
	@RequestMapping(value="faq_writeForm", method=RequestMethod.GET)
	public String faq_writeForm(Model model) {
		
		model.addAttribute("display", "/clientCenter/faq.jsp");//jsp:include 부분이다...젲장${display}
		model.addAttribute("display_faq", "/clientCenter/faq_writeForm.jsp");
		model.addAttribute("menu", "/menu/whole_menu.jsp");
		
		return "/main/index";
		
	}
	@RequestMapping(value="faq_write", method=RequestMethod.POST)
	public ModelAndView faq_write(@RequestParam Map<String, Object>map) {
		//System.out.println("write_Test: "+map.get("summaryname"));
		//System.out.println("write_Test2: "+map.get("type")	);
		//System.out.println("write_Test3: "+map.get("subject"));
		clientCenterDAO.insertFAQ(map);
		//돌아가는거 설정을 위한 코드가 필요해보인다.//
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/main/index");
		mav.addObject("display", "/clientCenter/faq.jsp");
		mav.addObject("display_faq", "/clientCenter/faq_overseasTicket.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		
		return mav;
	}
	@RequestMapping(value="faq_type", method=RequestMethod.POST)
	public ModelAndView faq_type(@RequestParam String summaryname) {
		ModelAndView mav = new ModelAndView();
		String types = clientCenterDAO.getSummary(summaryname);
		
		String[] summaryList = types.split(",");	
		mav.setViewName("jsonView");
		mav.addObject("summaryList", summaryList);
		return mav;
	}
	@RequestMapping(value="faq_type_list", method=RequestMethod.POST)
	public ModelAndView faq_type_list(@RequestParam Map<String, Object>map) {
		ModelAndView mav = new ModelAndView();
		
		String types = clientCenterDAO.getSummary(map.get("summaryname").toString());
		
		String[] summaryList = types.split(",");
		List<FaqDTO> faqList = null;
		if(map.get("type").toString().equals("모두")) {
			System.out.println("모두");
			faqList = clientCenterDAO.getFaqListA(map.get("summaryname"));
		}else {
			System.out.println("특정:"+map.get("type")+" : "+map.get("summaryname"));
			faqList = clientCenterDAO.getFaqList(map);		
			System.out.println("faqList :"+faqList);
		}
		mav.setViewName("jsonView");
		mav.addObject("summaryList", summaryList);
		mav.addObject("faqList", faqList);
		return mav;
	}
	
	
	
	
	//공지사항//
	@RequestMapping(value="notice", method=RequestMethod.GET)//공지사항 기본페이지 //필수가 아니라는 뜻
	public String notice(@RequestParam(required=false) String pg, HttpSession session, HttpServletResponse response, Model model) {
		
		
		if(pg==null) pg="1";
		//조회수 새로고침 방지
		if(session.getAttribute("memId")!=null){
			Cookie cookie = new Cookie("memHit","hi");
			cookie.setMaxAge(1800);
			response.addCookie(cookie);
		}
		
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/clientCenter/notice.jsp");
		model.addAttribute("display_notice", "/clientCenter/notice_list.jsp");
		model.addAttribute("menu", "/menu/whole_menu.jsp");
		
		return "/main/index";
	}
	@RequestMapping(value="notice_listAction",method=RequestMethod.GET)
	public ModelAndView notice_listAction(@RequestParam int pg, HttpSession session){
		String memId = (String) session.getAttribute("memId");
		boolean existSession = memId==null ? false : true;
		
		int endNum= pg*2;
		int startNum= endNum-1;
		int totalA = clientCenterDAO.getNoticeTotalA();
	
		NoticePaging noticePaging = new NoticePaging();
		noticePaging.setCurrentPage(pg);
		noticePaging.setPageBlock(1);
		noticePaging.setPageSize(2);
		noticePaging.setTotalA(totalA);
		noticePaging.makePagingHTML();
		
		
		
		ModelAndView mav = new ModelAndView();
		List<NoticeDTO> noticeList = clientCenterDAO.getNoticeList(startNum, endNum);
		
		mav.setViewName("jsonView");
		mav.addObject("noticeList", noticeList);
		mav.addObject("existSession",existSession); //세션값 함부로 웹에서 넘기면 안돼
		mav.addObject("noticePaging", noticePaging);
		return mav;
	}
	@RequestMapping(value="notice_view", method=RequestMethod.GET)
	public String notice_view(@RequestParam Map<String, String> map, HttpServletRequest request, HttpServletResponse response, Model model) {
		int seq_notice = Integer.parseInt(map.get("seq_notice"));
		int pg = Integer.parseInt(map.get("pg"));
		
		Cookie[] ar = request.getCookies();//특정 쿠키를 얻지 못하고 모든 쿠키를 얻어옴
		for (int i = 0; i < ar.length; i++) {
			if (ar[i].getName().equals("memHit")) {
				clientCenterDAO.updateHit(seq_notice);//조회수 제어!
				ar[i].setMaxAge(0);//쿠키삭제
				response.addCookie(ar[i]);
			}
		}
		
		
		NoticeDTO noticeDTO = clientCenterDAO.getNoticeOne(seq_notice);
		//noticeDTO.setContent(noticeDTO.getContent().trim());
		int biggestSeq = clientCenterDAO.getBiggestNoticeSeq();
		int totalA = clientCenterDAO.getNoticeTotalA();
		
		
		
		model.addAttribute("totalA", totalA);
		model.addAttribute("biggestSeq", biggestSeq);
		/////////////수정해야할 부분
		
		model.addAttribute("noticeDTO", noticeDTO);
		model.addAttribute("seq_notice", seq_notice);
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/clientCenter/notice.jsp");//jsp:include 부분이다...젲장${display}
		model.addAttribute("display_notice", "/clientCenter/notice_view.jsp");
		model.addAttribute("menu", "/menu/whole_menu.jsp");
		
		return "/main/index";
	}
	
	@RequestMapping(value="notice_writeForm", method=RequestMethod.GET)
	public String notice_writeForm(Model model) {
		model.addAttribute("display", "/clientCenter/notice.jsp");//jsp:include 부분이다...젲장${display}
		model.addAttribute("display_notice", "/clientCenter/notice_writeForm.jsp");
		model.addAttribute("menu", "/menu/whole_menu.jsp");
		
		return "/main/index";
	}
	
	@RequestMapping(value="notice_write", method=RequestMethod.POST)
	public ModelAndView notice_write(@ModelAttribute NoticeDTO noticeDTO) {
		ModelAndView mav = new ModelAndView();
		clientCenterDAO.writeNotice(noticeDTO);
		
		mav.setViewName("/main/index");
		mav.addObject("display", "/clientCenter/notice.jsp");
		mav.addObject("display_notice", "/clientCenter/notice_list.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		return mav;
		
	}
	
	

	//상담문의//MEMBER DB처리!!
	@RequestMapping(value="consult", method=RequestMethod.GET)
	public ModelAndView consult(HttpSession session) {
		//MEMBER DB원래 다녀와야되!!//
		ModelAndView mav = new ModelAndView();
		MemberDTO memberDTO= memberDAO.getMember((String) session.getAttribute("memId"));
		mav.addObject("memberDTO", memberDTO);
		
		
		mav.setViewName("/main/index");
		mav.addObject("display", "/clientCenter/consult.jsp");
		mav.addObject("display_consult", "/clientCenter/consult_writeForm.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		return mav;
	}
	
	@RequestMapping(value="getConsult_type2", method=RequestMethod.POST)
	public ModelAndView getConsult_type2(@RequestParam String consult_type1) {
		String types = clientCenterDAO.getConsult_type2(consult_type1);
		String[] consult_type2List = types.split(",");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		mav.addObject("consult_type2List", consult_type2List);
		return mav;
	}
	
	@RequestMapping(value="getConsult_type3", method=RequestMethod.POST)
	public ModelAndView getConsult_type3(@RequestParam String consult_type2) {
		String types = clientCenterDAO.getConsult_type3(consult_type2);
		
		String[] consult_type3List = null;
		if(types!=null)
			consult_type3List = types.split(",");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		mav.addObject("consult_type3List", consult_type3List);
		return mav;
	}
	@RequestMapping(value="consult_writeAction", method=RequestMethod.POST)
	public ModelAndView consult_writeAction(@ModelAttribute ConsultDTO consultDTO) {
		ModelAndView mav = new ModelAndView();
		clientCenterDAO.writeConsult(consultDTO);
		
		mav.setViewName("/main/index");
		mav.addObject("display", "/clientCenter/consult.jsp");
		mav.addObject("display_consult", "/clientCenter/consult_written.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		return mav;
	}
	@RequestMapping(value="consult_list", method=RequestMethod.GET)
	public ModelAndView consult_list(@RequestParam(required=false) String pg) {//인자로 pg값 받아와야.
		
		if(pg==null) pg="1";
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/main/index");
		mav.addObject("pg", pg);
		mav.addObject("display", "/clientCenter/consult.jsp");
		mav.addObject("display_consult", "/clientCenter/consult_list.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		return mav;
	}
	@RequestMapping(value="consult_getListA", method=RequestMethod.GET)
	public ModelAndView consult_getListA(@RequestParam int pg) {
		//어차피 관라자만 볼꺼니 유효성 패스
		

		int endNum= pg*3;
		int startNum= endNum-2;
		int totalA = clientCenterDAO.getConsultTotalA();
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(1);
		boardPaging.setPageSize(2);
		boardPaging.setTotalA(totalA);
		boardPaging.consult_listPaging();
		List<ConsultDTO> consultList = clientCenterDAO.getConsultListA(startNum, endNum);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		mav.addObject("consultList", consultList);
		mav.addObject("boardPaging", boardPaging);
		return mav;
	}
	@RequestMapping(value="consult_view", method=RequestMethod.GET)
	public ModelAndView consult_view(@RequestParam int seq_consult) {
		ConsultDTO consultDTO = clientCenterDAO.getOneConsultView(seq_consult);
		ModelAndView mav = new ModelAndView();
		String id = consultDTO.getId();
		MemberDTO memberDTO= memberDAO.getMember(id);
		//셋팅..원래는 consultDTO의 id를 가지고 회원정보 들고와서 셋팅해야함!!
		
		mav.addObject("memberDTO", memberDTO);
	
		
		
		mav.setViewName("/main/index");
		mav.addObject("display", "/clientCenter/consult.jsp");
		mav.addObject("display_consult", "/clientCenter/consult_view.jsp");
		mav.addObject("seq_consult", seq_consult);
		mav.addObject("consultDTO", consultDTO);
		mav.addObject("menu", "/menu/whole_menu.jsp");
		return mav;
	}
	@RequestMapping(value="consult_replyForm", method=RequestMethod.GET)
	public ModelAndView consult_replyForm(@RequestParam int pseq) {//원글의 
		ModelAndView mav = new ModelAndView();
		
		//셋팅..원래는 consultDTO의 id를 가지고 회원정보 들고와서 셋팅해야함!!
		Map<String, Object> memberDTO = new HashMap<String, Object>();
		memberDTO.put("id", id);
		memberDTO.put("name", name);
		memberDTO.put("memTel1", memTel1);
		memberDTO.put("memTel2", memTel2);
		memberDTO.put("memTel3", memTel3);
		memberDTO.put("email1", email1);
		memberDTO.put("email2", email2);
		memberDTO.put("reservation_num", reservation_num);
		mav.addObject("memberDTO", memberDTO);
		
		mav.addObject("consultDTO", clientCenterDAO.getOneConsultView(pseq));
		//원글가져와서 보여주기
		
		
		mav.setViewName("/main/index");
		mav.addObject("display", "/clientCenter/consult.jsp");
		mav.addObject("pseq", pseq);
		mav.addObject("display_consult", "/clientCenter/consult_replyForm.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		return mav;
	}
	@RequestMapping(value="consult_replyAction", method=RequestMethod.POST)
	public ModelAndView consult_replyAction(@RequestParam Map<String, Object> map) {
		//System.out.println("replyAction:"+map);
		clientCenterDAO.replyConsult(map);
		//System.out.println("제발 ㅠㅠ");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/main/index");
		mav.addObject("display", "/clientCenter/consult.jsp");
		mav.addObject("pg", 1);
		mav.addObject("display_consult", "/clientCenter/consult_list.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		
		return mav;
	}
	@RequestMapping(value="consult_searchList", method=RequestMethod.POST)
	public ModelAndView consult_searchList(@RequestParam Map<String, Object> map) {
		int pg = 1;
		//System.out.println("search_test:"+map);
		
		int endNum= pg*2;
		int startNum= endNum-1;
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		int totalA = clientCenterDAO.getSearchConsultTotalA(map);
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(1);
		boardPaging.setPageSize(2);
		boardPaging.setTotalA(totalA);
		boardPaging.consult_listPaging();
		List<ConsultDTO> consultList = clientCenterDAO.searchConsult(map);
		ModelAndView mav = new ModelAndView();
	
		mav.setViewName("jsonView");
		mav.addObject("boardPaging", boardPaging);
		mav.addObject("consultList", consultList);
		
		return mav;
	}
	
	
	
	
	
	//고객게시판//
	@RequestMapping(value="clientBoard", method=RequestMethod.GET)
	public ModelAndView clientBoard(@RequestParam(required=false) String pg) {
		if(pg==null) pg="1";
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/main/index");
		mav.addObject("pg", pg);
		mav.addObject("display", "/clientCenter/clientBoard.jsp");
		mav.addObject("display_clientBoard", "/clientCenter/clientBoard_list.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		
		return mav;
	}
	@RequestMapping(value="clientBoard_writeForm", method=RequestMethod.GET)
	public ModelAndView clientBoard_writeForm(HttpSession session) {
		//MEMBER DB원래 다녀와야되!!//
		ModelAndView mav = new ModelAndView();
		MemberDTO memberDTO= memberDAO.getMember((String) session.getAttribute("memId"));
		mav.addObject("memberDTO", memberDTO);
		mav.setViewName("/main/index");
		mav.addObject("display", "/clientCenter/clientBoard.jsp");
		mav.addObject("display_clientBoard", "/clientCenter/clientBoard_writeForm.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		
		return mav;
	}
	@RequestMapping(value="getClientBoard_type2", method=RequestMethod.POST)
	public ModelAndView getClientBoard_type2(@RequestParam String clientboard_type1) {
		String types = clientCenterDAO.getClientBoard_type2(clientboard_type1);
		String[] clientboard_type2List = types.split(",");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		mav.addObject("clientboard_type2List", clientboard_type2List);
		
		return mav;
	}
	@RequestMapping(value="getClientBoard_type3", method=RequestMethod.POST)
	public ModelAndView getClientBoard_type3(@RequestParam String clientboard_type2) {
		String types = clientCenterDAO.getClientBoard_type3(clientboard_type2);
		
		String[] clientboard_type3List = null;
		if(types!=null)
			clientboard_type3List = types.split(",");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		mav.addObject("clientboard_type3List", clientboard_type3List);
		
		return mav;
	}
	@RequestMapping(value="clientBoard_writeAction", method=RequestMethod.POST)
	public ModelAndView clientBoard_write(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		//System.out.println("writeAc:"+map);
		if(map.get("clientboard_type3").equals("No-Subtype")) {
			map.replace("clientboard_type3", "");
		}
		clientCenterDAO.writeClientBoard(map);
		//writeAc:{name=관리자, id=admin, email1=admin2ma1
		//, email2=hanatour.com, cbWriteFormT_tel=02-000-1234
		//, clientBoard_type1=칭찬글/여행후기, clientBoard_type2=친절
		//, clientBoard_type3=No-Subtype, subject=1, content=1, count=0}

		
		mav.setViewName("/main/index");
		mav.addObject("pg", 1);
		mav.addObject("display", "/clientCenter/clientBoard.jsp");
		mav.addObject("display_clientBoard", "/clientCenter/clientBoard_written.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		
		return mav;
	}
	@RequestMapping(value="clientBoard_getList", method=RequestMethod.GET)
	public ModelAndView clientBoard_getList(@RequestParam int pg) {
		ModelAndView mav = new ModelAndView();
		int endNum= pg*3;
		int startNum= endNum-2;
		int totalA = clientCenterDAO.getClientBoardTotalA();
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(1);
		boardPaging.setPageSize(2);
		boardPaging.setTotalA(totalA);
		boardPaging.clientBoardPaging();
		List<ClientBoardDTO> cbList = clientCenterDAO.getClientBoardList(startNum, endNum);
		//System.out.println("압소사:"+cbList);
		
		mav.setViewName("jsonView");
		mav.addObject("cbList", cbList);
		mav.addObject("boardPaging", boardPaging);
		
		return mav;
	}
	@RequestMapping(value="clientBoardView", method=RequestMethod.GET)
	public ModelAndView clientBoardView(@RequestParam int seq_cb,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		//셋팅..원래는 consultDTO의 id를 가지고 회원정보 들고와서 셋팅해야함!!
		MemberDTO memberDTO= memberDAO.getMember((String) session.getAttribute("memId"));
		mav.addObject("memberDTO", memberDTO);
		
		ClientBoardDTO cb = clientCenterDAO.getOneClientBoardView(seq_cb);
		//System.out.println(seq_cb+" "+cb);
		
		mav.addObject("cb", cb);
		mav.setViewName("/main/index");
		mav.addObject("seq_cb", seq_cb);
		mav.addObject("display", "/clientCenter/clientBoard.jsp");
		mav.addObject("display_clientBoard", "/clientCenter/clientBoard_view.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		
		return mav;
	}
	
	@RequestMapping(value="clientBoard_replyForm", method=RequestMethod.GET)
	public ModelAndView clientBoard_replyForm(@RequestParam int seq_cb) {
		ModelAndView mav = new ModelAndView();
		//System.out.println("clientBoard_replyForm:" + seq_cb);
		Map<String, Object> memberDTO = new HashMap<String, Object>();
		memberDTO.put("id", id);
		memberDTO.put("name", name);
		memberDTO.put("memTel1", memTel1);
		memberDTO.put("memTel2", memTel2);
		memberDTO.put("memTel3", memTel3);
		memberDTO.put("email1", email1);
		memberDTO.put("email2", email2);
		memberDTO.put("reservation_num", reservation_num);
		mav.addObject("memberDTO", memberDTO);
		ClientBoardDTO cb = clientCenterDAO.getOneClientBoardView(seq_cb);
		//원글얻어오기 
		mav.addObject("cb", cb);
		mav.addObject("seq_cb", seq_cb);
		mav.setViewName("/main/index");
		mav.addObject("display", "/clientCenter/clientBoard.jsp");
		mav.addObject("display_clientBoard", "/clientCenter/clientBoard_replyForm.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		
		return mav;
	}
	@RequestMapping(value="clientBoard_replyAction", method=RequestMethod.POST)
	public ModelAndView clientBoard_replyAction(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		//System.out.println("replyAction:"+map);
		clientCenterDAO.replyClientBoard(map);
		//System.out.println("제발 ㅠㅠ");
		
		
		mav.setViewName("/main/index");
		mav.addObject("pg", 1);
	
		mav.addObject("display", "/clientCenter/clientBoard.jsp");
		mav.addObject("display_clientBoard", "/clientCenter/clientBoard_list.jsp");
		mav.addObject("menu", "/menu/whole_menu.jsp");
		
		return mav;
	}
	@RequestMapping(value="clientBoard_searchAction", method=RequestMethod.POST)
	public ModelAndView clientBoard_searchAction(@RequestParam Map<String, Object> map) {
		int pg = 1; 
		if(map.get("pg")!=null)	Integer.parseInt(map.get("pg").toString());
		//System.out.println("search_test:"+map);
		
		int endNum= pg*3;
		int startNum= endNum-2;
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		int totalA = clientCenterDAO.getSearchCBTotalA(map);
		//System.out.println("개수는:"+totalA);
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(1);
		boardPaging.setPageSize(2);
		boardPaging.setTotalA(totalA);
		boardPaging.clientBoardPaging();
		List<ConsultDTO> cbList = clientCenterDAO.searchClientBoard(map);
		//System.out.println("result: "+cbList);
		ModelAndView mav = new ModelAndView();
	
		/////////////
		mav.setViewName("jsonView");
		mav.addObject("pg",1);
		mav.addObject("boardPaging", boardPaging);
		mav.addObject("cbList", cbList);
		
		return mav;
	}
	
	
}
