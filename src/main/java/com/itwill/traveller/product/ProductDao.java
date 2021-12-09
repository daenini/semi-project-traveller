package com.itwill.traveller.product;

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


public class ProductDao {
	private DataSource dataSource;
	public ProductDao() throws Exception{
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
	
	// 상품 전체 리스트 출력
	
	public ArrayList<Product> getProductsList() throws Exception{
		Connection con = null; //db 연결
		PreparedStatement pstmt = null; // sql문 전송
		ResultSet rs = null; // pstmt결과값 저장
		ArrayList<Product> productList = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ProductSQL.P_SELECT_ALL);
			rs = pstmt.executeQuery();
			productList = new ArrayList<Product>();
			Product product = null;
			while (rs.next()) {
				product = new Product();
				product.setP_no(rs.getInt("p_no"));
				product.setP_name(rs.getString("p_name"));
				product.setP_price(rs.getInt("p_price"));
				product.setP_date(rs.getDate("p_date"));
				product.setP_qty(rs.getInt("p_qty"));
				product.setP_category(rs.getString("p_category"));
				product.setP_image_path(rs.getString("p_image_path"));
				product.setP_detail(rs.getString("p_detail"));
				product.setP_grade(rs.getDouble("p_grade"));
				productList.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(con != null)
				con.close();
		}
		return productList;
		
	}
	
	// 제품 번호로 찾기
	
