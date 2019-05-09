package clientCenter.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import clientCenter.bean.ClientBoardDTO;
import clientCenter.bean.ConsultDTO;
import clientCenter.bean.FaqDTO;
import clientCenter.bean.NoticeDTO;

@Component("clientCenterDAO")
@Transactional
public class ClientCenterDAOImpl implements ClientCenterDAO {
	@Autowired
	private SqlSession sqlSession;

	//자주찾는 질문//
	@Override
	public int getTotalBySummary(String summaryname) {
		int totalA = sqlSession.selectOne("clientCenterSQL.getTotalBySummary",summaryname);
		return totalA;
	}
	@Override
	public String getSummary(String summaryname) {
		String types = sqlSession.selectOne("clientCenterSQL.getSummary", summaryname);
		return types;
	}
	@Override
	public void insertFAQ(Map<String, Object> map) {
		sqlSession.insert("clientCenterSQL.insertFAQ", map);
	}
	@Override
	public List<FaqDTO> getFaqList(Map<String, Object> map) {
		List<FaqDTO> faqList = sqlSession.selectList("clientCenterSQL.getFaqList", map);
		return faqList;
	}
	@Override
	public List<FaqDTO> getFaqListA(Object summaryname) {
		List<FaqDTO> faqList = sqlSession.selectList("clientCenterSQL.getFaqListA", summaryname);
		return faqList;
	}
	
	
	//공지사항//
	@Override
	public void writeNotice(NoticeDTO noticeDTO) {
		sqlSession.insert("clientCenterSQL.writeNotice", noticeDTO);
	}
	@Override
	public int getNoticeTotalA() {
		int totalA = sqlSession.selectOne("clientCenterSQL.getNoticeTotalA");
		return totalA;
	}
	@Override
	public List<NoticeDTO> getNoticeList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		List<NoticeDTO> noticeList = sqlSession.selectList("clientCenterSQL.getNoticeList", map);
		return noticeList;
	}
	@Override
	public void updateHit(int seq_notice) {
		sqlSession.update("clientCenterSQL.updateHit", seq_notice);
	}
	@Override
	public NoticeDTO getNoticeOne(int seq_notice) {
		NoticeDTO noticeDTO = sqlSession.selectOne("clientCenterSQL.getNoticeOne", seq_notice);
		return noticeDTO;
	}
	/*@Override
	public int getTotalNotice() {
		int totalNotice = sqlSession.selectOne("clientCenterSQL.getTotalNotice");
		return totalNotice;
	}*/
	@Override
	public int getBiggestNoticeSeq() {
		int biggestSeq = sqlSession.selectOne("clientCenterSQL.getBiggestNoticeSeq");
		return biggestSeq;
	}

	
	
	//상담문의//
	@Override
	public String getConsult_type2(String consult_type1) {
		String types = sqlSession.selectOne("clientCenterSQL.getConsult_type2", consult_type1);
		return types;
	}
	@Override
	public String getConsult_type3(String consult_type2) {
		String types = sqlSession.selectOne("clientCenterSQL.getConsult_type3", consult_type2);
		return types;
	}
	@Override
	public void writeConsult(ConsultDTO consultDTO) {
		sqlSession.insert("clientCenterSQL.writeConsult", consultDTO);
	}
	@Override
	public int getConsultTotalA() {
		int totalA = sqlSession.selectOne("clientCenterSQL.getConsultTotalA");
		return totalA;
	}
	@Override
	public List<ConsultDTO> getConsultListA(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		List<ConsultDTO> consultList = sqlSession.selectList("clientCenterSQL.getConsultListA", map);
		return consultList;
	}
	@Override
	public ConsultDTO getOneConsultView(int seq_consult) {
		ConsultDTO consultDTO = sqlSession.selectOne("clientCenterSQL.getOneConsultView", seq_consult);
		return consultDTO;
	}
	@Override
	public int getSearchConsultTotalA(Map<String, Object> map) {
		int totalA = sqlSession.selectOne("clientCenterSQL.getSearchConsultTotalA", map);
		return totalA;
	}
	@Override
	public List<ConsultDTO> searchConsult(Map<String, Object> map){
		List<ConsultDTO> searchList = sqlSession.selectList("clientCenterSQL.searchConsult", map);
		return searchList;
	}
	@Override
	public void replyConsult(Map<String, Object> map) {
		System.out.println("맘소사:"+map);
		int seq_consult = Integer.parseInt(map.get("pseq").toString());
		System.out.println(seq_consult);//0
		ConsultDTO primeConsult = sqlSession.selectOne("clientCenterSQL.getOneConsultView", seq_consult);
		System.out.println("제발:"+primeConsult);
		map.put("ref", primeConsult.getRef()+"");
		map.put("lev", primeConsult.getLev()+1+"");
		map.put("step", primeConsult.getStep()+1+"");
		System.out.println(primeConsult.getRef()+"");
		//sqlSession.update("clientCenterSQL.replyConsult1", map);
		//같은 그룹에서 원글보다 step글순서가 높은 애들의 step을 올린다. 일단계만 하고 있는 이곳은 필요없을거같다.
		
		sqlSession.insert("clientCenterSQL.replyConsult2", map);
		System.out.println("2까진");
		sqlSession.update("clientCenterSQL.replyConsult3", seq_consult);
	}
	
	/*sqlSession.update("boardSQL.boardReply1",pDTO);
	//insert
	map.put("ref", pDTO.getRef()+"");
	map.put("lev", pDTO.getLev()+1+"");
	map.put("step", pDTO.getStep()+1+"");
	sqlSession.insert("boardSQL.boardReply2",map);
	//��ۼ� reply update
	sqlSession.update("boardSQL.boardReply3",pDTO.getSeq());*/
	
	
	
	//고객게시판//
	@Override
	public String getClientBoard_type2(String clientboard_type1) {
		String types = sqlSession.selectOne("clientCenterSQL.getClientBoard_type2", clientboard_type1);
		return types;
	}
	@Override
	public String getClientBoard_type3(String clientboard_type2) {
		String types = sqlSession.selectOne("clientCenterSQL.getClientBoard_type3", clientboard_type2);
		return types;
	}
	@Override
	public int getClientBoardTotalA() {
		int su = sqlSession.selectOne("clientCenterSQL.getClientBoardTotalA");
		return su;
	}
	@Override
	public List<ClientBoardDTO> getClientBoardList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		List<ClientBoardDTO> cbList = sqlSession.selectList("clientCenterSQL.getClientBoardList", map);
		return cbList;
	}
	@Override
	public void writeClientBoard(Map<String, Object> map) {
		System.out.println("dao:"+map);
		sqlSession.insert("clientCenterSQL.writeClientBoard", map);		
	}
	@Override
	public ClientBoardDTO getOneClientBoardView(int seq_cb) {
		ClientBoardDTO cb = sqlSession.selectOne("clientCenterSQL.getOneClientBoardView", seq_cb);
		return cb;
	}
	@Override
	public void replyClientBoard(Map<String, Object> map) {
		System.out.println("맘소사:"+map);
		int seq_cb = Integer.parseInt(map.get("pseq").toString());
		System.out.println(seq_cb);//0
		ClientBoardDTO primeConsult = sqlSession.selectOne("clientCenterSQL.getOneClientBoardView", seq_cb);
		System.out.println("제발:"+primeConsult);
		map.put("ref", primeConsult.getRef()+"");
		map.put("lev", primeConsult.getLev()+1+"");
		map.put("step", primeConsult.getStep()+1+"");
		System.out.println(primeConsult.getRef()+"");
		//sqlSession.update("clientCenterSQL.replyClientBoard1", map);
		//같은 그룹에서 원글보다 step글순서가 높은 애들의 step을 올린다. 일단계만 하고 있는 이곳은 필요없을거같다.
		
		sqlSession.insert("clientCenterSQL.replyClientBoard2", map);
		System.out.println("2까진");
		sqlSession.update("clientCenterSQL.replyClientBoard3", seq_cb);
		
	}
	@Override
	public int getSearchCBTotalA(Map<String, Object> map) {
		int totalA = sqlSession.selectOne("clientCenterSQL.getSearchCBTotalA",map);
		return totalA;
	}
	@Override
	public List<ConsultDTO> searchClientBoard(Map<String, Object> map) {
		List<ConsultDTO> searchList = sqlSession.selectList("clientCenterSQL.searchClientBoard", map);
		return searchList;
	}
	@Override
	public void updateHitClientBoard(int seq_cb) {
		sqlSession.update("clientCenterSQL.updateHitClientBoard", seq_cb);
		
	}
	

	
	
	
	
	

	

}
