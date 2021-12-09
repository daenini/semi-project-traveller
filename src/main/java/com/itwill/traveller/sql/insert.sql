--member insert (회원 추가)
insert into member(m_id, m_pass, m_name, m_email, m_birth, m_phone) values('admin', 'admin', '관리자', 'tour@site.com', 'X', '0211112222');
insert into member(m_id, m_pass, m_name, m_email, m_birth, m_phone) values('aaa', '1111', '강민경', 'alsrud@gmail.com', '970101', '01099987778');
insert into member(m_id, m_pass, m_name, m_email, m_birth, m_phone) values('bbb', '2222', '백상열', 'tkdduf@gmail.com', '940202', '01072256875');
insert into member(m_id, m_pass, m_name, m_email, m_birth, m_phone) values('ccc', '3333', '김대현', 'eogus@gmail.com', '980303', '01012665487');
insert into member(m_id, m_pass, m_name, m_email, m_birth, m_phone) values('ddd', '4444', '서건', 'tjrjs@gmail.com', '970404', '01095515243');
insert into member(m_id, m_pass, m_name, m_email, m_birth, m_phone) values('eee', '5555', '최민규', 'alsrb@gmail.com', '920505', '01068751135');
insert into member(m_id, m_pass, m_name, m_email, m_birth, m_phone) values('fff', '6666', '한상길', 'tkdrlf@gmail.com', '980606', '01025487521');


