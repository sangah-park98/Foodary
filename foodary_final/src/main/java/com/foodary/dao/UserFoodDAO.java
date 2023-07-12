package com.foodary.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.foodary.vo.DietVO;
import com.foodary.vo.UserFoodVO;

public class UserFoodDAO {

	 private static UserFoodDAO instance = new UserFoodDAO();

	 private UserFoodDAO() { }
	 public static UserFoodDAO getInstance () {
	        return instance;
	 }
	 
	 public void insertFood(SqlSession mapper, UserFoodVO vo) {
		System.out.println("UserFoodDAO의 insertFood()");
		System.out.println(vo);
		mapper.insert("insertFood", vo);
	}

	public ArrayList<UserFoodVO> userSelectList(SqlSession mapper, UserFoodVO vo) {
		System.out.println("UserFoodDAO 클래스의 userSelectList()");		
		return (ArrayList<UserFoodVO>) mapper.selectList("userSelectList", vo);
	}
	 
	public ArrayList<UserFoodVO> userSelectDietList(SqlSession mapper, String dietWriteDate) {
		System.out.println("UserFoodDAO 클래스의 userSelectDietList()");
		return (ArrayList<UserFoodVO>) mapper.selectList("userSelectDietList", dietWriteDate);
	}
	
	public ArrayList<UserFoodVO> userSelectDietList2(SqlSession mapper, UserFoodVO userfoodvo) {
		System.out.println("UserFoodDAO 클래스의 userSelectDietList2()");
		return (ArrayList<UserFoodVO>) mapper.selectList("userSelectDietList2", userfoodvo);
	}
	
	public ArrayList<UserFoodVO> selectUserFoodBeforeSelect(SqlSession mapper, UserFoodVO uvo) {
		System.out.println("UserFoodDAO 클래스의 selectUserFoodBeforeSelect()");
		return (ArrayList<UserFoodVO>) mapper.selectList("selectUserFoodBeforeSelect", uvo);
	}
	
	public void dietUpdateByDateTime(SqlSession mapper, UserFoodVO uvo) {
		System.out.println("UserFoodDAO 클래스의 selectUserFoodBeforeSelect()");
		mapper.update("dietUpdateByDateTime", uvo);
	}
	
   
   // showDiet.jsp => foodUpdateOK.jsp
   public ArrayList<UserFoodVO> selectUserFoodListTofoodwrite(SqlSession mapper, UserFoodVO uvo) {
      System.out.println("UserFoodDAO 클래스의 selectUserFoodListTofoodwrite()");
      return (ArrayList<UserFoodVO>) mapper.selectList("selectUserFoodListTofoodwrite", uvo);
   }
   
   // deleteFood.jsp
   public void deleteUserFoodList(SqlSession mapper, int idx) {
      System.out.println("UserFoodDAO 클래스의 deleteUserFoodList()");
      mapper.delete("deleteUserFoodList", idx);      
   }
   
   // updateFood.jsp
   public void UpdateUserFoodList(SqlSession mapper, UserFoodVO uvo) {
      System.out.println("UserFoodDAO 클래스의 UpdateUserFoodList()");
      mapper.update("UpdateUserFoodList", uvo);
   }
   
   public void deleteUser(SqlSession mapper, UserFoodVO uvo) {
	      System.out.println("UserFoodDAO 클래스의 deleteUser()");
	      mapper.delete("deleteUser", uvo); 
	      
	   }
}