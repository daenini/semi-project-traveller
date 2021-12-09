package com.itwill.traveller.member;

public class MemberSQL {
	
	public static final String MEMBER_INSERT = "insert into member(m_id, m_pass, m_name, m_email, m_birth, m_phone) values(?, ?, ?, ?, ?, ?)";
	
	public static final String MEMBER_UPDATE = "update member set m_pass = ?, m_name = ?, m_email = ?, m_phone = ? where m_id = ?";
	
	public static final String MEMBER_DELETE = "delete member where m_id = ?";
	
	public static final String MEMBER_SELECT_ID = "select * from member where m_id = ?";
	
	public static final String MEMBER_FIND_ID = "select * from member where m_name = ? and m_phone = ?";
	
	public static final String MEMBER_SELECT_ALL = "select * from member";
	
	public static final String MEMBER_COUNT = "select count(*) cnt from member where m_id = ?";

}