--product insert (상품 등록)  - 관리자ID만 가능
insert into product(p_no, p_name, p_price, p_date, p_qty, p_category, p_image_path, p_detail, p_grade)
values(product_p_no_seq.nextval, '서귀포 패키지', 150000, sysdate, 10, '제주도', 'https://image.hanatour.com/usr/cms/resize/800_0/2020/11/05/10000/2c31dc85-d397-48a1-90ff-01b7016c1072.JPG', '서귀포 여행입니다.', default);
insert into product(p_no, p_name, p_price, p_date, p_qty, p_category, p_image_path, p_detail, p_grade)
values(product_p_no_seq.nextval, '성산일출봉 패키지', 100000, sysdate, 15, '제주도', 'https://img.modetour.com//eagle/photoimg/P_Img/837/6363858799280443319.JPG', '성산일출봉 위주 여행입니다.', default);
insert into product(p_no, p_name, p_price, p_date, p_qty, p_category, p_image_path, p_detail, p_grade)
values(product_p_no_seq.nextval, '제주도 자유여행 패키지', 80000, sysdate, 10, '제주도', 'https://static.hanatour.com/product/2020/11/23/04429i0a9o/default.jpg', '제주 자유 여행입니다.', default);
insert into product(p_no, p_name, p_price, p_date, p_qty, p_category, p_image_path, p_detail, p_grade)
values(product_p_no_seq.nextval, '남산타워 패키지', 50000, sysdate, 20, '서울', 'https://imgstower.ytn.co.kr/gallery/2019/201910161325288889.jpg', '남산타워 여행입니다.', default);
insert into product(p_no, p_name, p_price, p_date, p_qty, p_category, p_image_path, p_detail, p_grade)
values(product_p_no_seq.nextval, '롯데월드 패키지', 23000, sysdate, 20, '서울', 'https://static.hanatour.com/product/2021/07/27/0834ljf7ck/default.png', '[3%할인쿠폰][서울] 롯데월드 패키지(호텔+티켓)

♥ 설레는 봄, 롯데월드 패키지 할인해 봄♥


*** 롯데월드 자유이용권을 구매했더니 호텔이 따라오네?


여기에 +플러스! 3% 쿠폰할인까지!', default);
insert into product(p_no, p_name, p_price, p_date, p_qty, p_category, p_image_path, p_detail, p_grade)
values(product_p_no_seq.nextval, '양평 패러글라이딩', 111000, sysdate, 20, '경기', 'https://static.hanatour.com/product/2020/09/29/0540nfrc7n/default.jpg', '해발고도 862m, 전국 최고고도 활공장 양평 유명산에서 즐기는 패러글라이딩!', default);
insert into product(p_no, p_name, p_price, p_date, p_qty, p_category, p_image_path, p_detail, p_grade)
values(product_p_no_seq.nextval, '충남 패키지', 29900, sysdate, 20, '충청도', 'https://static.hanatour.com/product/2021/05/31/0225yyp6ph/default.jpg', '완주+논산+대전 당일치기 패키지!', default);
insert into product(p_no, p_name, p_price, p_date, p_qty, p_category, p_image_path, p_detail, p_grade)
values(product_p_no_seq.nextval, '여수 럭셔리 요트 체험', 34000, sysdate, 15, '전라도', 'https://static.hanatour.com/product/2020/09/28/0147uc07sa/default.jpg', '해양관광 중심도시 여수에서 즐기는 로맨틱 분위기 요트투어!', default);
insert into product(p_no, p_name, p_price, p_date, p_qty, p_category, p_image_path, p_detail, p_grade)
values(product_p_no_seq.nextval, '전남 패키지', 109000, sysdate, 20, '전라도', 'https://static.hanatour.com/product/2020/10/16/0432deik5e/default.jpg', '사계절 푸르른 죽녹원 대나무 숲길과 보성의 유명 관광지 보성녹차밭을 걸으며 힐링할 수 있는 여행.', default);
insert into product(p_no, p_name, p_price, p_date, p_qty, p_category, p_image_path, p_detail, p_grade)
values(product_p_no_seq.nextval, '청정 고창에서 즐기는 힐링여행', 91000, sysdate, 10, '전라도', 'https://static.hanatour.com/product/2021/06/10/0636a5y3s9/default.jpg', '황토와 편백나무, 파동육, 면역정식까지 내가 건강해지는 힐링여행!', default);
insert into product(p_no, p_name, p_price, p_date, p_qty, p_category, p_image_path, p_detail, p_grade)
values(product_p_no_seq.nextval, '시간여행 전주 핫플레이스 감성여행', 91000, sysdate, 13, '전라도', 'https://static.hanatour.com/product/2021/07/01/010975u5y7/default.jpg', '한옥 숙박과 한옥카페,맛집 그리고 국악체험까지 하나로 담긴 알짜 여행!', default);
insert into product(p_no, p_name, p_price, p_date, p_qty, p_category, p_image_path, p_detail, p_grade)
values(product_p_no_seq.nextval, '전주 한옥마을 당일여행 왕복여행', 39000, sysdate, 17, '전라도', 'https://static.hanatour.com/product/2021/07/01/0109hn32bw/default.jpg', '전주 한옥마을 자유여행 당일여행 왕복셔틀 서울/경기에서 출발!', default);
insert into product(p_no, p_name, p_price, p_date, p_qty, p_category, p_image_path, p_detail, p_grade)
values(product_p_no_seq.nextval, '대관령 패키지', 50000, sysdate, 20, '강원도', 'https://static.hanatour.com/product/2021/05/11/0942fzvri2/default.jpg', 'KTX 타고 떠나는 대관령 하늘목장+월정사 전나무숲+상원사 기차여행.', default);
insert into product(p_no, p_name, p_price, p_date, p_qty, p_category, p_image_path, p_detail, p_grade)
values(product_p_no_seq.nextval, '속초 패키지', 50000, sysdate, 30, '강원도', 'https://static.hanatour.com/product/2021/05/27/0127gz0qju/default.jpg', '속초 대포항 바다 향기길+영금정+속초시장 당일치기 패키지!', default);
insert into product(p_no, p_name, p_price, p_date, p_qty, p_category, p_image_path, p_detail, p_grade)
values(product_p_no_seq.nextval, '경주시티 기차여행', 40000, sysdate, 40, '경상도', 'https://static.hanatour.com/product/2020/10/08/0106q8ehxs/default.jpg', '한국인이라면 수학여행이나 가족여행, 졸업여행 등으로 한 번쯤은 가보았을 도시!  지붕없는 박물관이라고 불리는 천년의 왕국 경주에서 천년전에 살았던 신라인들의 숨결을 느껴보세요~^^', default);
insert into product(p_no, p_name, p_price, p_date, p_qty, p_category, p_image_path, p_detail, p_grade)
values(product_p_no_seq.nextval, '울릉도 패키지', 300000, sysdate, 10, '경상도', 'https://image.hanatour.com/usr/cms/resize/800_0/2014/03/26/10000/53b3e7e2-b774-4fe9-a277-de8954b70607.jpg', '울릉도와 독도 여행 패키지!', default);
insert into product(p_no, p_name, p_price, p_date, p_qty, p_category, p_image_path, p_detail, p_grade)
values(product_p_no_seq.nextval, '부산 패키지', 400000, sysdate, 15, '경상도', 'https://static.hanatour.com/product/2021/05/31/0617wpakih/default.jpg', '국제 미항인 부산지역의 대표관광지를 구석구석 둘러보는 패키지 입니다.', default);
insert into product(p_no, p_name, p_price, p_date, p_qty, p_category, p_image_path, p_detail, p_grade)
values(product_p_no_seq.nextval, '안동 하회마을', 200000, sysdate, 30, '경상도', 'https://static.hanatour.com/product/2021/06/02/0805yy57rv/default.jpg', '안동 하회마을과 부근 여행입니다.', default);
insert into product(p_no, p_name, p_price, p_date, p_qty, p_category, p_image_path, p_detail, p_grade)
values(product_p_no_seq.nextval, '남해+고성 액티비티!', 45600, sysdate, 15, '경상도', 'https://static.hanatour.com/product/2021/07/12/02098gmyml/default.jpg', '남해와 고성에서 즐기는 엑티비티한 카약+ 수국여행.', default);
insert into product(p_no, p_name, p_price, p_date, p_qty, p_category, p_image_path, p_detail, p_grade)
values(product_p_no_seq.nextval, '남해 독일마을 여행', 40000, sysdate, 20, '경상도', 'https://static.hanatour.com/product/2020/10/14/0819f1rjiu/default.jpg', '이국적인 풍경이 인상적인 독일마을과 아름다운 정원 원예 예술촌 여행!', default);
commit;


--cart insert(장바구니 등록)
insert into cart(c_no, c_qty, p_no, m_id) values(cart_c_no_seq.nextval, 1, 1, 'aaa');
insert into cart(c_no, c_qty, p_no, m_id) values(cart_c_no_seq.nextval, 2, 2, 'aaa');
insert into cart(c_no, c_qty, p_no, m_id) values(cart_c_no_seq.nextval, 1, 3, 'aaa');
commit;

insert into cart(c_no, c_qty, p_no, m_id) values(cart_c_no_seq.nextval, 1, 1, 'ddd');
insert into cart(c_no, c_qty, p_no, m_id) values(cart_c_no_seq.nextval, 1, 3, 'ddd');
insert into cart(c_no, c_qty, p_no, m_id) values(cart_c_no_seq.nextval, 1, 6, 'fff');
insert into cart(c_no, c_qty, p_no, m_id) values(cart_c_no_seq.nextval, 2, 5, 'fff');
insert into cart(c_no, c_qty, p_no, m_id) values(cart_c_no_seq.nextval, 1, 4, 'eee');


--reservation insert (예약(구매하기) 등록)
/* 아이디 : aaa / 예약 완료(구매 완료)*/
insert into reservation(r_no, r_desc, r_date, r_method, r_price, m_id) values(reservation_r_no_seq.nextval, '서귀포 패키지 외 1개', sysdate-2, '카카오페이', 310000, 'aaa');
insert into reservation_item(ri_no, ri_qty, r_no, p_no) values(reservation_item_ri_no_seq.nextval, 1, reservation_r_no_seq.currval, 1);
insert into reservation_item(ri_no, ri_qty, r_no, p_no) values(reservation_item_ri_no_seq.nextval, 2, reservation_r_no_seq.currval, 3);

insert into reservation(r_no, r_desc, r_date, r_method, r_price, m_id) values(reservation_r_no_seq.nextval, '성산일출봉 패키지 외 1개', sysdate-1, '신용카드', 150000, 'aaa');
insert into reservation_item(ri_no, ri_qty, r_no, p_no) values(reservation_item_ri_no_seq.nextval, 1, reservation_r_no_seq.currval, 2);
insert into reservation_item(ri_no, ri_qty, r_no, p_no) values(reservation_item_ri_no_seq.nextval, 1, reservation_r_no_seq.currval, 5);

insert into reservation(r_no, r_desc, r_date, r_method, r_price, m_id) values(reservation_r_no_seq.nextval, '남산타워 패키지 외 0개', sysdate, '무통장입금', 50000, 'aaa');
insert into reservation_item(ri_no, ri_qty, r_no, p_no) values(reservation_item_ri_no_seq.nextval, 1, reservation_r_no_seq.currval, 4);

/* 아이디 : bbb / 예약 완료(구매 완료)*/
insert into reservation(r_no, r_desc, r_date, r_method, r_price, m_id) values(reservation_r_no_seq.nextval, '양평 패러글라이딩 외 1개', sysdate-1, '신용카드', 750000, 'bbb');
insert into reservation_item(ri_no, ri_qty, r_no, p_no) values(reservation_item_ri_no_seq.nextval, 2, reservation_r_no_seq.currval, 6);
insert into reservation_item(ri_no, ri_qty, r_no, p_no) values(reservation_item_ri_no_seq.nextval, 1, reservation_r_no_seq.currval, 1);

insert into reservation(r_no, r_desc, r_date, r_method, r_price, m_id) values(reservation_r_no_seq.nextval, '양평 패러글라이딩 외 0개', sysdate, '카카오페이', 900000, 'bbb');
insert into reservation_item(ri_no, ri_qty, r_no, p_no) values(reservation_item_ri_no_seq.nextval, 3, reservation_r_no_seq.currval, 6);


--qna insert(문의 등록)
/* 아이디 : aaa / 문의등록*/

insert into qna(q_no, q_title, q_content, q_category, q_state, m_id, p_no) values(qna_q_no_seq.nextval, '환불문의합니다.', '환불완료라고 뜨는데 돈은 아직 환불이 안되었어요...', '환불문의', '완료', 'alsrud', 1);
insert into qna(q_no, q_title, q_content, q_category, q_state, m_id, p_no) values(qna_q_no_seq.nextval, '예약변경합니다.', '이날로 변경 하고싶어요.', '취소/변경문의', '완료', 'alsrb', 2);
insert into qna(q_no, q_title, q_content, q_category, q_state, m_id, p_no) values(qna_q_no_seq.nextval, '취소문의합니다.', '불쾌해서 취소할래요', '취소/변경문의', '완료', 'tkdduf', 3);
insert into qna(q_no, q_title, q_content, q_category, q_state, m_id, p_no) values(qna_q_no_seq.nextval, '취소문의합니다.', '불쾌해서 취소할래요', '취소/변경문의', '완료', 'tkdrlf', 4);

/* 아이디 : bbb / 문의등록*/
insert into qna(q_no, q_title, q_content, q_category, q_state, m_id, p_no) values(qna_q_no_seq.nextval, '이 상품은 언제 없어지나요?', '상품이 언제까지에요?', '상품문의', '완료', 'eogus', 5);
insert into qna(q_no, q_title, q_content, q_category, q_state, m_id, p_no) values(qna_q_no_seq.nextval, '취소함', '시간이 안되서 취소 부탁드려요.', '취소/변경문의', '완료', 'tjrjs', 6);

insert into qna(q_no, q_title, q_content, q_category, m_id, p_no) values(qna_q_no_seq.nextval, '취소함', '시간이 안되서 취소 부탁드려요.', '취소/변경문의', 'alsrud', 7);


commit;

--review insert(상품 리뷰 등록)
insert into review(rv_no, rv_title, rv_writer, rv_content, p_no, rv_grade, rv_groupno, rv_step) 
values(review_rv_no_seq.nextval, '좋은 여행이었습니다.', 'aaa', '가족들끼리 여행갔는데 좋네요 추천합니다.', 10, 5, review_rv_no_seq.currval, 1);

insert into review(rv_no, rv_title, rv_writer, rv_content, p_no, rv_grade, rv_groupno, rv_step) 
values(review_rv_no_seq.nextval, '별로 입니다.', 'bbb', '너무 비싸요', 3, 2, review_rv_no_seq.currval, 1);

insert into review(rv_no, rv_title, rv_writer, rv_content, p_no, rv_grade, rv_groupno, rv_step) 
values(review_rv_no_seq.nextval, '그냥 그랬어요.', 'ccc', '괜찮긴했는데 다시 가지는 않을듯...', 4, 3.5, review_rv_no_seq.currval, 1);

insert into review(rv_no, rv_title, rv_writer, rv_content, p_no, rv_grade, rv_groupno, rv_step) 
values(review_rv_no_seq.nextval, '가성비 최고', 'ddd', '가성비 좋은 여행이었습니다.', 6, 5, review_rv_no_seq.currval, 1);

insert into review(rv_no, rv_title, rv_writer, rv_content, p_no, rv_grade, rv_groupno, rv_step) 
values(review_rv_no_seq.nextval, '비추', 'eee', '진짜 별로였어요ㅠㅠㅠㅠ', 7, 1, review_rv_no_seq.currval, 1);

insert into review(rv_no, rv_title, rv_writer, rv_content, p_no, rv_grade, rv_groupno, rv_step) 
values(review_rv_no_seq.nextval, '친구들이랑 가기 좋아요', 'fff', '친구들끼리 여행갔는데 좋네요 추천합니다.', 8, 5, review_rv_no_seq.currval, 1);

insert into review(rv_no, rv_title, rv_writer, rv_content, p_no, rv_grade, rv_groupno, rv_step) 
values(review_rv_no_seq.nextval, '다음에 또 이용할래요.', 'aaa', '너무 좋네요 추천합니다.', 9, 5, review_rv_no_seq.currval, 1);

insert into review(rv_no, rv_title, rv_writer, rv_content, p_no, rv_grade, rv_groupno, rv_step) 
values(review_rv_no_seq.nextval, '그냥 그래요', 'bbb', '그냥 그랬어요.', 11, 3, review_rv_no_seq.currval, 1);

insert into review(rv_no, rv_title, rv_writer, rv_content, p_no, rv_grade, rv_groupno, rv_step) 
values(review_rv_no_seq.nextval, '가격 빼고는 다 좋음', 'ccc', '좋긴한데 좀 비싸요', 12, 4.5, review_rv_no_seq.currval, 1);

insert into review(rv_no, rv_title, rv_writer, rv_content, p_no, rv_grade, rv_groupno, rv_step) 
values(review_rv_no_seq.nextval, '너무 별로네여', 'ddd', '저는 별로였어요', 13, 1.5,review_rv_no_seq.currval, 1);

insert into review(rv_no, rv_title, rv_writer, rv_content, p_no, rv_grade, rv_groupno, rv_step) 
values(review_rv_no_seq.nextval, '안좋은 여행이었습니다.', 'eee', '가족들끼리 여행갔는데 안좋네요 추천안합니다.', 14, 1, review_rv_no_seq.currval, 1);

insert into review(rv_no, rv_title, rv_writer, rv_content, p_no, rv_grade, rv_groupno, rv_step) 
values(review_rv_no_seq.nextval, '너무 너무 너무 좋아요!!!', 'fff', '가족들끼리 여행갔는데 짱 좋네요 완전 추천합니다.', 15, 5, review_rv_no_seq.currval, 1);

insert into review(rv_no, rv_title, rv_writer, rv_content, p_no, rv_grade, rv_groupno, rv_step) 
values(review_rv_no_seq.nextval, '다음에는 가족들이랑 또 이용하려구요!', 'aaa', '친구들끼리 여행갔는데 너무 좋아서 다음에는 가족들이랑 이용하려구요', 17, 5, review_rv_no_seq.currval, 1);

insert into review(rv_no, rv_title, rv_writer, rv_content, p_no, rv_grade, rv_groupno, rv_step) 
values(review_rv_no_seq.nextval, '실망이에요', 'bbb', 'ㅠㅠㅠㅠㅠ 너무 별로,,,,', 18, 1, review_rv_no_seq.currval, 1);

insert into review(rv_no, rv_title, rv_writer, rv_content, p_no, rv_grade, rv_groupno, rv_step) 
values(review_rv_no_seq.nextval, '좋았지만 안 좋은 점도 많네요', 'ccc', '전체적으로는 좋았는데 부분적으로는 아쉽네요', 19, 3.5, review_rv_no_seq.currval, 1);

insert into review(rv_no, rv_title, rv_writer, rv_content, p_no, rv_grade, rv_groupno, rv_step) 
values(review_rv_no_seq.nextval, '최고의 여행', 'ddd', '또 가고싶어요!', 20, 5, review_rv_no_seq.currval, 1);

insert into review(rv_no, rv_title, rv_writer, rv_content, p_no, rv_grade, rv_groupno, rv_step) 
values(review_rv_no_seq.nextval, '뒤 늦은 후기', 'eee', '가족들끼리 여행갔는데 좋네요 추천합니다.', 10, 5, review_rv_no_seq.currval, 1);

insert into review(rv_no, rv_title, rv_writer, rv_content, p_no, rv_grade, rv_groupno, rv_step) 
values(review_rv_no_seq.nextval, '서비스 최고', 'fff', '고민하다가 이용했는데 진짜 최고네여', 10, 5, review_rv_no_seq.currval, 1);

commit;


--faq insert(자주찾는 질문 등록) - 관리자 ID만 가능
insert into faq(f_no, f_question, f_answer, m_id) values(faq_f_no_seq.nextval, '국내선 항공권은 마일리지 사용 불가능한가요?', '[국내항공] > [실시간항공권] 예약은 하나투어 마일리지 결제가 불가능 합니다. 항공사마일리지 사용은 각 항공사로 직접 문의주셔야 합니다.', 'admin');
insert into faq(f_no, f_question, f_answer, m_id) values(faq_f_no_seq.nextval, '무통장 입금으로 결제할 경우 어떻게 해야 하나요?', '무통장 결제 선택시 고객님 핸드폰 연락처 알림톡(또는  문자)로 입금하실 계좌번호/입금예정금액 등 관련 안내해 드립니다.', 'admin');
insert into faq(f_no, f_question, f_answer, m_id) values(faq_f_no_seq.nextval, '자기게시물 접근배제를 요청할 수 있는 대상은 무엇인가요?', '자기게시물 접근배제 요청 대상은 정보통신망을 통하여 이용자 본인이 게시한 글, 사진, 동영상 및 이에 준하는 기타 게시물 중 다음에 해당하는 경우를 말합니다.', 'admin');
insert into faq(f_no, f_question, f_answer, m_id) values(faq_f_no_seq.nextval, '네이버에서 국내항공권 예약후 하나투어에 가입했습니다. 예약조회는 어떻게 하나요?', '먼저 네이버 검색으로 국내 항공권을 예약한 다음에 하나투어 홈페이지에 가입을 하신 경우, 하나투어 홈페이지 회원가입 후 고객센터(온라인상담 1:1문의 or 대표전화)를 통해 별도로 매칭 요청을 해주시면 됩니다.', 'admin');
insert into faq(f_no, f_question, f_answer, m_id) values(faq_f_no_seq.nextval, '호텔/국내숙박 카드결제시 취소는 언제 되나요?', '호텔/국내숙박 카드결제시 취소 안내 드립니다. ', 'admin');
insert into faq(f_no, f_question, f_answer, m_id) values(faq_f_no_seq.nextval, '환불은 어떻게 받나요?', '예약 취소 처리가 완료된 날로부터 카드사 사정에 따라 영업일 기준 약 3일에서 5일 이내 승인이 취소됩니다. 카드 대금 결제일 이후의 승인 취소 오류 등의 문제는 결제한 카드사로 직접 문의하시기 바랍니다. ', 'admin');
insert into faq(f_no, f_question, f_answer, m_id) values(faq_f_no_seq.nextval, '하나티켓 홈페이지 접속이 불가합니다', '하나티켓 홈페이지 접속이 불가합니다. ', 'admin');

commit;

