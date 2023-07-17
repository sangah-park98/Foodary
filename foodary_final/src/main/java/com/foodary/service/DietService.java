package com.foodary.service;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.foodary.dao.DietDAO;
import com.foodary.mybatis.MySession;
import com.foodary.vo.DietList;
import com.foodary.vo.DietVO;

public class DietService {

	private static DietService instance = new DietService();
	private DietService() { }
	public static DietService getInstance() {
		return instance;
	}
	
//	dietList.jsp에서 호출되는 메인글이 저장된 객체를 넘겨받고 mapper를 얻어온 후 메인글을
//	저장하는 DietDAO 클래스의 insert sql 명령을 실행하는 메소드 호출하는 메소드
	public void insert(DietVO dietvo) {
		System.out.println("DietService의 insert()");
		SqlSession mapper = MySession.getSession();
//		System.out.println(mapper);
		DietDAO.getInstance().insert(mapper, dietvo);
		mapper.commit();
		mapper.close();
	}
	
	public DietList selectDiet(String dietWriteDate) {
		System.out.println("DietService의 selectDiet()");
		SqlSession mapper = MySession.getSession();
//		System.out.println(mapper);

		DietList dietList = new DietList();
		dietList.setList(DietDAO.getInstance().selectDiet(mapper, dietWriteDate));
//		System.out.println(dietList);
		mapper.close();
		return dietList;
	}
	
	public DietList selectDietList(DietVO dietvo) {
		System.out.println("DietService의 selectDietList()");
		SqlSession mapper = MySession.getSession();
		DietDAO dao = DietDAO.getInstance();
		System.out.println(dietvo);
		DietList dietList = new DietList();
		dietList.setList(dao.selectDietList(mapper, dietvo));
		System.out.println(dietList);
		mapper.close();
		return dietList;
	}
	
	public DietList selectDietUpdateList(DietVO vo) {
		System.out.println("DietService의 selectDietUpdateList()");
		SqlSession mapper = MySession.getSession();
		DietDAO dao = DietDAO.getInstance();
		
		DietList dietList = new DietList();
		dietList.setList(dao.selectDietUpdateList(mapper, vo));
		System.out.println(dietList);
		
		mapper.close();
		return dietList;
	}
	
	public DietList selectByDateTime(DietVO vo) {
		System.out.println("DietService의 selectByDateTime()");
		SqlSession mapper = MySession.getSession();
		DietDAO dao = DietDAO.getInstance();
		DietList dietList = new DietList();
		dietList.setList(dao.selectByDateTime(mapper, vo));
		mapper.close();
		return dietList;

	}
	
	public void dietUpdateByDateTime(DietVO vo) {
		System.out.println("FreeboardService의 dietUpdateByDateTime()");
		SqlSession mapper = MySession.getSession();
		DietDAO.getInstance().dietUpdateByDateTime(mapper, vo);
		mapper.commit();
		mapper.close();
	}
	
	   // showDiet.jsp => foodUpdateOK.jsp
   public DietList selectDietListTofoodwrite(DietVO vo) {
      System.out.println("DietService의 selectDietListTofoodwrite()");
      SqlSession mapper = MySession.getSession();
      System.out.println("selectDietListTofoodwrite" + vo);
      DietDAO dao = DietDAO.getInstance();
      DietList dietList = new DietList();
      dietList.setList(dao.selectDietListTofoodwrite(mapper, vo));
      mapper.close();
      return dietList;
   }

   public void UpdateDietList(DietVO dvo) {
	   System.out.println("DietService의 UpdateDietList()");
	   SqlSession mapper = MySession.getSession();
	   System.out.println(dvo);
	   DietDAO.getInstance().UpdateDietList(mapper, dvo);
	   mapper.commit();
	   mapper.close();
   }

   public void deleteDietList(int idx) {
	   System.out.println("DietService의 deleteDietList()");
	   SqlSession mapper = MySession.getSession();
	   System.out.println(idx);
	   DietDAO.getInstance().deleteDietList(mapper, idx);
	   mapper.commit();
	   mapper.close();
   }
   
   // dietListView.jsp에서 날짜, 시간 띄우기
   public DietList selectDateTime(String dietWriteDate) {
     System.out.println("DietService의 selectDateTime()");
      SqlSession mapper = MySession.getSession();
      System.out.println(dietWriteDate);
      DietDAO dao = DietDAO.getInstance();
      DietList dietList = new DietList();
      dietList.setList(dao.selectDateTime(mapper, dietWriteDate));
      mapper.close();
      return dietList;
   }
   // dietView의 수정하기 버튼을 통한 수정
   public void UpdateDiet(DietVO dvo) {
      System.out.println("DietService의 UpdateDiet()");
      SqlSession mapper = MySession.getSession();
      DietDAO.getInstance().UpdateDiet(mapper, dvo);
      mapper.commit();
      mapper.close();
   }

}
