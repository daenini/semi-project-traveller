/*member update*/
--개인정보 수정(생년월일 변경X)
update member set m_pass = '1234', m_name = '백상열2', m_email = 'sangyel2@gmail.com', m_phone = '01012345678' where m_id = 'bbb';

/*cart update*/
--장바구니 상품 1개 수량 변경(+1)
update cart set c_qty = c_qty + 1 where p_no = 1 and m_id = 'aaa';
--장바구니 상품 1개 수량 변경(-1)
update cart set c_qty = c_qty - 1 where p_no = 1 and m_id = 'aaa';

/*product update*/
--상품 정보수정(관리자만 접근가능)
update product set p_name = '서귀포 패키지2', p_price = 1000000, p_qty = 15, p_category = '제주도2', p_image_path = 'seogwipo2.jpg', p_detail = '서귀포2 여행입니다.', p_grade = 3.4 where p_no = 1;

/*faq update*/
--faq 자주찾는질문 수정(관리자만 접근가능)
update faq set f_question = '비밀번호 찾는 방법?', f_answer = '저도 잘 모르겠네요.' where f_no = 1;

/*qna update*/
--상품문의 수정
update qna set q_title = '질문변경', q_content = '내용변경', q_category = '상품문의' where q_no = 1;

/*review update*/
update review set rv_title = '리뷰제목변경', rv_content = '리뷰내용변경', rv_grade = 4 where rv_no = 1;


select * from review;

rollback;