package member.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import member.bean.MemberDTO;
@Transactional
@Component("memberDAO")
public class MemberDAOMybatis implements MemberDAO {
	@Autowired
	SqlSession sqlSession;
	@Override
	public void insertMember(MemberDTO memberDTO) {
		sqlSession.insert("memberSQL.insertMember",memberDTO);
		
	}
	@Override
	public MemberDTO getMember(String id) {
		return sqlSession.selectOne("memberSQL.getMember",id);
	}
	@Override
	public MemberDTO checkLogin(String id, String pwd) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("pwd", pwd);
		return sqlSession.selectOne("memberSQL.checkLogin",map);
	}
	@Override
	public int updateBasicInfo(Map map) {
		System.out.println(map.get("id")+","+map.get("email")+map.get("email1"));
		return sqlSession.update("memberSQL.updateBasicInfo", map);
	}
	@Override
	public String getId(Map<String, String> map) {
		return sqlSession.selectOne("memberSQL.getId",map);
	}
	@Override
	public MemberDTO checkIdEmail(Map<String,String>map) {	      
	      return sqlSession.selectOne("memberSQL.checkIdEmail", map);
	 }
	
	@Override
   public void update_pwd(MemberDTO memberDTO) {
      sqlSession.update("memberSQL.update_pwd", memberDTO);
   }
	@Override
	public void deleteMember(String id) {
		sqlSession.delete("memberSQL.deleteMember",id);
		
	}
	@Override
	public void addPoint(String id, String point) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("point", point);
		sqlSession.update("memberSQL.addPoint",map);
		
	}
	@Override
	public void reducePoint(String id, String point) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("point", point);
		sqlSession.update("memberSQL.reducePoint",map);
		
	}

}
