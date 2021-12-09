package com.itwill.traveller.cart;

public class CartSQL {
	
	//회원 1명 장바구니 추가
	public static final String INSERT_CART = "insert into cart(c_no, c_qty, p_no, m_id) values(cart_c_no_seq.nextval, ?, ?, ?)";
	
	//회원 1명 장바구니 목록
	public static final String SELECT_BY_ID = "select * from cart c join product p on c.p_no = p.p_no where c.m_id = ?"; 
	
	//장바구니 전체 삭제(FK(m_id) 받아서 삭제)
	public static final String DELETE_ALL = "delete cart where m_id = ?";
	
	//장바구니 물품 1개 삭제((c_no) 받아서 삭제)
	public static final String DELETE_NO = "delete cart where c_no = ?";
	
	//장바구니 수량 변경(insert할때)
	public static final String UPDATE_QTY = "update cart set c_qty = c_qty + ? where c_no = ? and m_id = ?";
	
	//장바구니 수량 변경(+,-할때)
	public static final String UPDATE_NUMBER_QTY = "update cart set c_qty = ? where c_no = ?";
	
	//회원 1명 장바구니 상품 갯수
	public static final String SELECT_COUNT = "select count(*) p_cnt from cart where m_id = ?";
	
	//회원 1명에 상품 1개 존재여부(1 = 존재, 0 = 없음)
	public static final String SELECT_COUNT_MEMBER = "select count(*) p_cnt from cart c join member m on c.m_id=m.m_id where m.m_id=? and c.p_no=?";
	
	//장바구니 상품 1개 출력
	public static final String SELECT_PRODUCT_BY_NO = "select * from cart c join product p on c.p_no = p.p_no where c_no = ?";

}
