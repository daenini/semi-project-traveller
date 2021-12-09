package com.itwill.traveller.review;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import com.itwill.traveller.product.Product;

public class ReviewDao {
	private DataSource dataSource;
	public ReviewDao() throws Exception{
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
	
	// 페이지 범위 
	
	public ArrayList<Review> selectPage(int page, int p_no) throws Exception {
		ArrayList<Review> productReviewList=new ArrayList<Review>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ReviewDao reviewDao = new ReviewDao();
		int count = reviewDao.getCount(p_no);
		try {
			con=dataSource.getConnection();
			pstmt=con.prepareStatement(ReviewSQL.SELECT_PAGE);
			pstmt.setInt(1, p_no);			
			pstmt.setInt(2, page);
			pstmt.setInt(3, count);			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Review review = new Review();
				review.setRv_no(rs.getInt(2));
				review.setP_no(rs.getInt(3));
				review.setRv_title(rs.getString(4));
				review.setRv_grade(rs.getDouble(5));
				review.setRv_writer(rs.getString(6));
				review.setRv_date(rs.getDate(7));
				review.setRv_readcount(rs.getInt(8));
				review.setRv_groupno(rs.getInt(9));
				review.setRv_step(rs.getInt(10));
				review.setRv_depth(rs.getInt(11));
				

				productReviewList.add(review);
			}
		}finally {
			if (con != null) {
				con.close();
			}
		}
		return productReviewList;
	}
	
