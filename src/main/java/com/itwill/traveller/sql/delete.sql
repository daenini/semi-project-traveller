/*member delete(on delete cascade)*/
delete member where m_id = 'aaa';

/*product delete*/

delete product where p_no ='19';

/*cart delete*/
--상품 1개 삭제
delete cart where c_no = 1;
--상품 전체 삭제
delete cart where m_id = 'aaa';

/*reservation delete(on delete cascade)*/
--예약 목록 1개 삭제(한 번에 2개 예약 시 예약상품목록 2개도 삭제됨)
delete reservation where r_no = 1;
--1명의 회원 예약 목록 전부 삭제(예약상품목록도 전부 삭제)
delete reservation where m_id = 'aaa';

/*faq delete*/
--faq 자주찾는질문 삭제(관리자만 접근가능)
delete faq where f_no = 1;

/*qna delete*/
--상품문의 삭제
delete qna where q_no = 1;

/*review delete*/
--리뷰 삭제
delete review where rv_no = 1;

--select * from review;
--rollback;