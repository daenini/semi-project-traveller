package com.itwill.traveller.review;

public class ReviewSQL {
	public static final String review_List_All = " select * from review r join member m on r.rv_writer = m.m_id join product p on p.p_no = r.p_no";
	public static final String product_Review_List = " SELECT * FROM (SELECT rownum idx, s.* FROM"
			+ " (select rv_no, rv_title, rv_grade, rv_writer, rv_date, rv_readcount, rv_groupno, rv_step, rv_depth from review WHERE p_no = ? ORDER BY rv_groupno DESC, rv_step ASC) s)";
	public static final String get_Product_Grade = "select round(avg(rv_grade),0) p_grade from review r group by r.p_no having r.p_no = ?";
	public static final String get_Count="SELECT COUNT(*) FROM review WHERE p_no = ?";
	public static final String SELECT_PAGE="SELECT * FROM (SELECT rownum idx, s.* FROM"
			+ "			( SELECT rv_no, p_no, rv_title, rv_grade, rv_writer, rv_date, rv_readcount, rv_groupno, rv_step, rv_depth FROM review WHERE p_no = ? ORDER BY rv_groupno DESC, rv_step ASC) s )"
			+ "			WHERE idx >= ? AND idx <= ?";
	public static final String create_Review = "insert into review(rv_no, rv_title, rv_writer, rv_content, p_no, rv_grade, rv_groupno, rv_step)" 
	+"values(review_rv_no_seq.nextval, ?, ?, ?, ?, ?,review_rv_no_seq.currval, 1)";
	public static final String create_Reply_Update = "UPDATE review SET rv_step = rv_step + 1  WHERE rv_step > ? AND rv_groupno = ?";
	public static final String create_Reply_Insert = "INSERT INTO review(rv_no, p_no, rv_title, rv_writer, rv_content, rv_groupno, rv_step, rv_depth)"
			+ "VALUES (review_rv_no_seq.nextVal, ?, ?, ?, ?, ?, ?, ?)";
	public static final String find_Review_List = "SELECT * FROM (SELECT rownum idx, s.* FROM"
			+ "( SELECT rv_no, rv_title, rv_grade, rv_writer, rv_date, rv_readcount, rv_groupno, rv_step, rv_depth FROM review WHERE p_no = ? ORDER BY rv_groupno DESC, rv_step ASC) s )"
			+ " WHERE idx >= ? AND idx <= ?";
	
	public static final String countReplay = "SELECT count(*) cnt FROM review WHERE rv_groupno = ? AND rv_depth >= ? AND rv_step >= ? ORDER BY rv_step, rv_depth ASC";
	public static final String remove_Review = "DELETE review WHERE rv_no = ?";
	public static final String update_Review = "UPDATE review SET rv_title = ?, rv_content = ?, rv_grade = ? WHERE rv_no = ?";
	public static final String update_Reply = "UPDATE review SET rv_title = ?, rv_content = ?  WHERE rv_no = ?";
	public static final String find_Review_Data = "SELECT rv_no, rv_title, rv_writer, rv_content, p_no, rv_grade, rv_date, rv_readcount, rv_groupno, rv_step, rv_depth FROM review WHERE rv_no = ?";
	public static final String increase_Read_Count = "UPDATE review SET rv_readcount = rv_readcount + 1 WHERE rv_no = ?";
	public static final String get_Read_Count = "SELECT rv_readcount FROM review WHERE rv_no = ?; ";



}
