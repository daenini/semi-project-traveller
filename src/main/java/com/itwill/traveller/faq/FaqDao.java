package com.itwill.traveller.faq;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;

import com.itwill.traveller.member.Member;

public class FaqDao {
	private DataSource dataSource;
	public FaqDao() throws Exception{
		Properties properties = new Properties();
		properties.load(this.getClass().getResourceAsStream("/com/itwill/traveller/jdbc.properties"));
		/*** Apache DataSource ***/
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClass"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("user"));
		basicDataSource.setPassword(properties.getProperty("password"));
		dataSource = basicDataSource;
	}
	
	/*
	 자주찾는 질문(FAQ) 등록
	 */
	public int insertFaq(Faq faq) throws Exception {
		int insertRowCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(FaqSQL.INSERT_FAQ);
			pstmt.setString(1, faq.getF_question());
			pstmt.setString(2, faq.getF_answer());
			pstmt.setString(3, faq.getMember().getM_id());
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
	 자주찾는 질문(FAQ) 수정
	 */
	public int updateFaq(Faq faq) throws Exception{
		int updateRowCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(FaqSQL.UPDATE_SQL);
			pstmt.setString(1, faq.getF_question());
			pstmt.setString(2, faq.getF_answer());
			pstmt.setInt(3, faq.getF_no());
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
	 자주찾는 질문(FAQ) 삭제
	 */
	public int deleteFaq(int f_no) throws Exception{
		int deleteRowCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(FaqSQL.DELETE_SQL);
			pstmt.setInt(1, f_no);
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
	 자주찾는 질문(FAQ) 1개 정보
	 */
	public Faq selectByNo(int f_no) throws Exception{
		Faq faq = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(FaqSQL.SELECT_BY_NO);
			pstmt.setInt(1, f_no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				faq = new Faq(rs.getInt("f_no"), rs.getString("f_question"), rs.getString("f_answer"), new Member(rs.getString("m_id"), null, null, null, null, null));
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
		
		return faq;
	}
	
	/*
	 자주찾는 질문(FAQ) 리스트목록
	 */
	public ArrayList<Faq> selectAll() throws Exception {
		ArrayList<Faq> faqList = new ArrayList<Faq>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(FaqSQL.SELECT_ALL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				faqList.add(new Faq(rs.getInt("f_no"),
									rs.getString("f_question"),
									rs.getString("f_answer"),
									new Member(rs.getString("m_id"), null, rs.getString("m_name"), null, null, null)));
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
		
		return faqList;
	}
	

	/*
	 f_board 페이지에 보여줄 로직(페이징 처리)
	 <<<하나의 페이지 당 출력에 사용될 변수>>>
	 int pageSize = 한 페이지에 출력할 레코드 수
	 String pageNum = 페이지 링크를 클릭한 번호 / 현재 페이지(String pageNum = request.getParameter("pageNum");
	 int currentPage = 현재 페이지(연산을 위해 pageNum 형변환)(int currentPage = Integer.parseInt(pageNum);
	 */
	public ArrayList<Faq> getList(int startRow, int endRow) throws Exception{
		//int startRow : 해당 페이지의 시작할 레코드 번호
		//int endRow : 해당 페이지의 마지막 레코드 번호
		ArrayList<Faq> faqList = new ArrayList<Faq>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(FaqSQL.SELECT_PAGE);
			pstmt.setInt(1, startRow);    //해당 페이지 시작할 레코드 번호
			pstmt.setInt(2, endRow);      //해당 페이지 마지막 레코드 번호
			rs = pstmt.executeQuery();
			while(rs.next()) {
				faqList.add(new Faq(rs.getInt("f_no"),
									rs.getString("f_question"),
									rs.getString("f_answer"),
									new Member(rs.getString("m_id"), null, null, null, null, null)));
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
		return faqList;
	}
	
	//총 레코드(faq) 갯수 구하는 메소드
	public int getCount() throws Exception {
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(FaqSQL.SELECT_COUNT);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("cnt");
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
		
		return count;
	}
	
	
	
}
