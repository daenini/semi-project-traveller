package com.itwill.traveller.qna;

public class QnaSQL {
	public static final String CATEGORY="select * from category where b_name = ?";
	public static final String INSERT="insert into $tableName(q_no,q_title,q_content,q_category,m_id,p_no) values($tableName_q_no_seq.nextval,?,?,?,?,?)";
	public static final String DELETE="delete from $tableName where q_no = ?";
	public static final String UPDATE="update $tableName set q_title=? ,q_content=? ,q_category=? where q_no = ?";
	public static final String SELECT_NO="select * from (select * from $tableName where q_no = ?) q join member m on q.m_id=m.m_id";
	public static final String SELECT_PAGE="select * from (select * from(select rownum rnum, a. * from(select * from $tableName order by q_no desc) a where rownum <= ?+10) where rnum > ?) q join member m on q.m_id=m.m_id order by rnum";
	public static final String SELECT_PAGE_SEARCH="select * from (select * from(select rownum rnum, a. * from $tableName a where q_title like ? order by q_no desc) where rnum between ? and ?)q join member m on q.m_id=m.m_id order by rnum desc";
	public static final String SELECT_PAGE_CATEGORY="select * from (select * from(select rownum rnum, a. * from $tableName a where q_category = ? order by q_no desc) where rnum between ? and ?)q join member m on q.m_id=m.m_id order by rnum desc";
	public static final String GET_COUNT="select count(*) from $tableName";
	
	// 테이블 이름은 -- > $tableName
}	