	public ArrayList<Review> getReviewListAll() throws Exception{
		ArrayList<Review> reviewList = new ArrayList<Review>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ReviewSQL.review_List_All);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				reviewList.add(new Review(rs.getInt("rv_no"),
									rs.getString("rv_title"),
									rs.getString("rv_writer"),
									rs.getString("rv_content"),
									rs.getInt("p_no"),
									rs.getDouble("rv_grade"),
								    rs.getDate("rv_date"),
								    rs.getInt("rv_readcount"),
								    rs.getInt("rv_groupno"),
								    rs.getInt("rv_step"),
								    rs.getInt("rv_depth"))								
								);
				}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null) {
				con.close();
			}
		}
		return reviewList;
	}
	// 해당 상품의 리뷰 조회
	public ArrayList<Review> getProductReviewList(int p_no) throws Exception{
		ArrayList<Review> productReviewList = new ArrayList<Review>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ReviewSQL.product_Review_List);
			pstmt.setInt(1,p_no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Review review = new Review();
				review.setRv_no(rs.getInt(2));
				review.setRv_title(rs.getString(3));
				review.setRv_grade(rs.getDouble(4));
				review.setRv_writer(rs.getString(5));
				review.setRv_date(rs.getDate(6));
				review.setRv_readcount(rs.getInt(7));
				review.setRv_groupno(rs.getInt(8));
				review.setRv_step(rs.getInt(9));
				review.setRv_depth(rs.getInt(10));
				

				productReviewList.add(review);
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null) {
				con.close();
			}
		}
		return productReviewList;
		
	}
	
	
	/*
	 * rv_grade 의 평균 = p_grade
	 * 호출 시 평균 값 다시 계산됨.
	 */
	public double getProductGrade(int p_no) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		double p_grade = 0.0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ReviewSQL.get_Product_Grade);
			pstmt.setInt(1,p_no);
			rs = pstmt.executeQuery();
			if (rs.next())
				p_grade = rs.getDouble(1);

		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (Exception ex) {
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (con != null)
					con.close();
			} catch (Exception ex) {
			}
		}
		return p_grade;
	}
	
	/*
	 * 리뷰 작성 
	 */
	public int create(Review review) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ReviewSQL.create_Review);
			pstmt.setString(1, review.getRv_title());
			pstmt.setString(2, review.getRv_writer());
			pstmt.setString(3, review.getRv_content());
			pstmt.setInt(4, review.getP_no()); 
			pstmt.setDouble(5, review.getRv_grade());
			int result = pstmt.executeUpdate();
			
			return result;
		} finally {
			
			con.close();
		}
		
	}
	/*
	 * 리뷰 답글 (관리자만 가능)
	 * */
	public int createReply(Review review) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			// 댓글을 작성할 대상글(원글)의 정보를 조회
			Review temp = this.findReview(review.getRv_no());

			// 영향을 받는 기존 글들의 논리적인 순서 번호 변경
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ReviewSQL.create_Reply_Update);
			pstmt.setInt(1, temp.getRv_step());// step 번호
			pstmt.setInt(2, temp.getRv_groupno());// group 번호
			pstmt.executeUpdate();
			pstmt.close();

			// 댓글 삽입
			pstmt = con.prepareStatement(ReviewSQL.create_Reply_Insert);
			pstmt.setInt(1, temp.getP_no());// 상품번호
			pstmt.setString(2, review.getRv_title());// 제목
			pstmt.setString(3, review.getRv_writer());// 작성자
			pstmt.setString(4, review.getRv_content());// 내용
			pstmt.setInt(5, temp.getRv_groupno());// group no
			pstmt.setInt(6, temp.getRv_step() + 1);// step
			pstmt.setInt(7, temp.getRv_depth() + 1);// depth
			

			count = pstmt.executeUpdate();
	
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (con != null)
					con.close();
			} catch (Exception ex) {
			}
		}
		return count;

	}
	
	/*
	 * 리뷰 리스트 반환(게시물시작번호,게시물끝번호)
	 */
	public ArrayList<Review> findReviewList(int start, int last, int p_no) throws Exception{
		System.out.println("" + start + " ~ " + last);
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Review> reviewList = new ArrayList<Review>();

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ReviewSQL.find_Review_List);
			pstmt.setInt(1, p_no);
			pstmt.setInt(2, start);
			pstmt.setInt(3, last);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Review review = new Review();
				review.setRv_no(rs.getInt(2));
				review.setRv_title(rs.getString(3));
				review.setRv_grade(rs.getDouble(4));
				review.setRv_writer(rs.getString(5));
				review.setRv_date(rs.getDate(6));
				review.setRv_readcount(rs.getInt(7));
				review.setRv_groupno(rs.getInt(8));
				review.setRv_step(rs.getInt(9));
				review.setRv_depth(rs.getInt(10));
				

				reviewList.add(review);
			}
		} finally {
			
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (Exception ex) {
				}
		}
		return reviewList;
	}

	
	/*
	 * 리뷰 답글 게시물 존재여부 확인
	 */
	public boolean countReplay(Review review) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Boolean isExist = false;
		int cnt = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ReviewSQL.countReplay);
			pstmt.setInt(1, review.getRv_groupno());
			pstmt.setInt(2, review.getRv_depth());
			pstmt.setInt(3, review.getRv_step());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}
			if (cnt > 1) {
				isExist = true;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (Exception ex) {
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (con != null)
					con.close();
			} catch (Exception ex) {
			}
		}
		return isExist;

	}

	/*
	 * 리뷰 삭제
	 */
	public int remove(int rv_no) throws Exception{

		Connection con = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ReviewSQL.remove_Review);
			pstmt.setInt(1, rv_no);
			count = pstmt.executeUpdate();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (con != null)
					con.close();;
			} catch (Exception ex) {
			}
		}
		return count;

	}

	/*
	 * 리뷰 수정
	 */
	public int update(Review review) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ReviewSQL.update_Review);
			pstmt.setString(1, review.getRv_title());
			pstmt.setString(2, review.getRv_content());
			pstmt.setDouble(3, review.getRv_grade());
			pstmt.setInt(4, review.getRv_no());
			count = pstmt.executeUpdate();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (con != null)
					con.close();;
			} catch (Exception ex) {
			}
		}
		return count;
	}
	
	/*
	 * 답글 수정
	 */
	public int updateReply(Review review) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ReviewSQL.update_Reply);
			pstmt.setString(1, review.getRv_title());
			pstmt.setString(2, review.getRv_content());
			pstmt.setInt(3, review.getRv_no());
			count = pstmt.executeUpdate();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (con != null)
					con.close();;
			} catch (Exception ex) {
			}
		}
		return count;
	}
	
	/*
	 * 리뷰 번호에 해당하는 리뷰 정보 반환
	 */
	public Review findReview(int rv_no) throws Exception {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Review review = null;

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ReviewSQL.find_Review_Data);
			pstmt.setInt(1, rv_no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				review = new Review();
				review.setRv_no(rs.getInt(1));
				review.setRv_title(rs.getString(2));
				review.setRv_writer(rs.getString(3));
				review.setRv_content(rs.getString(4));
				review.setP_no(rs.getInt(5));
				review.setRv_grade(rs.getDouble(6));
				review.setRv_date(rs.getDate(7));
				review.setRv_readcount(rs.getInt(8));
				review.setRv_groupno(rs.getInt(9));
				review.setRv_step(rs.getInt(10));
				review.setRv_depth(rs.getInt(11));
			}
		}finally {
			try {
				if (rs != null)
					rs.close();
			} catch (Exception ex) {
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (con != null)
					con.close();
			} catch (Exception ex) {
			}
		}
		return review;
	
}
	/*
	 * 리뷰 조회수를 1 증가.
	 */
	public void increaseReadCount(int rv_no) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ReviewSQL.increase_Read_Count);
			pstmt.setInt(1, rv_no);
			pstmt.executeUpdate();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (con != null)
					con.close();
			} catch (Exception ex) {
			}
		}
	}
	/*
	 * 조회수 얻기
	 */
	public int getReadCount(int rv_no) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ReviewSQL.get_Read_Count);
			pstmt.setInt(1,rv_no);
			rs = pstmt.executeQuery();
			if (rs.next())
				count = rs.getInt(1);

		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (Exception ex) {
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (con != null)
					con.close();
			} catch (Exception ex) {
			}
		}
		return count;
	}

	/*
	 * 상품에 대한 리뷰 총 건수 조회
	 */
	public int getCount(int p_no) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ReviewSQL.get_Count);
			pstmt.setInt(1,p_no);
			rs = pstmt.executeQuery();
			if (rs.next())
				count = rs.getInt(1);

		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (Exception ex) {
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (con != null)
					con.close();
			} catch (Exception ex) {
			}
		}
		return count;
	}
	

}

