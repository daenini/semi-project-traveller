package com.itwill.traveller.faq;

import java.util.ArrayList;

public class FaqService {
	
	private FaqDao faqDao;
	
	public FaqService() throws Exception{
		faqDao = new FaqDao();
	}
	
	public ArrayList<Faq> selectAll() throws Exception{
		return faqDao.selectAll();
	}
	
	public Faq selectByNo(int f_no) throws Exception{
		return faqDao.selectByNo(f_no);
	}
	
	public ArrayList<Faq> getList(int startRow, int endRow) throws Exception {
		return faqDao.getList(startRow, endRow);
	}
	
	public int getCount() throws Exception {
		return faqDao.getCount();
	}
	
	public int insertFaq(Faq faq) throws Exception{
		return faqDao.insertFaq(faq);
	}
	
	public int updateFaq(Faq faq) throws Exception{
		return faqDao.updateFaq(faq);
	}
	
	public int deleteFaq(int f_no) throws Exception{
		return faqDao.deleteFaq(f_no);
	}

}
