package com.foodary.service;

import org.apache.ibatis.session.SqlSession;

import com.foodary.dao.DietDAO;
import com.foodary.dao.FoodDAO;
import com.foodary.dao.UserFoodDAO;
import com.foodary.mybatis.MySession;
import com.foodary.vo.DietVO;
import com.foodary.vo.UserFoodList;
import com.foodary.vo.UserFoodVO;

public class UserFoodService {

	private static UserFoodService instance = new UserFoodService();

    private UserFoodService() {    }
    public static UserFoodService getInstance () {
        return instance;
    }
    
    public void insertFood(UserFoodVO vo) {
    	System.out.println("UserFoodService의 insertFood()");
		SqlSession mapper = MySession.getSession();
		System.out.println(mapper);
		System.out.println(vo);
		UserFoodDAO.getInstance().insertFood(mapper, vo);
		mapper.commit();
		mapper.close();
	}
    
    public UserFoodList userSelectList(UserFoodVO vo) {
    	System.out.println("UserFoodService의 userSelectList()");
    	System.out.println(vo);
    	SqlSession mapper = MySession.getSession();
    	UserFoodList userFoodList  = new UserFoodList();
    	userFoodList.setList(UserFoodDAO.getInstance().userSelectList(mapper,vo));
		System.out.println(userFoodList);
		mapper.close();
		return userFoodList;
    }
    
    public UserFoodList userSelectDietList(String dietWriteDate) {
    	System.out.println("UserFoodService의 userSelectDietList()");
		SqlSession mapper = MySession.getSession();
		System.out.println(dietWriteDate);
		UserFoodList userFoodList = new UserFoodList();
		userFoodList.setList(UserFoodDAO.getInstance().userSelectDietList(mapper, dietWriteDate));
		System.out.println(userFoodList);
		mapper.close();
		return userFoodList;
    }
    
    public UserFoodList userSelectDietList2(UserFoodVO userfoodvo) {
    	System.out.println("UserFoodService의 userSelectDietList2()");
    	SqlSession mapper = MySession.getSession();
    	System.out.println(userfoodvo);
    	UserFoodList userFoodList = new UserFoodList();
    	userFoodList.setList(UserFoodDAO.getInstance().userSelectDietList2(mapper, userfoodvo));
    	System.out.println(userFoodList);
    	mapper.close();
    	return userFoodList;
    }
    
    public UserFoodList selectUserFoodBeforeSelect(UserFoodVO uvo) {
    	System.out.println("UserFoodService의 selectUserFoodBeforeSelect()");
    	SqlSession mapper = MySession.getSession();
    	UserFoodList userFoodList = new UserFoodList();
    	userFoodList.setList(UserFoodDAO.getInstance().selectUserFoodBeforeSelect(mapper, uvo));
    	System.out.println(userFoodList);
    	mapper.close();
    	return userFoodList;
    	
    }
    
    public void userFoodUpdateByDateTime(UserFoodVO uvo) {
    	System.out.println("UserFoodService의 userFoodUpdateByDateTime()");
    	SqlSession mapper = MySession.getSession();
		UserFoodDAO.getInstance().dietUpdateByDateTime(mapper, uvo);
		mapper.commit();
		mapper.close();
    }
    
    // showDiet.jsp => foodUpdateOK.jsp
    public UserFoodList selectUserFoodListTofoodwrite(UserFoodVO uvo) {
       System.out.println("UserFoodService의 selectUserFoodListTofoodwrite()");
       SqlSession mapper = MySession.getSession();
       System.out.println(uvo);
       UserFoodList userFoodList = new UserFoodList();
       userFoodList.setList(UserFoodDAO.getInstance().selectUserFoodListTofoodwrite(mapper, uvo));
       System.out.println(userFoodList);
       mapper.close();
       return userFoodList;
    }
    
    public void deleteUserFoodList(int idx) {
        System.out.println("UserFoodService의 deleteUserFoodList()");
        SqlSession mapper = MySession.getSession();
        System.out.println(idx);
        UserFoodDAO.getInstance().deleteUserFoodList(mapper, idx);
        mapper.commit();
        mapper.close();
     }
    
    // foodUpdateComplete.jsp
    public void UpdateUserFoodList(UserFoodVO uvo) {
       System.out.println("UserFoodService의 UpdateUserFoodList()");
       SqlSession mapper = MySession.getSession();
       System.out.println(uvo);
      UserFoodDAO.getInstance().UpdateUserFoodList(mapper, uvo);
      mapper.commit();
      mapper.close();
    }
    
    public void deleteUser(UserFoodVO uvo) {
        System.out.println("UserFoodService의 deleteUser()");
        SqlSession mapper = MySession.getSession();
        System.out.println(uvo);
        UserFoodDAO.getInstance().deleteUser(mapper, uvo);
        mapper.commit();
        mapper.close();
     }
}
