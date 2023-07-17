package com.foodary.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.foodary.vo.DietVO;

public class DietDAO {

	private static DietDAO instance = new DietDAO();
	private DietDAO() { }
	public static DietDAO getInstance() {
		return instance;
	}
	
//	DietService 클래스에서 호출되는 mapper와 메인글이 저장되는 객체를 넘겨받고 diet.xml 파일의
//	insert sql 명령을 실행하는 메소드
	public void insert(SqlSession mapper, DietVO dietvo) {
		System.out.println("DietDAO 클래스의 insert()");
		System.out.println(dietvo);
		mapper.insert("dietInsert", dietvo);
	}
	
	public ArrayList<DietVO> selectDiet(SqlSession mapper, String dietWriteDate) {
		System.out.println("DietDAO 클래스의 selectDiet()");
		return (ArrayList<DietVO>) mapper.selectList("selectDiet", dietWriteDate);
	}
	
	public ArrayList<DietVO> selectDietList(SqlSession mapper, DietVO dietvo) {
		System.out.println("DietDAO 클래스의 selectDietList()");
		return (ArrayList<DietVO>) mapper.selectList("selectDietList", dietvo);
	}

	public ArrayList<DietVO> selectDietUpdateList(SqlSession mapper, DietVO vo) {
		System.out.println("DietDAO 클래스의 selectDietUpdateList()");
		return (ArrayList<DietVO>) mapper.selectList("selectDietUpdateList", vo);
	}
	
	public ArrayList<DietVO> selectByDateTime(SqlSession mapper, DietVO vo) {
		System.out.println("DietDAO 클래스의 selectByDateTime()");
		return (ArrayList<DietVO>) mapper.selectList("selectByDateTime", vo);
	}
	
	public void dietUpdateByDateTime(SqlSession mapper, DietVO vo) {
		System.out.println("DietDAO 클래스의 selectByDateTime()");
		mapper.update("dietUpdateByDateTime", vo);
	}
	
   // showDiet.jsp => foodUpdateOK.jsp
   public ArrayList<DietVO> selectDietListTofoodwrite(SqlSession mapper, DietVO vo) {
      System.out.println("DietDAO 클래스의 selectDietListTofoodwrite()");
      return (ArrayList<DietVO>) mapper.selectList("selectDietListTofoodwrite", vo);
   }
   
	public void UpdateDietList(SqlSession mapper, DietVO dvo) {
		System.out.println("DietDAO 클래스의 UpdateDietList()");
		mapper.update("UpdateDietList", dvo);
	}
	public void deleteDietList(SqlSession mapper, int idx) {
		mapper.delete("deleteDietList", idx);
		
	}
	 // dietListView.jsp에서 날짜, 시간 띄우기
	   public ArrayList<DietVO> selectDateTime(SqlSession mapper, String dietWriteDate) {
	      System.out.println("DietDAO 클래스의 selectDateTime()");
	      return (ArrayList<DietVO>) mapper.selectList("selectDateTime", dietWriteDate);
	   }
   // dietView의 수정하기 버튼을 통한 수정
   public void UpdateDiet(SqlSession mapper, DietVO dvo) {
      System.out.println("DietDAO 클래스의 UpdateDiet()");
      mapper.update("UpdateDiet", dvo);
   }
}
