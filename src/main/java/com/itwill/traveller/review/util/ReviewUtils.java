package com.itwill.traveller.review.util;
import java.io.UnsupportedEncodingException;

import com.itwill.traveller.review.Review;


public class ReviewUtils {
	/*
	 * \r\n 을 html의 <br>로 convert한다
	 */
	public static String convertHtmlBr(String comment) {
		//**********************************************************************
		if (comment == null)
			return "";
		int length = comment.length();
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i < length; i++) {
			String tmp = comment.substring(i, i + 1);
			if ("\r".compareTo(tmp) == 0) {
				tmp = comment.substring(++i, i + 1);
				if ("\n".compareTo(tmp) == 0)
					buffer.append("<br>\r");
				else
					buffer.append("\r");
			}
			buffer.append(tmp);
		}
		return buffer.toString();
	}

	public static String ascToksc(String str, boolean isEncode)
		throws UnsupportedEncodingException {
		String result = str;
		if (result == null || result == "")
			return null;

		return new String(result.getBytes("8859_1"), "KSC5601");
	}

	public static String kscToasc(String str)
		throws UnsupportedEncodingException {
		if (str == null || str == "")
			return null;
		//character의 코드를 바꾸어준다.
		return new String(str.getBytes("KSC5601"), "8859_1");
	}
	public String getTitleString(Review review) {
		StringBuilder title = new StringBuilder(128);
		String t = review.getRv_title();
		if (t.length() > 15) {
			//t = t.substring(0,15);
			//t = t+"...";
			t = String.format("%s...", t.substring(0, 15));
		}
		//답글공백삽입
		
		for (int i = 0; i < review.getRv_depth(); i++) {
			title.append("&nbsp;&nbsp;");
		}
		
		if (review.getRv_depth() > 0) {
			title.append("<img border='0' src='images/re.gif'/>");
		}
		
		title.append(t.replace(" ", "&nbsp;"));
		
		return title.toString();
}
}
