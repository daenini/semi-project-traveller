DROP TABLE reservation_item CASCADE CONSTRAINTS;
DROP TABLE faq CASCADE CONSTRAINTS;
DROP TABLE qna CASCADE CONSTRAINTS;
DROP TABLE reservation CASCADE CONSTRAINTS;
DROP TABLE cart CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;

CREATE TABLE member(
		m_id                          		VARCHAR2(12)		 NULL ,
		m_pass                        		VARCHAR2(12)		 NULL ,
		m_name                        		VARCHAR2(30)		 NULL ,
		m_email                       		VARCHAR2(50)		 NULL ,
		m_birth                       		VARCHAR2(6)		 NULL ,
		m_phone                       		VARCHAR2(11)		 NULL 
);


CREATE TABLE product(
		p_no                          		NUMBER(10)		 NULL ,
		p_name                        		VARCHAR2(50)		 NULL ,
		p_price                       		NUMBER(10)		 DEFAULT 0		 NULL ,
		p_date                        		DATE		 DEFAULT sysdate		 NULL ,
		p_qty                         		NUMBER(10)		 DEFAULT 0		 NULL ,
		p_category                    		VARCHAR2(20)		 NULL ,
		p_image_path                  		VARCHAR2(500)		 NULL ,
		p_detail                      		VARCHAR2(500)		 NULL ,
		p_grade                       		DOUBLE PRECISION	DEFAULT 0	 NULL  
);

DROP SEQUENCE product_p_no_SEQ;
CREATE SEQUENCE product_p_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;

CREATE TABLE review(
   		rv_no 								NUMBER(10)		 NULL ,  
    	rv_title							VARCHAR2(100)		 NULL , 
    	rv_writer 							VARCHAR2 (20)		 NOT		 NULL,    
    	rv_content 							VARCHAR2(500)		 NULL ,  
    	p_no 								NUMBER(10)		 NULL,
    	rv_grade 							DOUBLE PRECISION		 DEFAULT (NULL)		 NULL ,
    	rv_date 							DATE		 DEFAULT sysdate		 NULL ,     
    	rv_readcount 						NUMBER		 DEFAULT (0),      
    	rv_groupno 							NUMBER		 NOT		 NULL,            
    	rv_step 							NUMBER		 DEFAULT (1),
  	    rv_depth 							NUMBER		 DEFAULT (0)
 );
 
DROP SEQUENCE review_rv_no_SEQ;
CREATE SEQUENCE review_rv_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;
 

CREATE TABLE cart(
		c_no                          		NUMBER(10)		 NULL ,
		c_qty                         		NUMBER(10)		 DEFAULT 0		 NULL ,
		p_no                          		NUMBER(10)		 NULL ,
		m_id                          		VARCHAR2(12)		 NULL 
);

DROP SEQUENCE cart_c_no_SEQ;

CREATE SEQUENCE cart_c_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


CREATE TABLE reservation(
		r_no                          		NUMBER(10)		 NULL ,
		r_desc								VARCHAR2(100)		 NOT NULL,
		r_date                        		DATE		 DEFAULT sysdate		 NULL ,
		r_method                      		VARCHAR2(20)		 NULL ,
		r_price                       		NUMBER(10)		 NULL ,
		m_id                          		VARCHAR2(12)		 NULL 
);

DROP SEQUENCE reservation_r_no_SEQ;

CREATE SEQUENCE reservation_r_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


CREATE TABLE qna(
		q_no                          		NUMBER(10)		 NULL ,
		q_title                       		VARCHAR2(100)		 NULL ,
		q_content                     		VARCHAR2(500)		 NULL ,
		q_category                    		VARCHAR2(100)		 NULL ,
		q_state                       		VARCHAR2(100)		DEFAULT('미완료')  NULL ,
		m_id                          		VARCHAR2(12)		 NULL ,
		p_no                          		NUMBER(10)		 NULL 
);

DROP SEQUENCE qna_q_no_SEQ;

CREATE SEQUENCE qna_q_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


CREATE TABLE faq(
		f_no                          		NUMBER(10)		 NULL ,
		f_question                    		VARCHAR2(200)		 NULL ,
		f_answer                      		VARCHAR2(500)		 NULL ,
		m_id                          		VARCHAR2(12)		 NULL 
);

DROP SEQUENCE faq_f_no_SEQ;

CREATE SEQUENCE faq_f_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


CREATE TABLE reservation_item(
		ri_no                         		NUMBER(10)		 NULL ,
		ri_qty                        		NUMBER(20)		 NULL ,
		r_no                          		NUMBER(10)		 NULL ,
		p_no                          		NUMBER(10)		 NULL 
);

DROP SEQUENCE reservation_item_ri_no_SEQ;

CREATE SEQUENCE reservation_item_ri_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;



ALTER TABLE member ADD CONSTRAINT IDX_member_PK PRIMARY KEY (m_id);

ALTER TABLE product ADD CONSTRAINT IDX_product_PK PRIMARY KEY (p_no);

ALTER TABLE review ADD CONSTRAINT IDX_review_PK PRIMARY KEY (rv_no);
ALTER TABLE review ADD CONSTRAINT IDX_review_FK0 FOREIGN KEY (p_no) REFERENCES product (p_no);

ALTER TABLE cart ADD CONSTRAINT IDX_cart_PK PRIMARY KEY (c_no);
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK0 FOREIGN KEY (p_no) REFERENCES product (p_no) on delete cascade;
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK1 FOREIGN KEY (m_id) REFERENCES member (m_id) on delete cascade;

ALTER TABLE reservation ADD CONSTRAINT IDX_reservation_PK PRIMARY KEY (r_no);
ALTER TABLE reservation ADD CONSTRAINT IDX_reservation_FK0 FOREIGN KEY (m_id) REFERENCES member (m_id) on delete cascade;

ALTER TABLE qna ADD CONSTRAINT IDX_qna_PK PRIMARY KEY (q_no);
ALTER TABLE qna ADD CONSTRAINT IDX_qna_FK0 FOREIGN KEY (m_id) REFERENCES member (m_id) on delete cascade;
ALTER TABLE qna ADD CONSTRAINT IDX_qna_FK1 FOREIGN KEY (p_no) REFERENCES product (p_no);

ALTER TABLE faq ADD CONSTRAINT IDX_faq_PK PRIMARY KEY (f_no);
ALTER TABLE faq ADD CONSTRAINT IDX_faq_FK0 FOREIGN KEY (m_id) REFERENCES member (m_id);

ALTER TABLE reservation_item ADD CONSTRAINT IDX_reservation_item_PK PRIMARY KEY (ri_no);
ALTER TABLE reservation_item ADD CONSTRAINT IDX_reservation_item_FK0 FOREIGN KEY (r_no) REFERENCES reservation (r_no) on delete cascade;
ALTER TABLE reservation_item ADD CONSTRAINT IDX_reservation_item_FK1 FOREIGN KEY (p_no) REFERENCES product (p_no);