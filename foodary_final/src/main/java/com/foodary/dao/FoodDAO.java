package com.foodary.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.foodary.vo.FoodVO;
import com.foodary.vo.Param;
import com.foodary.vo.UserFoodVO;

public class FoodDAO {
	
	 private static FoodDAO instance = new FoodDAO();

	    private FoodDAO() {    }

	    public static FoodDAO getInstance () {
	        return instance;
	    }

		public int selectCount(SqlSession mapper) {
			System.out.println("FoodDAO의 selectCount()");
			return (int) mapper.selectOne("food.selectCount");
		}
		
		public ArrayList<FoodVO> selectList(SqlSession mapper, HashMap<String, Integer> hmap) {
			System.out.println("FoodDAO의 selectList()");
			return (ArrayList<FoodVO>) mapper.selectList("food.selectList", hmap);
		}


		public ArrayList<FoodVO> search(SqlSession mapper , String foodName) {
			System.out.println("search() 실행");
			System.out.println(foodName);
			return (ArrayList<FoodVO>) mapper.selectList("food.search", foodName);
		}
		
//	    SelectService 클래스에서 호출되는 mapper와 검색어(내용)를 넘겨받고 guestbook.xml 파일의 테이블에 저장된 전체
//	    글 중에서 검색어를 포함하는 글의 개수를 얻어오는 select sql 명령을 호출하는 메소드
	    public int selectCountFood(SqlSession mapper, String foodName)  {
	        System.out.println("FoodDAO 클래스의 selectCountFood() 메소드 실행");
	        return (int) mapper.selectOne("selectCountFood" , foodName);
	    }

//	    SelectService 클래스에서 호출되는 mapper와 화면에 출력할 시작 인덱스와 끝 인데스, 검색어(내용)가 저장된
//	    Param 클래스 객체를 넘겨받고 guestbook.xml 파일의 내용에 검색어를 포함하는 1페이지 분량의 글 목록을 얻어오는
//	    select sql 명령을 실행하는 메소드
	    public ArrayList<FoodVO> selectListFood(SqlSession mapper, Param param)  {
	        System.out.println("FoodDAO 클래스의 selectListFood() 메소드 실행");
	        return (ArrayList<FoodVO>) mapper.selectList("selectListFood" , param);
	    }
		
}
