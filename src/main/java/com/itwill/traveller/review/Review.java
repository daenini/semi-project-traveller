package com.itwill.traveller.review;

import java.sql.Date;

import com.itwill.traveller.member.Member;
import com.itwill.traveller.product.Product;

/*
이름           널?       유형            
------------ -------- ------------- 
RV_NO                 NUMBER(10)    
RV_TITLE              VARCHAR2(100) 
RV_WRITER    NOT NULL VARCHAR2(20)  
RV_CONTENT            VARCHAR2(500) 
P_NO                  NUMBER(10)    
RV_GRADE              FLOAT(126)    
RV_DATE               DATE          
RV_READCOUNT          NUMBER        
RV_GROUPNO   NOT NULL NUMBER        
RV_STEP      NOT NULL NUMBER        
RV_DEPTH              NUMBER          
*/
public class Review {
	private int rv_no;
	private String rv_title;
	private String rv_writer;
	private String rv_content;
	private int p_no;
	private double rv_grade;
	private Date rv_date;
	private int rv_readcount;
	private int rv_groupno;
	private int rv_step;
	private int rv_depth;
	
	public Review() {
	}

	public Review(int rv_no, String rv_title, String rv_writer, String rv_content, int p_no, double rv_grade,
			Date rv_date, int rv_readcount, int rv_groupno, int rv_step, int rv_depth) {
		super();
		this.rv_no = rv_no;
		this.rv_title = rv_title;
		this.rv_writer = rv_writer;
		this.rv_content = rv_content;
		this.p_no = p_no;
		this.rv_grade = rv_grade;
		this.rv_date = rv_date;
		this.rv_readcount = rv_readcount;
		this.rv_groupno = rv_groupno;
		this.rv_step = rv_step;
		this.rv_depth = rv_depth;
	}

	public int getRv_no() {
		return rv_no;
	}

	public void setRv_no(int rv_no) {
		this.rv_no = rv_no;
	}

	public String getRv_title() {
		return rv_title;
	}

	public void setRv_title(String rv_title) {
		this.rv_title = rv_title;
	}

	public String getRv_writer() {
		return rv_writer;
	}

	public void setRv_writer(String rv_writer) {
		this.rv_writer = rv_writer;
	}

	public String getRv_content() {
		return rv_content;
	}

	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public double getRv_grade() {
		return rv_grade;
	}

	public void setRv_grade(double rv_grade) {
		this.rv_grade = rv_grade;
	}

	public Date getRv_date() {
		return rv_date;
	}

	public void setRv_date(Date rv_date) {
		this.rv_date = rv_date;
	}

	public int getRv_readcount() {
		return rv_readcount;
	}

	public void setRv_readcount(int rv_readcount) {
		this.rv_readcount = rv_readcount;
	}

	public int getRv_groupno() {
		return rv_groupno;
	}

	public void setRv_groupno(int rv_groupno) {
		this.rv_groupno = rv_groupno;
	}

	public int getRv_step() {
		return rv_step;
	}

	public void setRv_step(int rv_step) {
		this.rv_step = rv_step;
	}

	public int getRv_depth() {
		return rv_depth;
	}

	public void setRv_depth(int rv_depth) {
		this.rv_depth = rv_depth;
	}

	@Override
	public String toString() {
		return "Review [rv_no=" + rv_no + ", rv_title=" + rv_title + ", rv_writer=" + rv_writer + ", rv_content="
				+ rv_content + ", p_no=" + p_no + ", rv_grade=" + rv_grade + ", rv_date=" + rv_date
				+ ", rv_readcount=" + rv_readcount + ", rv_groupno=" + rv_groupno + ", rv_step=" + rv_step
				+ ", rv_depth=" + rv_depth + "]";
	}
		
}
