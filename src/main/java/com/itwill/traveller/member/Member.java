package com.itwill.traveller.member;
/*
이름      널?       유형           
------- -------- ------------ 
M_ID    NOT NULL VARCHAR2(12) 
M_PASS           VARCHAR2(12) 
M_NAME           VARCHAR2(15) 
M_EMAIL          VARCHAR2(50) 
M_BIRTH          VARCHAR2(6)  
M_PHONE          VARCHAR2(11) 
 */
public class Member {
	
	private String m_id;
	private String m_pass;
	private String m_name;
	private String m_email;
	private String m_birth;
	private String m_phone;
	
	public Member() {
		
	}

	public Member(String m_id, String m_pass, String m_name, String m_email, String m_birth, String m_phone) {
		super();
		this.m_id = m_id;
		this.m_pass = m_pass;
		this.m_name = m_name;
		this.m_email = m_email;
		this.m_birth = m_birth;
		this.m_phone = m_phone;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pass() {
		return m_pass;
	}

	public void setM_pass(String m_pass) {
		this.m_pass = m_pass;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_birth() {
		return m_birth;
	}

	public void setM_birth(String m_birth) {
		this.m_birth = m_birth;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	@Override
	public String toString() {
		return "Member [m_id=" + m_id + ", m_pass=" + m_pass + ", m_name=" + m_name + ", m_email=" + m_email
				+ ", m_birth=" + m_birth + ", m_phone=" + m_phone + "]";
	}
	
	

}
