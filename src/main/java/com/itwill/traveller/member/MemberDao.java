package com.itwill.traveller.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;

public class MemberDao {
	
	private DataSource dataSource;
	
	public MemberDao() throws Exception {
		Properties properties = new Properties();
		properties.load(this.getClass().getResourceAsStream("/com/itwill/traveller/jdbc.properties"));
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClass"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("user"));
		basicDataSource.setPassword(properties.getProperty("password"));
		this.dataSource = basicDataSource;
	}
	
	/*
	 회원 1명 추가
	 */
	public int insertMember(Member member) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int insertRowCount = 0;
		
		try {
			
			//"insert into member(m_id, m_pass, m_name, m_email, m_birth, m_phone) values(?, ?, ?, ?, ?, ?)"
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(MemberSQL.MEMBER_INSERT);
			pstmt.setString(1, member.getM_id());
			pstmt.setString(2, member.getM_pass());
			pstmt.setString(3, member.getM_name());
			pstmt.setString(4, member.getM_email());
			pstmt.setString(5, member.getM_birth());
			pstmt.setString(6, member.getM_phone());
			insertRowCount = pstmt.executeUpdate();
			
		} finally {
			
			if(pstmt != null) {
				pstmt.close();
			}
			if(con != null) {
				con.close();
			}
			
		}
		
		return insertRowCount;
	}
	
	/*
	 회원 1명 수정
	 */
	public int updateMember(Member member) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int updateRowCount = 0;
		
		try {
			
			//"update member set m_pass = ?, m_name = ?, m_email = ?, m_phone = ? where m_id = ?";
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(MemberSQL.MEMBER_UPDATE);
			pstmt.setString(1, member.getM_pass());
			pstmt.setString(2, member.getM_name());
			pstmt.setString(3, member.getM_email());
			pstmt.setString(4, member.getM_phone());
			pstmt.setString(5, member.getM_id());
			updateRowCount = pstmt.executeUpdate();
			
		} finally {
			
			if(pstmt != null) {
				pstmt.close();
			}
			if(con != null) {
				con.close();
			}
		}
		
		return updateRowCount;
	}
	
	/*
	 회원 1명 탈퇴
	 */
	public int deleteMember(String m_id) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		int deleteRowCount = 0;
		
		try {
			
			//"delete member where m_id = ?";
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(MemberSQL.MEMBER_DELETE);
			pstmt.setString(1, m_id);
			deleteRowCount = pstmt.executeUpdate();
			
		} finally {
			
			if(pstmt != null) {
				pstmt.close();
			}
			if(con != null) {
				con.close();
			}
		}
		
		return deleteRowCount;
	}
	
	/*
	 회원 1명 출력해서 Member  DTO에  객체로 저장
	 */
	public Member selectById(String m_id) throws Exception {
		Member member = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			//"select * from member where m_id = ?";
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(MemberSQL.MEMBER_SELECT_ID);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member = new Member(rs.getString("m_id"), rs.getString("m_pass"), rs.getString("m_name"), rs.getString("m_email"), rs.getString("m_birth"), rs.getString("m_phone"));
			}
			
		} finally {
			
			if(rs != null) {
				rs.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
			if(con != null) {
				con.close();
			}
			
		}
		
		return member;
	}
	
	/*
	 * 회원 아이디 찾기 (이름, 폰번호로 받아서 찾기)
	 */
	
	public Member findId(String m_name, String m_phone) throws Exception {
		Member member = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(MemberSQL.MEMBER_FIND_ID);
			pstmt.setString(1, m_name);
			pstmt.setString(2, m_phone);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member = new Member(rs.getString("m_id"), rs.getString("m_pass"), rs.getString("m_name"), rs.getString("m_email"), rs.getString("m_birth"), rs.getString("m_phone"));
			}
			
		} finally {
			
			if(rs != null) {
				rs.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
			if(con != null) {
				con.close();
			}
			
		}
		
		return member;
	}
	
	/*
	 회원 전체 출력해서 ArrayList<Member> 컬렉션에 저장
	 */
	public ArrayList<Member> selectAll() throws Exception{
		ArrayList<Member> memberList = new ArrayList<Member>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(MemberSQL.MEMBER_SELECT_ALL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				memberList.add(new Member(rs.getString("m_id"), rs.getString("m_pass"), rs.getString("m_name"), rs.getString("m_email"), rs.getString("m_birth"), rs.getString("m_phone")));
			}
			
		} finally {
			
			if(rs != null) {
				rs.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
			if(con != null) {
				con.close();
			}
		}
		
		return memberList;
	}
	
	/*
	 회원 존재하는지 여부
	 */
	public boolean existedMember(String m_id) throws Exception {
		boolean exist = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			//"select count(*) cnt from member where m_id = ?";
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(MemberSQL.MEMBER_COUNT);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int count = rs.getInt("cnt");
				if(count == 1) {
					exist = true;
				}
			}
			
		} finally {
			
			if(rs != null) {
				rs.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
			if(con != null) {
				con.close();
			}
			
		}
		
		return exist;
	}

}
