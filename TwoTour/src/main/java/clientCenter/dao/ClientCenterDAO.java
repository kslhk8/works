package clientCenter.dao;

import java.util.List;
import java.util.Map;

import clientCenter.bean.ClientBoardDTO;
import clientCenter.bean.ConsultDTO;
import clientCenter.bean.FaqDTO;
import clientCenter.bean.NoticeDTO;

public interface ClientCenterDAO {

	public String getSummary(String summaryname);

	public void insertFAQ(Map<String, Object> map);

	public List<FaqDTO> getFaqList(Map<String, Object> map);

	public List<FaqDTO> getFaqListA(Object summaryname);

	public void writeNotice(NoticeDTO noticeDTO);

	public List<NoticeDTO> getNoticeList(int startNum, int endNum);

	public NoticeDTO getNoticeOne(int seq_notice);

	/*public int getTotalNotice();*/

	public int getBiggestNoticeSeq();

	public String getConsult_type2(String consult_type1);

	public String getConsult_type3(String consult_type2);

	public void writeConsult(ConsultDTO consultDTO);

	public List<ConsultDTO> getConsultListA(int startNum, int endNum);

	public String getClientBoard_type2(String clientboard_type1);

	public String getClientBoard_type3(String clientboard_type2);

	public int getNoticeTotalA();

	public void updateHit(int seq_notice);

	public ConsultDTO getOneConsultView(int seq_consult);

	public int getConsultTotalA();

	public List<ConsultDTO> searchConsult(Map<String, Object> map);

	public int getSearchConsultTotalA(Map<String, Object> map);

	public void replyConsult(Map<String, Object> map);

	public int getClientBoardTotalA();

	public List<ClientBoardDTO> getClientBoardList(int startNum, int endNum);

	public void writeClientBoard(Map<String, Object> map);

	public ClientBoardDTO getOneClientBoardView(int seq_cb);

	public void replyClientBoard(Map<String, Object> map);

	public int getSearchCBTotalA(Map<String, Object> map);

	public List<ConsultDTO> searchClientBoard(Map<String, Object> map);

	public int getTotalBySummary(String summaryname);

	public void updateHitClientBoard(int seq_cb);




}
