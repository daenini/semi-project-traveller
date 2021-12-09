package com.itwill.traveller.product;

import java.sql.Date;

/*
이름           널?       유형            
------------ -------- ------------- 
P_NO         NOT NULL NUMBER(10)    
P_NAME                VARCHAR2(50)  
P_PRICE               NUMBER(10)    
P_DATE                DATE          
P_QTY                 NUMBER(10)    
P_CATEGORY            VARCHAR2(20)  
P_IMAGE_PATH          VARCHAR2(100) 
P_DETAIL              VARCHAR2(500) 
P_GRADE               FLOAT(126)    
*/
public class Product {
	private int p_no;
	private String p_name;
	private int p_price;
	private Date p_date; // 투어 체험 날짜
	private int p_qty;
	private String p_category;
	private String p_image_path;
	private String p_detail;
	private double p_grade; // 상품 평점
	
	public Product() {
		
	}

	public Product(int p_no, String p_name, int p_price, Date p_date, int p_qty, String p_category, String p_image_path,
			String p_detail, double p_grade) {
		super();
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_date = p_date;
		this.p_qty = p_qty;
		this.p_category = p_category;
		this.p_image_path = p_image_path;
		this.p_detail = p_detail;
		this.p_grade = p_grade;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public Date getP_date() {
		return p_date;
	}

	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}

	public int getP_qty() {
		return p_qty;
	}

	public void setP_qty(int p_qty) {
		this.p_qty = p_qty;
	}

	public String getP_category() {
		return p_category;
	}

	public void setP_category(String p_category) {
		this.p_category = p_category;
	}

	public String getP_image_path() {
		return p_image_path;
	}

	public void setP_image_path(String p_image_path) {
		this.p_image_path = p_image_path;
	}

	public String getP_detail() {
		return p_detail;
	}

	public void setP_detail(String p_detail) {
		this.p_detail = p_detail;
	}

	public double getP_grade() {
		return p_grade;
	}

	public void setP_grade(double p_grade) {
		this.p_grade = p_grade;
	}

	@Override
	public String toString() {
		return "Product [p_no=" + p_no + ", p_name=" + p_name + ", p_price=" + p_price + ", p_date=" + p_date
				+ ", p_qty=" + p_qty + ", p_category=" + p_category + ", p_image_path=" + p_image_path + ", p_detail="
				+ p_detail + ", p_grade=" + p_grade + "]";
	}
	
	
	

}
