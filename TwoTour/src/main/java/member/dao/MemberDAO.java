package member.dao;

import java.util.Map;

import member.bean.MemberDTO;

public interface MemberDAO {

	public MemberDTO getMember(String id);
	
	public void insertMember(MemberDTO memberDTO);

	public MemberDTO checkLogin(String id, String pwd);
	
	public int updateBasicInfo(Map map);

	public String getId(Map<String, String> map);

	public MemberDTO checkIdEmail(Map<String,String>map);
	
	public void update_pwd(MemberDTO memberDTO);

	public void deleteMember(String id);

	public void addPoint(String id, String point);

	public void reducePoint(String id, String point);
}
