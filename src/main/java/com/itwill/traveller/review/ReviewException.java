package com.itwill.traveller.review;

public class ReviewException extends Exception {
	public ReviewException(){
		this("리뷰 관련 에러 발생");
	}
	public ReviewException(String errorMsg){
		super(errorMsg);
	}
	public ReviewException(String errorMsg, Throwable cause){
		super(errorMsg, cause);
	}	
}
