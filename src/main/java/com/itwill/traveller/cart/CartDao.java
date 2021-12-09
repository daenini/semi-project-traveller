package com.itwill.traveller.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;

import com.itwill.traveller.member.Member;
import com.itwill.traveller.product.Product;



public class CartDao {
	
	private DataSource dataSource;
	
	public CartDao() throws Exception{
		Properties properties = new Properties();
		properties.load(this.getClass().getResourceAsStream("/com/itwill/traveller/jdbc.properties"));
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClass"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("user"));
		basicDataSource.setPassword(properties.getProperty("password"));
		this.dataSource = basicDataSource;
	}
	

	//회원 1명 장바구니 추가
	//public static final String INSERT_CART = "insert into cart(c_no, c_qty, p_no, m_id) values(cart_c_no_seq.nextval, ?, ?, ?)";
	public int insertCart(int c_qty, int p_no, String m_id) throws Exception {
		int insertRowCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(CartSQL.INSERT_CART);
			pstmt.setInt(1, c_qty);
			pstmt.setInt(2, p_no);
			pstmt.setString(3, m_id);
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
	
	//회원 1명 장바구니 목록
	//public static final String SELECT_BY_ID = "select * from cart c join product p on c.p_no = p.p_no where c.m_id = ?"; 
	public ArrayList<Cart> selectById(String m_id) throws Exception {
		ArrayList<Cart> cartList = new ArrayList<Cart>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(CartSQL.SELECT_BY_ID);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				cartList.add(new Cart(rs.getInt("c_no"),
									  rs.getInt("c_qty"),
									  new Product(rs.getInt("p_no"),
											  	  rs.getString("p_name"),
											  	  rs.getInt("p_price"),
											  	  rs.getDate("p_date"),
											  	  rs.getInt("p_qty"),
											  	  rs.getString("p_category"),
											  	  rs.getString("p_image_path"),
											  	  null,
											  	  0),
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
		
		return cartList;
		
	}
	
	//장바구니 전체 삭제(FK(m_id) 받아서 삭제)
	//public static final String DELETE_ALL = "delete cart where m_id = ?";
	public int deleteAll(String m_id) throws Exception {
		int deleteRowCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(CartSQL.DELETE_ALL);
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
	
	//장바구니 물품 1개 삭제(PK(c_no) 받아서 삭제)
	//public static final String DELETE_NO = "delete cart where c_no = ?";
	public int deleteByPno(int c_no) throws Exception{
		int deleteRowCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(CartSQL.DELETE_NO);
			pstmt.setInt(1, c_no);
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
	
	//장바구니 수량 변경(insert할때)
	//public static final String UPDATE_QTY = "update cart set c_qty = c_qty + ? where p_no = ? and m_id = ?";
	public int updateQty(int c_qty, int c_no, String m_id) throws Exception {
		int updateRowCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(CartSQL.UPDATE_QTY);
			pstmt.setInt(1, c_qty);
			pstmt.setInt(2, c_no);
			pstmt.setString(3, m_id);
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
	
	public int updateNumberQty(int c_qty, int c_no) throws Exception{
		int updateRowCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(CartSQL.UPDATE_NUMBER_QTY);
			pstmt.setInt(1, c_qty);
			pstmt.setInt(2, c_no);
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
	
	//회원 1명 장바구니 상품 갯수
	//public static final String SELECT_COUNT = "select count(*) p_cnt from cart where m_id = ?";
	public int productCount(String m_id) throws Exception {
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(CartSQL.SELECT_COUNT);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("p_cnt");
			}
			
		} finally {
			
			if(rs != null) {
				rs.close();
			}
			
			if(pstmt != null) {
				pstmt.close();
			}
			
			if(con != null) {
				pstmt.close();
			}
			
		}
		
		return count;
		
	}
	
	//회원 1명에 상품 1개 존재 여부
	//public static final String SELECT_COUNT_MEMBER = "select count(*) p_cnt from cart c join member m on c.m_id=m.m_id where m.m_id=? and c.p_no=?";
	public boolean isExistProduct(String m_id, int p_no) throws Exception {
		boolean isExist = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(CartSQL.SELECT_COUNT_MEMBER);
			pstmt.setString(1, m_id);
			pstmt.setInt(2, p_no);
			rs = pstmt.executeQuery();
			
			int count = 0;
			if(rs.next()) {
				count = rs.getInt("p_cnt");
			}
			
			if(count == 0) {
				isExist = false;
			} else {
				isExist = true;
			}
			
		} finally {
			
			if(rs != null) {
				rs.close();
			}
			
			if(pstmt != null) {
				pstmt.close();
			}
			
			if(con != null) {
				pstmt.close();
			}
			
		}
		
		return isExist;
		
	}
	
	//장바구니 상품 1개 객체 얻기(c_no(PK))
	public Cart getProductByCno(int c_no) throws Exception{
		Cart cart = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(CartSQL.SELECT_PRODUCT_BY_NO);
			pstmt.setInt(1, c_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cart = new Cart(rs.getInt("c_no"),
								rs.getInt("c_qty"),
								new Product(rs.getInt("p_no"),
											rs.getString("p_name"),
											rs.getInt("p_price"),
											rs.getDate("p_date"),
											rs.getInt("p_qty"),
											null,
											rs.getString("p_image_path"),
											null,
											0),
								new Member());
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
		
		return cart;
		
	}
	
	
	
	

}
