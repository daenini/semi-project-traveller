package com.itwill.traveller.member.test;

import com.itwill.traveller.member.Member;
import com.itwill.traveller.member.MemberDao;

public class MemberDaoTestMain {

	public static void main(String[] args) throws Exception {
		
		MemberDao memberDao = new MemberDao();

		  System.out.println( memberDao.insertMember(new Member("test5", "test1",
		  "test1", "test1", "001122", "01033334444")));
		
		
		
		  System.out.println( memberDao.updateMember(new Member("test1", "test2",
		  "test2", "test2", null, "01033334444")) );
		  
		  System.out.println(memberDao.deleteMember("test1"));
		 
		
		System.out.println(memberDao.selectAll());
		System.out.println(memberDao.selectById("admin"));
		System.out.println(memberDao.existedMember("admin"));

		System.out.println(memberDao.findId("김대현", "01012665487"));

	}

}
