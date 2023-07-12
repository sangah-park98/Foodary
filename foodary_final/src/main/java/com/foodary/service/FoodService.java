package com.foodary.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.foodary.dao.FoodDAO;
import com.foodary.mybatis.MySession;
import com.foodary.vo.FoodList;
import com.foodary.vo.Param;
import com.foodary.vo.UserFoodList;
import com.foodary.vo.UserFoodVO;


public class FoodService {
	
	  private static FoodService instance = new FoodService();

	    private FoodService() {    }

	    public static FoodService getInstance () {
	        return instance;
	    }
	    
	    public FoodList selectList(int currentPage) {
			System.out.println("FoodService의 selectList()");
			SqlSession mapper = MySession.getSession();
			FoodDAO dao = FoodDAO.getInstance();
			
			int pageSize = 10;
			int totalCount = dao.selectCount(mapper);
			
			FoodList foodList = new FoodList(pageSize, totalCount, currentPage);
			HashMap<String, Integer> hmap = new HashMap<>();
			hmap.put("startNo", foodList.getStartNo());
			hmap.put("endNo", foodList.getEndNo());
			foodList.setList(dao.selectList(mapper, hmap));
			
			mapper.close();
			return foodList;
		}
	    
//	    list.jsp에서 호출되는 브라우저에 표시할 페이지 번호와 검색어(내용)을 넘겨받고 mapper를 얻어온 후
//	    GuestbookDAO 클래스의 1페이지 분량의 글 목록을 얻어오는 select sql 명령을 실행하는 메소드를 호출하는
//	    메소드
	    public FoodList selectListFood(int currentPage, String foodName) {
	        System.out.println("FoodService 클래스의 selectListFood() 메소드 실행");
	        SqlSession mapper = MySession.getSession();
	        FoodList foodList = null;
	        FoodDAO dao = FoodDAO.getInstance();
	        int pageSize = 10;
	        // 내용에 검색어(내용)을 포함하는 글의 개수를 얻어온다.
	        int totalCount = dao.selectCountFood(mapper , foodName);
	        System.out.println(totalCount);
	        System.out.println(foodName);
	        foodList = new FoodList(pageSize, totalCount, currentPage);
//	        startNo, endNo만 sql 명령으로 넘겨줄 때는 데이터 타입이 같기 때문에 HashMap을 이용했지만
//	        category, item을 같이 넘겨야 하므로 데이터 타입이 다르기 때문에 별도의 클래스를 만들고
//	        클래스 객체에 데이터를 담아서 넘겨줘야 한다.
	        Param param = new Param();
	        param.setStartNo(foodList.getStartNo());
	        param.setEndNo(foodList.getEndNo());
	        param.setFoodName(foodName);
	        System.out.println(param.getFoodName());
//	        내용에 검색어를 포함하는 1페이지 분량의 글을 얻어와서 GuestbookList 클래스의 ArrayList에 저장한다.
	        foodList.setList(dao.selectListFood(mapper, param));
	        return foodList;
	    }
	    
	   
	    
	    
	    
}
