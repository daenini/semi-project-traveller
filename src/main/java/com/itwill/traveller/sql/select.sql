/*member select*/
--1.회원 전체 출력(전체 회원리스트는 관리자만 볼수있다.)
select * from member;
--2.회원 1명 출력(전체 리스트에서 1명의 개인정보는 관리자만 볼수있다 or 로그인 한 사람이 내 정보보기)
select * from member where m_id = 'ccc';
--3.로그인 때 아이디가 존재하는지에 대한 여부 판단
select count(*) cnt from member where m_id = 'hhh';
--3. 아이디 찾기 (이름과 번호를 받아서 찾아주기!)
select * from member where m_name = '김대현' and m_phone ='01012345678';

/*product select*/
--1.상품 전체 리스트 출력
select * from product;
--2.상품 1개 출력
select * from product where p_no = 1;
--3. 상품 카테고리 별 찾기
select * from product p where p.p_category='제주도';
--4. 평점 순 정렬(전체 상품에 대해)
select * from product order by p_grade desc;
--5. 평점 순 정렬(카테고리 별)
select * from product p where p.p_category = '제주도' order by p_grade desc;

/*cart select*/
--1.회원 1명의 cart 리스트 출력
select * from cart c join member m on c.m_id = m.m_id join product p on c.p_no = p.p_no where m.m_id = 'aaa';
--2.회원 1명의 cart 리스트 1개의 상품정보
select * from cart c join product p on c.p_no = p.p_no where c_no = 1;

/*reservation select*/
--1.회원 1명의 전체 예약 리스트 출력
select * from reservation where m_id = 'aaa';
--2.회원 1명의 1개의 예약 리스트 출력
select * from reservation where r_no = 1;
--3.1개의 예약 리스트의 상품들 출력
select * from reservation_item where r_no = 1;
--4.회원 1명의 예약 리스트의 상품 및 상품정보 출력
select * from reservation r join reservation_item ri on r.r_no = ri.r_no join product p on ri.p_no = p.p_no where m_id = 'aaa';
--5.회원 1명의 예약 1개의 상품 및 상품정보 출력
select * from reservation r join reservation_item ri on r.r_no = ri.r_no join product p on ri.p_no = p.p_no where r.m_id = 'aaa' and r.r_no = 1;

/*faq select*/
--1.자주찾는 질문 전체 리스트 출력(전체에 보여주기만 할거니까 전체리스트만 필요)
select * from faq;

/*qna select*/
--1.qna 전체 리스트 출력
select * from qna;
--2.회원 1명의 문의 내역 리스트 출력
select * from qna where m_id = 'aaa';
--3.회원 1명 문의 내역의 해당 상품 정보 출력
select * from qna q join product p on q.p_no = p.p_no where q.m_id = 'bbb';
--4.회원 1명의 유형별 문의 리스트 출력
select * from qna where m_id = 'aaa' and q_category = '환불문의';
--5.회원 1명의 미완료 상태인 문의 리스트 출력
select * from qna where m_id = 'aaa' and q_state = '미완료';


/*review select*/
--1. 해당 상품의 전체 리뷰 출력
select * from review r join product p on r.p_no = p.p_no where p.p_no = 1;
--2. 모든 상품의 리뷰 출력
select * from review;
--3. 1개 상품의 평점 3점이상/이하 리뷰 출력
select * from review r join product p on r.p_no = p.p_no where p.p_no = 1 and r.rv_grade <= 3;
select * from review r join product p on r.p_no = p.p_no where p.p_no = 1 and r.rv_grade >= 3;

commit;
