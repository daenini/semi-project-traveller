package com.itwill.traveller.cart;

import java.util.ArrayList;

public class CartService {
	
	private CartDao cartDao;
	
	public CartService() throws Exception {
		cartDao = new CartDao();
	}
	
	//카트에 해당 상품이 존재한다면 수량만 추가 그렇지 않다면 카트에 새롭게 추가
	public int insertCart(int c_qty, int p_no, String m_id) throws Exception {
		
		if(cartDao.isExistProduct(m_id, p_no)) {
			
			return cartDao.updateQty(c_qty, p_no, m_id);
			
		} else {
			
			return cartDao.insertCart(c_qty, p_no, m_id);
			
		}
		
	}
	
	//회원 1명 장바구니 목록 
	public ArrayList<Cart> selectById(String m_id) throws Exception {
		return cartDao.selectById(m_id);
	}
	
	//장바구니 전체 삭제(FK(m_id) 받아서 삭제)
	public int deleteAll(String m_id) throws Exception {
		return cartDao.deleteAll(m_id);
	}
	
	//장바구니 물품 1개 삭제(PK(c_no) 받아서 삭제)
	//public static final String DELETE_NO = "delete cart where c_no = ? ";
	public int deleteByPno(int c_no) throws Exception {
		return cartDao.deleteByPno(c_no);
	}
	
	//회원 1명 장바구니 상품 갯수
	//public static final String SELECT_COUNT = "select count(*) p_cnt from cart where m_id = ?";
	public int productCount(String m_id) throws Exception {
		return cartDao.productCount(m_id);
	}
	
	//장바구니 수량 변경
	//public static final String UPDATE_QTY = "update cart set c_qty = c_qty + ? where p_no = ? and m_id = ?";
	public int updateQty(int c_qty, int c_no, String m_id) throws Exception {
		return cartDao.updateQty(c_qty, c_no, m_id);
	}
	
	//장바구니 수량 변경(number change)
	public int updateNumberQty(int c_qty, int c_no) throws Exception{
		return cartDao.updateNumberQty(c_qty, c_no);
	}
	
	//장바구니 상품 1개 객체 얻기(c_no(PK))
	public Cart getProductByCno(int c_no) throws Exception{
		return cartDao.getProductByCno(c_no);
	}
	

}
