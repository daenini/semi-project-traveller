package com.itwill.traveller.qna;
/*
 이름         널?       유형            
---------- -------- ------------- 
Q_NO       NOT NULL NUMBER(10)    
Q_TITLE             VARCHAR2(100) 
Q_CONTENT           VARCHAR2(500) 
Q_CATEGORY          VARCHAR2(100) 
Q_STATE             VARCHAR2(100) 
M_ID                VARCHAR2(12)  
P_NO                NUMBER(10)    
*/

import com.itwill.traveller.member.Member;
import com.itwill.traveller.product.Product;

public class Qna {
	private int q_no;
	private String q_title;
	private String q_content;
	private String q_category;
	private String q_state;
	private Member member;
	private Product product;
	
	public Qna() {
		
	}

	public Qna(int q_no, String q_title, String q_content, String q_category, String q_state, Member member,
			Product product) {
		super();
		this.q_no = q_no;
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_category = q_category;
		this.q_state = q_state;
		this.member = member;
		this.product = product;
	}

	public int getQ_no() {
		return q_no;
	}

	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}

	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public String getQ_category() {
		return q_category;
	}

	public void setQ_category(String q_category) {
		this.q_category = q_category;
	}

	public String getQ_state() {
		return q_state;
	}

	public void setQ_state(String q_state) {
		this.q_state = q_state;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Override
	public String toString() {
		return "Qna [q_no=" + q_no + ", q_title=" + q_title + ", q_content=" + q_content + ", q_category=" + q_category
				+ ", q_state=" + q_state + ", member=" + member + ", product=" + product + "]";
	}
	
	

}
