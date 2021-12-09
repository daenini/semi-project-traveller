package com.itwill.traveller.faq;

public class FaqSQL {
	
	//FAQ 등록
	public static final String INSERT_FAQ = "insert into faq(f_no, f_question, f_answer, m_id) values(faq_f_no_seq.nextval, ?, ?, ?)";
	//FAQ 수정
	public static final String UPDATE_SQL = "update faq set f_question = ?, f_answer = ? where f_no = ?";
	//FAQ 삭제
	public static final String DELETE_SQL = "delete faq where f_no = ?";
	//FAQ 리스트
	public static final String SELECT_ALL = "select * from faq f join member m on f.m_id = m.m_id";
	//FAQ 1개정보
	public static final String SELECT_BY_NO = "select * from faq f join member m on f.m_id = m.m_id where f.f_no = ?";
	//FAQ 페이징처리(rownum, 인라인뷰)
	public static final String SELECT_PAGE = "select * from (select rownum rn, f_no, f_question, f_answer, m_id from (select * from faq order by f_no desc)) where rn between ? and ?";
	//FAQ 총 게시물 수
	public static final String SELECT_COUNT = "select count(*) cnt from faq";
	
}
