package com.itwill.traveller.qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.itwill.traveller.DataSource;
import com.itwill.traveller.member.Member;
import com.itwill.traveller.product.Product;

/*
이름         널?       유형           
---------- -------- ------------ 
Q_NO       NOT NULL NUMBER(10)   
Q_CATEGORY          VARCHAR2(50) 
Q_TITLE             VARCHAR2(50) 
Q_WRITER            VARCHAR2(50) 
Q_STATE             VARCHAR2(50) 
Q_CONTENT           VARCHAR2(50) 
 */

public class QnaDao {
	private DataSource dataSource;
	private String tableName = "qna"; // 테이블 이름

	public QnaDao() {
		this.dataSource = new DataSource();
	}

	public ArrayList<Qna> selectPage(int page) throws Exception {
		ArrayList<Qna> qnaList=new ArrayList<Qna>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;		
		try {
			String query = QnaSQL.SELECT_PAGE.replace("$tableName",tableName);
			con=dataSource.getConnection();
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, page);
			pstmt.setInt(2, page);		
			rs=pstmt.executeQuery();
			while(rs.next()) {
				qnaList.add(new Qna(rs.getInt("q_no"),
									rs.getString("q_title"),
									rs.getString("q_content"),
									rs.getString("q_category"),
									rs.getString("q_state"),
									new Member(	rs.getString("m_id"),
												rs.getString("m_pass"),
												rs.getString("m_name"),
												rs.getString("m_email"),
												rs.getString("m_birth"),
												rs.getString("m_phone")),
									new Product())
							);
			}
		}finally {
			if (con != null) {
				con.close();
			}
		}
		return qnaList;
	}
	
	public ArrayList<Qna> selectPageSearch(String search, int startRow, int endRow) throws Exception {
		ArrayList<Qna> qnaList=new ArrayList<Qna>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;	
		try {
			String query = QnaSQL.SELECT_PAGE_SEARCH.replace("$tableName",tableName);
			con=dataSource.getConnection();
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, "%"+search+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				qnaList.add(new Qna(rs.getInt("q_no"),
									rs.getString("q_title"),
									rs.getString("q_content"),
									rs.getString("q_category"),
									rs.getString("q_state"),
									new Member(	rs.getString("m_id"),
												rs.getString("m_pass"),
												rs.getString("m_name"),
												rs.getString("m_email"),
												rs.getString("m_birth"),
												rs.getString("m_phone")),
									new Product())
							);
			}
		}finally {
			if (con != null) {
				con.close();
			}
		}
		return qnaList;
	}
	
	public ArrayList<Qna> selectPageCategory(String category, int startRow, int endRow) throws Exception {
		ArrayList<Qna> qnaList=new ArrayList<Qna>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;	
		try {
			String query = QnaSQL.SELECT_PAGE_CATEGORY.replace("$tableName",tableName);
			con=dataSource.getConnection();
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, category);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				qnaList.add(new Qna(rs.getInt("q_no"),
									rs.getString("q_title"),
									rs.getString("q_content"),
									rs.getString("q_category"),
									rs.getString("q_state"),
									new Member(	rs.getString("m_id"),
												rs.getString("m_pass"),
												rs.getString("m_name"),
												rs.getString("m_email"),
												rs.getString("m_birth"),
												rs.getString("m_phone")),
									new Product())
							);
			}
		}finally {
			if (con != null) {
				con.close();
			}
		}
		return qnaList;
	}
	
	public int getCount(String search, String category) throws Exception {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count = 0;
		try {
			String query = QnaSQL.GET_COUNT.replace("$tableName",tableName);
			con=dataSource.getConnection();
			pstmt=con.prepareStatement(query);
			
			if(!(search==null || search.equals(""))) {
				pstmt = con.prepareStatement(query + " where q_title like ?");
				pstmt.setString(1, "%"+search+"%");
			}
			
			if(!(category==null || category.equals(""))) {
				pstmt = con.prepareStatement(query + " where q_category=?");
				pstmt.setString(1, category);
			}
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}finally {
			if (con != null) {
				con.close();
			}
		}
		return count;
	}
	
	public int insertQna(Qna qna) throws Exception {
		Connection con=null;
		PreparedStatement pstmt=null;
		int insertRowCount = 0;
		try {
			String query = QnaSQL.INSERT.replace("$tableName",tableName);
			con=dataSource.getConnection();
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, qna.getQ_title());
			pstmt.setString(2, qna.getQ_content());
			pstmt.setString(3, qna.getQ_category());
			pstmt.setString(4, qna.getMember().getM_id());
			pstmt.setInt(5, qna.getProduct().getP_no());
			insertRowCount = pstmt.executeUpdate();
		}finally {
			if (con != null) {
				con.close();
			}
		}
		return insertRowCount;
	}

	public Qna selectByNo(int no)throws Exception {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		Qna qna=null;
		try {
			String query = QnaSQL.SELECT_NO.replace("$tableName",tableName);
			con=dataSource.getConnection();
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				qna = new Qna(	rs.getInt("q_no"),
								rs.getString("q_title"),
								rs.getString("q_content"),
								rs.getString("q_category"),
								rs.getString("q_state"),
								new Member(rs.getString("m_id"),
				 							rs.getString("m_pass"),
				 							rs.getString("m_name"),
				 							rs.getString("m_email"),
				 							rs.getString("m_birth"),
				 							rs.getString("m_phone")),
								new Product()
							);
			}
		}finally {
			if (con != null) {
				con.close();
			}
		}
		return qna;
	}

	public int updateQna(Qna qna) throws Exception {
		Connection con=null;
		PreparedStatement pstmt=null;
		int updateRowCount = 0;
		try {
			String query = QnaSQL.UPDATE.replace("$tableName",tableName);
			con=dataSource.getConnection();
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, qna.getQ_title());
			pstmt.setString(2, qna.getQ_content());
			pstmt.setString(3, qna.getQ_category());
			pstmt.setInt(4, qna.getQ_no());
			updateRowCount = pstmt.executeUpdate();
		}finally {
			if (con != null) {
				con.close();
			}
		}
		return updateRowCount;
	}

	public int deleteQna(int no) throws Exception {
		Connection con=null;
		PreparedStatement pstmt=null;
		int deleteRowCount = 0;
		try {
			String query = QnaSQL.DELETE.replace("$tableName",tableName);
			con=dataSource.getConnection();
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, no);
			deleteRowCount = pstmt.executeUpdate();
		}finally {
			if (con != null) {
				con.close();
			}
		}
		return deleteRowCount;
	}
	
}	
