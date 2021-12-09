package com.itwill.traveller.reservation;

public class ReservationSQL {
	public static final String SELECT="select * from (select * from reservation_item where ri_no = ?) r join product p on r.p_no=p.p_no";
	public static final String INSERT="insert into reservation(r_no, r_desc, r_date, r_method, r_price, m_id) values(reservation_r_no_seq.nextval, ?, sysdate, ?, ?, ?)";
	public static final String INSERT_ITEM="insert into reservation_item(ri_no, ri_qty, r_no, p_no) values(reservation_item_ri_no_seq.nextval, ?, reservation_r_no_seq.currval, ?)";
	public static final String VIEWALL="select * from reservation where m_id=? order by r_no desc";
	public static final String VIEW="select * from reservation r join reservation_item ri on ri.r_no=r.r_no join product p on ri.p_no=p.p_no where r.r_no=? and r.m_id=?";
}