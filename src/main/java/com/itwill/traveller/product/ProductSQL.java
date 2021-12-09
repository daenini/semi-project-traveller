package com.itwill.traveller.product;

public class ProductSQL {
	// 상품 1개 출력
	public static final String P_SELECT_NO = "select * from product where p_no = ?";
	// 상품 전체 리스트 출력
	public static final String P_SELECT_ALL = "select * from product";
	// 상품 카테고리 별 찾기
	public static final String P_SELECT_CATEGORY = "select * from product p where p.p_category= ?";
	// 전체 상품 평점 순 정렬
	public static final String P_ORDER_GRADE = "select * from product order by p_grade desc";
	// 카테고리별 평점 순 정렬
	public static final String P_ORDER_CATEGORY = "select * from product p where p.p_category = ? order by p_grade desc";
	// 상품 등록
	public static final String P_INSERT = "insert into product values(product_p_no_seq.nextval,?,?,sysdate,?,?,?,?,default)";
	// 상품 업데이트
	public static final String P_UPDATE = "update product set p_name = ?, p_price = ?, p_qty = ?, p_category = ?, p_image_path = ?, p_detail = ?, p_grade = ? where p_no = ?";
	// 상품 삭제
	public static final String P_DELETE = "delete product where p_no =?";
	
	//페이징 SQL
	public static final String P_PAGE = "select * from (select rownum rn, p_no, p_name, p_price, p_date, p_qty, p_category, p_image_path, p_detail, p_grade from (select * from product order by p_no desc)) where rn between ? and ?";
	// 총 레코드 수 구하는 SQL
	public static final String P_COUNT_PAGE = "select count(*) num from product";
	
}
