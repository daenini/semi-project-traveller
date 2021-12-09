package com.itwill.traveller.reservation;

import java.sql.Date;
import java.util.ArrayList;

import com.itwill.traveller.member.Member;

/*
 이름       널?       유형           
-------- -------- ------------ 
R_NO     NOT NULL NUMBER(10)   
R_DATE            DATE         
R_METHOD          VARCHAR2(20) 
R_PRICE           NUMBER(10)   
M_ID              VARCHAR2(12) 
*/
public class Reservation {
	private int r_no;
	private String r_desc;
	private Date r_date;
	private String r_method;
	private int r_price;
	private String m_id;
	private ArrayList<ReservationItem> reservationItemList = new ArrayList<ReservationItem>();
	
	public Reservation() {
	}
	
	public Reservation(int r_no, String r_desc, Date r_date, String r_method, int r_price, String m_id) {
		super();
		this.r_no = r_no;
		this.r_desc = r_desc;
		this.r_date = r_date;
		this.r_method = r_method;
		this.r_price = r_price;
		this.m_id = m_id;
	}
	
	public Reservation(int r_no, String r_desc, Date r_date, String r_method, int r_price, String m_id,
			ArrayList<ReservationItem> reservationItemList) {
		super();
		this.r_no = r_no;
		this.r_desc = r_desc;
		this.r_date = r_date;
		this.r_method = r_method;
		this.r_price = r_price;
		this.m_id = m_id;
		this.reservationItemList = reservationItemList;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getR_desc() {
		return r_desc;
	}

	public void setR_desc(String r_desc) {
		this.r_desc = r_desc;
	}

	public Date getR_date() {
		return r_date;
	}

	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}

	public String getR_method() {
		return r_method;
	}

	public void setR_method(String r_method) {
		this.r_method = r_method;
	}

	public int getR_price() {
		return r_price;
	}

	public void setR_price(int r_price) {
		this.r_price = r_price;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public ArrayList<ReservationItem> getReservationItemList() {
		return reservationItemList;
	}

	public void setReservationItemList(ArrayList<ReservationItem> reservationItemList) {
		this.reservationItemList = reservationItemList;
	}

	@Override
	public String toString() {
		return "Reservation [r_no=" + r_no + ", r_desc=" + r_desc + ", r_date=" + r_date + ", r_method=" + r_method
				+ ", r_price=" + r_price + ", m_id=" + m_id + ", reservationItemList=" + reservationItemList + "]";
	}
	
	
	
	

}
