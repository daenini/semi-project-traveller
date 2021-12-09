package com.itwill.traveller.reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;

import com.itwill.traveller.faq.Faq;
import com.itwill.traveller.faq.FaqSQL;
import com.itwill.traveller.member.Member;
import com.itwill.traveller.product.Product;
import com.itwill.traveller.qna.Qna;



public class ReservationDao {
	private DataSource dataSource;
	public ReservationDao() throws Exception{
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
	
	public ArrayList<Reservation> viewAll(String sUserId) throws Exception {
		ArrayList<Reservation> reservation = new ArrayList<Reservation>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ReservationSQL.VIEWALL);
			pstmt.setString(1, sUserId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				reservation.add(new Reservation(rs.getInt("r_no"),
								rs.getString("r_desc"),
								rs.getDate("r_date"),
								rs.getString("r_method"),
								rs.getInt("r_price"),
								rs.getString("m_id")));
			}
				
		}finally {
			if (con != null) {
				con.close();
			}
		}
		
		return reservation;
	}
	
	public Reservation view(String sUserId, int r_no) throws Exception {
		Reservation reservation = new Reservation();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ReservationSQL.VIEW);
			pstmt.setInt(1, r_no);
			pstmt.setString(2, sUserId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				reservation = new Reservation(rs.getInt("r_no"),
						rs.getString("r_desc"),
						rs.getDate("r_date"),
						rs.getString("r_method"),
						rs.getInt("r_price"),
						rs.getString("m_id"));
				do {
					reservation.getReservationItemList().add(new ReservationItem(
							rs.getInt("ri_no"),
							rs.getInt("ri_qty"),
							rs.getInt("r_no"),
							new Product(rs.getInt("p_no"),
									rs.getString("p_name"),
									rs.getInt("p_price"),
									rs.getDate("p_date"),
									rs.getInt("p_qty"),
									rs.getString("p_category"),
									rs.getString("p_image_path"),
									rs.getString("p_detail"),
									rs.getDouble("p_grade"))));
				} while(rs.next());
					
				}
				
		}finally {
			if (con != null) {
				con.close();
			}
		}
		
		return reservation;
	}
	
	public int insertReservation(Reservation reservation) throws Exception {
		int insertRowCount = 0;
		Connection con=null;
		PreparedStatement pstmt1=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt1 = con.prepareStatement(ReservationSQL.INSERT);
			pstmt1.setString(1, reservation.getR_desc());
			pstmt1.setString(2, reservation.getR_method());
			pstmt1.setInt(3, reservation.getR_price());
			pstmt1.setString(4, reservation.getM_id());
			pstmt1.executeUpdate();
			
			pstmt2 = con.prepareStatement(ReservationSQL.INSERT_ITEM);
			for(ReservationItem reservationItem:reservation.getReservationItemList()) {
				pstmt2.setInt(1, reservationItem.getRi_qty());
				pstmt2.setInt(2, reservationItem.getProduct().getP_no());
				pstmt2.executeUpdate();
			}
			con.commit();
		}finally {
			if (con != null) {
				con.close();
			}
		}
		
		return insertRowCount;
	}
}
