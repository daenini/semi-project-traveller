package com.itwill.traveller.review.test;

import com.itwill.traveller.review.Review;
import com.itwill.traveller.review.ReviewDao;

public class ReviewDaoTestMain {
	
	public static void main(String[] args) throws Exception {
		ReviewDao reviewDao = new ReviewDao();
		/*
		System.out.println("------- review_get_all() -------");
		System.out.println(reviewDao.getReviewListAll());
		 
		System.out.println("------- getProductReviewList() -------");
		System.out.println(reviewDao.getProductReviewList(4));
		
		System.out.println("------- getProductGrade() -------");
		System.out.println(reviewDao.getProductGrade(10));
		
		System.out.println("------- create() -------");
		System.out.println(reviewDao.create(new Review(10,"굿굿","bbb","조금 아쉽지만 좋았어요.",10,4,null,0,0,0,0)));
		
		
		
		
		*/
		System.out.println("------- getCount() -------");
		System.out.println(reviewDao.getCount(1));
		
		System.out.println("------- selectPage() -------");
		System.out.println(reviewDao.selectPage(1,1));		

	}

}
