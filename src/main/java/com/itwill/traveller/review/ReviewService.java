package com.itwill.traveller.review;
import java.util.ArrayList;
import java.util.List;

import com.itwill.traveller.review.util.PageMaker;


public class ReviewService {
	private static ReviewService review_Instance;
	private ReviewDao reviewDao;
	
	public ReviewService() throws Exception {
		reviewDao = new ReviewDao();
	}
	
	public static ReviewService getInstance() throws Exception{
		if(review_Instance == null) {
			review_Instance=new ReviewService();
		}
		return review_Instance;
	}
	
	public double getProductGrade(int p_no) throws Exception{
		return reviewDao.getProductGrade(p_no);		
	}
	
	public int getCount(int p_no) throws Exception{
		return reviewDao.getCount(p_no);		
	}
	
	public ArrayList<Review> selectPage(int page, int p_no) throws Exception {
		return reviewDao.selectPage(page, p_no);
	}
	
	public ArrayList<Review> getReviewList(int p_no) throws Exception {
		return reviewDao.getProductReviewList(p_no);
	}
	// 리뷰 삭제	 
	public int remove(int rv_no) throws Exception,ReviewException{
		Review tempReview = reviewDao.findReview(rv_no);
		boolean rExist=reviewDao.countReplay(tempReview);
		System.out.println("답글존재여부:"+rExist);
		if(reviewDao.countReplay(tempReview)){
			// 리뷰 답글 존재
			throw new ReviewException("답글이 있는 리뷰는 삭제가 안됩니다.");
		}else{
			// 리뷰 답글 존재 X
			return reviewDao.remove(tempReview.getRv_no());
		}
	}
	
	
	// 리뷰 생성
	public int create(Review review)throws Exception{
		return  reviewDao.create(review);
	}
	
	// 답글쓰기 (관리자)
	public int createReplay(Review review) throws Exception{
		return reviewDao.createReply(review);
	}
	
	// 리뷰 1개 
	public Review findReview(int rv_no)throws Exception{
		Review review = reviewDao.findReview(rv_no);
		return review;
	}
	
	// 리뷰 조회수 1 증가
	public void updateReadCount(int rv_no) throws Exception{
		reviewDao.increaseReadCount(rv_no);
	}
	
	// 조회수 얻기
	public int getReadCount(int rv_no) throws Exception{
		return reviewDao.getReadCount(rv_no);
	}
	
	// 리뷰 리스트
	public ReviewListPageMakerDto findReviewList(int currentPage, int p_no) throws Exception{
		//1. 상품의 리뷰 개수
		int totalRecordCount = reviewDao.getCount(p_no);
		//2. paging계산(PageMaker 유틸클래스)
		PageMaker pageMaker = new PageMaker(totalRecordCount,currentPage);
	
		//3. 리뷰 데이터 얻기
		List<Review> reviewList=
				reviewDao.findReviewList(pageMaker.getPageBegin(),
											pageMaker.getPageEnd(), p_no);
		
		ReviewListPageMakerDto pageMakerReviewList=new ReviewListPageMakerDto();
		pageMakerReviewList.totRecordCount=totalRecordCount;
		pageMakerReviewList.itemList=reviewList;
		pageMakerReviewList.pageMaker=pageMaker;
		return pageMakerReviewList;
	}
	
	// 게시물 수정
	public int update(Review review) throws Exception {
		return reviewDao.update(review);
	}
	
	// 리뷰 수정
	public int updateReply(Review review) throws Exception {
		return reviewDao.updateReply(review);
	}
	
	
}
