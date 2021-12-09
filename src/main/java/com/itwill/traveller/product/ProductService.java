package com.itwill.traveller.product;

import java.util.ArrayList;

import com.itwill.traveller.faq.Faq;

public class ProductService {
	private ProductDao productDao;
	
	public ProductService() throws Exception {
		productDao = new ProductDao();
	}
	
	/*
	 *  Product selectAll 
	 */
	public ArrayList<Product> getProductsList() throws Exception{
		return  productDao.getProductsList();
		
	}
	
	/*
	 * Product select_no
	 */
	public Product getProduct(int p_no) throws Exception{
		return productDao.getProduct(p_no);
		
		
	}
	
	/*
	 * Product Select category
	 */
	public ArrayList<Product> getCategoryProduct(String category) throws Exception{
		return productDao.getCategoryProduct(category);
	}
	
	/*
	 * Product Order Grade
	 */
	public ArrayList<Product> getOrderGrade() throws Exception{
		return productDao.getOrderGrade();
	}
	
	/*
	 * Product Order Category
	 */
	public ArrayList<Product> getOrderCategory(String category) throws Exception{
		return productDao.getOrderCategory(category);
	}
	
	/*
	 * Product insert
	 */
	public int insertProduct(Product product) throws Exception{
		return productDao.insertProduct(product);
	}
	
	/*
	 * Product update
	 */
	public int updateProduct(Product product) throws Exception{
		return productDao.updateProduct(product);
	}
	
	/*
	 * Product Delete
	 */
	public int deleteProduct(int p_no) throws Exception{
		return productDao.deleteProduct(p_no);
	}
	
	/*
	 * 페이징 리스트
	 */
	public ArrayList<Product> getList(int startRow, int endRow) throws Exception {
		return productDao.getList(startRow, endRow);
	}
	
	/*
	 * 레코드 수
	 */
	public int getCount() throws Exception {
		return productDao.getCount();
	}
	
}
