package com.itwill.traveller.member;

import java.util.ArrayList;

import com.itwill.traveller.member.exception.MemberNotFoundException;
import com.itwill.traveller.member.exception.PasswordMismatchException;



public class MemberService {
	
	private MemberDao memberDao;
	
	public MemberService() throws Exception {
		
		memberDao = new MemberDao();
		
	}
	
	/*
	 회원 1명 추가(test)
	 */
	public int insertMember(Member member) throws Exception{
		return memberDao.insertMember(member);
	}
	
	/*
	 회원 1명 수정
	 */
	public int updateMember(Member member) throws Exception {
		return memberDao.updateMember(member);
	}
	
	/*
	 회원 1명 탈퇴
	 */
	public int deleteMember(String m_id) throws Exception {
		return memberDao.deleteMember(m_id);
	}
	
	/*
	 회원 1명 출력해서 Member  DTO에  객체로 저장
	 */
	public Member selectById(String m_id) throws Exception {
		return memberDao.selectById(m_id);
	}
	
	/*
	 * 회원 이름과 핸드폰 번호를 받아서 Member DTO에 객체로 저장
	 */
	public Member findId(String m_name, String m_phone) throws Exception {
		return memberDao.findId(m_name,m_phone);
	}
	
	/*
	 회원 전체 출력해서 ArrayList<Member> 컬렉션에 저장
	 */
	public ArrayList<Member> selectAll() throws Exception {
		return memberDao.selectAll();
	}
	
	/*
	 회원 존재하는지 여부
	 */
	public boolean existedMember(String m_id) throws Exception {
		return memberDao.existedMember(m_id);
	}
	
	/*
	 로그인 체크
	 */
	public boolean login(String m_id, String m_pass) throws Exception{
		boolean login = false;
		Member member = memberDao.selectById(m_id);
		if(member == null) {
			throw new MemberNotFoundException(m_id + "는 존재하지 않는 아이디입니다.");
		}else {
			if(member.getM_pass().equals(m_pass)) {
				login = true;
			} else {
				throw new PasswordMismatchException("비밀번호가 일치하지 않습니다.");
			}
		}
		
		
		return login;
	}

}
