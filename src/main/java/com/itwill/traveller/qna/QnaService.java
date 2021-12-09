package com.itwill.traveller.qna;

import java.util.ArrayList;

public class QnaService {
	private QnaDao QnaDao;

	public QnaService() {
		this.QnaDao = new QnaDao();
	}
	
	public int insertQna(Qna qna) throws Exception {
		return QnaDao.insertQna(qna);
	}

	public Qna selectByNo(int no) throws Exception {
		return QnaDao.selectByNo(no);
	}
	
	public int updateQna(Qna qna) throws Exception {
		return QnaDao.updateQna(qna);
	}

	public int deleteQna(int no) throws Exception {
		return QnaDao.deleteQna(no);
	}
	
	public int getCount(String search, String category) throws Exception {
		return QnaDao.getCount(search, category);
	}
	
	public ArrayList<Qna> selectPage(int page) throws Exception {
		return QnaDao.selectPage(page);
	}

	public ArrayList<Qna> selectPageSearch(String search, int startRow, int endRow) throws Exception {
		return QnaDao.selectPageSearch(search, startRow, endRow);
	}

	public ArrayList<Qna> selectPageCategory(String category, int startRow, int endRow) throws Exception {
		return QnaDao.selectPageCategory(category, startRow, endRow);
	}

}