	public Product getProduct(int p_no) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Product product = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ProductSQL.P_SELECT_NO);
			pstmt.setInt(1, p_no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				product = new Product();
				product.setP_no(rs.getInt("p_no"));
				product.setP_name(rs.getString("p_name"));
				product.setP_price(rs.getInt("p_price"));
				product.setP_date(rs.getDate("p_date"));
				product.setP_qty(rs.getInt("p_qty"));
				product.setP_category(rs.getString("p_category"));
				product.setP_image_path(rs.getString("p_image_path"));
				product.setP_detail(rs.getString("p_detail"));
				product.setP_grade(rs.getDouble("p_grade"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(con != null)
				con.close();
		}
		return product;
	}
	
	// 상품 카테고리 별 찾기
	public ArrayList<Product> getCategoryProduct(String category) throws Exception{
		Connection con = null; 
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		ArrayList<Product> productList = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ProductSQL.P_SELECT_CATEGORY);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			productList = new ArrayList<Product>();
			Product product = null;
			while (rs.next()) {
				product = new Product();
				product.setP_no(rs.getInt("p_no"));
				product.setP_name(rs.getString("p_name"));
				product.setP_price(rs.getInt("p_price"));
				product.setP_date(rs.getDate("p_date"));
				product.setP_qty(rs.getInt("p_qty"));
				product.setP_category(rs.getString("p_category"));
				product.setP_image_path(rs.getString("p_image_path"));
				product.setP_detail(rs.getString("p_detail"));
				product.setP_grade(rs.getDouble("p_grade"));
				productList.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(con != null)
				con.close();
		}
		return productList;
		
	} 
	
	// 전체 상품 평점 순 정렬
	
	public ArrayList<Product> getOrderGrade() throws Exception{
		Connection con = null; 
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		ArrayList<Product> productList = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ProductSQL.P_ORDER_GRADE);
			rs = pstmt.executeQuery();
			productList = new ArrayList<Product>();
			Product product = null;
			while (rs.next()) {
				product = new Product();
				product.setP_no(rs.getInt("p_no"));
				product.setP_name(rs.getString("p_name"));
				product.setP_price(rs.getInt("p_price"));
				product.setP_date(rs.getDate("p_date"));
				product.setP_qty(rs.getInt("p_qty"));
				product.setP_category(rs.getString("p_category"));
				product.setP_image_path(rs.getString("p_image_path"));
				product.setP_detail(rs.getString("p_detail"));
				product.setP_grade(rs.getDouble("p_grade"));
				productList.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(con != null)
				con.close();
		}
		return productList;
		
	}  
	
	//카테고리별 평점 순 정렬
	public ArrayList<Product> getOrderCategory(String category) throws Exception{
		Connection con = null; 
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		ArrayList<Product> productList = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ProductSQL.P_ORDER_CATEGORY);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			productList = new ArrayList<Product>();
			Product product = null;
			while (rs.next()) {
				product = new Product();
				product.setP_no(rs.getInt("p_no"));
				product.setP_name(rs.getString("p_name"));
				product.setP_price(rs.getInt("p_price"));
				product.setP_date(rs.getDate("p_date"));
				product.setP_qty(rs.getInt("p_qty"));
				product.setP_category(rs.getString("p_category"));
				product.setP_image_path(rs.getString("p_image_path"));
				product.setP_detail(rs.getString("p_detail"));
				product.setP_grade(rs.getDouble("p_grade"));
				productList.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(con != null)
				con.close();
		}
		return productList;
		
	}
	
	
	// 제품 insert
	
	public int insertProduct(Product product) throws Exception{
		int insetRowCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
		con = dataSource.getConnection();
		pstmt = con.prepareStatement(ProductSQL.P_INSERT);
		pstmt.setString(1, product.getP_name());
		pstmt.setInt(2, product.getP_price());
		pstmt.setInt(3, product.getP_qty());
		pstmt.setString(4, product.getP_category());
		pstmt.setString(5, product.getP_image_path());
		pstmt.setString(6, product.getP_detail());
		insetRowCount = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null)
				pstmt.close();
			if(con != null)
				con.close();	
		}
		return insetRowCount;
	}
	
	// 제품 update
	public int updateProduct(Product product) throws Exception{
		int updateRC = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
		con = dataSource.getConnection();
		pstmt = con.prepareStatement(ProductSQL.P_UPDATE);
		pstmt.setString(1, product.getP_name());
		pstmt.setInt(2, product.getP_price());
		pstmt.setInt(3, product.getP_qty());
		pstmt.setString(4, product.getP_category());
		pstmt.setString(5, product.getP_image_path());
		pstmt.setString(6, product.getP_detail());
		pstmt.setDouble(7, product.getP_grade());
		pstmt.setInt(8, product.getP_no());
		updateRC = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null)
				pstmt.close();
			if(con != null)
				con.close();	
		}
		return updateRC;
		
	}
	
	// 제품 delete
	public int deleteProduct(int p_no) throws Exception{
		int deleteRC = 0;
		Connection con = null;
		PreparedStatement pstmt =  null;
		try {
			
			con= dataSource.getConnection();
			pstmt = con.prepareStatement(ProductSQL.P_DELETE);
			pstmt.setInt(1, p_no);
			deleteRC = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null)
				pstmt.close();
			if(con != null)
				con.close();	
		}
		return deleteRC;
		
	}
	
	// 리스트 페이지에 보여줄 로직(페이징 처리)
	public ArrayList<Product> getList(int startRow, int endRow) throws Exception{
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Product> productList = new ArrayList<Product>();
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ProductSQL.P_PAGE);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {;
		    productList.add(new Product(rs.getInt("p_no"),
		    							rs.getString("p_name"),
		    							rs.getInt("p_price"),
		    							rs.getDate("p_date"),
		    							rs.getInt("p_qty"),
		    							rs.getString("p_category"),
		    							rs.getString("p_image_path"),
		    							rs.getString("p_detail"),
		    							rs.getDouble("p_grade")));
}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(con != null)
				con.close();
	}
		
		return productList;
	}
	
	// 총 레코드 수 구하는 로직
	public int getCount() throws Exception{
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt =  null;
		ResultSet rs = null;
		try {
			con= dataSource.getConnection();
			pstmt = con.prepareStatement(ProductSQL.P_COUNT_PAGE);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt("num");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(con != null)
				con.close();	
		}
		return count;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
