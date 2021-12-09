package com.itwill.traveller.faq.test;

import com.itwill.traveller.faq.Faq;
import com.itwill.traveller.faq.FaqService;
import com.itwill.traveller.member.Member;

public class FaqDaoTestMain {

	public static void main(String[] args) throws Exception {

		FaqService faqService = new FaqService();

		
		  System.out.println( faqService.insertFaq(new Faq(0,
		  "국내 패키지 일정표 내 항공 시간이 없네요?",
		  "예약과 동시에 가능여부 체크진행이 되며 해당 되는 좌석으로 실시간으로 항공 가격이 책정되어, 좌석상황에 따라 항공료는 변동될 수 있습니다."
		  , new Member("admin", null, null, null, null, null))));
		  
		  System.out.println( faqService.updateFaq(new Faq(161,
		  "지금 해외 패키지 상품 예약이 가능한가요?", "현재 기준으로는 예약 및 진행이 불가능합니다. (향후 상황 변동시 재안내 예정)\r\n"
		  + "다만, 여행 외에 다른목적의 경우는 개별적인 확인 요청 부탁드리며,\r\n" +
		  "당사 홈페이지 내 안내 드리는 코로나 19 정보 센터를 참고 부탁드립니다.", new Member())));
		 

	}

}
