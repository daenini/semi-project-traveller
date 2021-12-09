package com.itwill.traveller.faq;

import com.itwill.traveller.member.Member;

/*
 이름         널?       유형            
---------- -------- ------------- 
F_NO       NOT NULL NUMBER(10)    
F_QUESTION          VARCHAR2(100) 
F_ANSWER            VARCHAR2(500) 
M_ID                VARCHAR2(12)  
*/
public class Faq {
	private int f_no;
	private String f_question;
	private String f_answer;
	private Member member;
	
	public Faq() {
		
	}
	
	public Faq(int f_no, String f_question, String f_answer, Member member) {
		super();
		this.f_no = f_no;
		this.f_question = f_question;
		this.f_answer = f_answer;
		this.member = member;
	}

	public int getF_no() {
		return f_no;
	}

	public void setF_no(int f_no) {
		this.f_no = f_no;
	}

	public String getF_question() {
		return f_question;
	}

	public void setF_question(String f_question) {
		this.f_question = f_question;
	}

	public String getF_answer() {
		return f_answer;
	}

	public void setF_answer(String f_answer) {
		this.f_answer = f_answer;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	@Override
	public String toString() {
		return "Faq [f_no=" + f_no + ", f_question=" + f_question + ", f_answer=" + f_answer + ", member=" + member
				+ "]";
	}
	
	

}
