package com.foodary.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.foodary.dao.UserRegisterDAO;
import com.foodary.mybatis.MySession;
import com.foodary.vo.UserRegisterVO;

public class UserRegisterService {

	private static UserRegisterService instance = new UserRegisterService();
	private UserRegisterService() { }
	public static UserRegisterService getInstance() {
		return instance;
	}
		
//	insertOK.jsp에서 호출되는 메인글이 저장된 객체를 넘겨받고 mapper를 얻어온 후 메인글을 저장하는
//	FreeboardDAO 클래스의 insert sql 명령을 실행하는 메소드 호출하는 메소드
	public void insert(UserRegisterVO rvo) {
		System.out.println("FreeboardService의 insert()");
		SqlSession mapper = MySession.getSession();
		UserRegisterDAO.getInstance().insertregister(mapper, rvo);
		mapper.commit();
		mapper.close();
	}
		
		
//	한 건의 회원가입 정보를 불러오는 selectByIdx 메소드
	public UserRegisterVO selectByIdx(int idx) {
		System.out.println("UserRegisterService 클래스의 selectByIdx()");
		SqlSession mapper = MySession.getSession();
		UserRegisterVO vo = null;
		vo = UserRegisterDAO.getInstance().selectByIdx(mapper, idx);
		return vo;
		
	}

	public UserRegisterVO selectByInfo(String id, String password) {
		System.out.println("UserRegisterService 클래스의 selectByInfo()");
		SqlSession mapper = MySession.getSession();
		HashMap<String, String> hmap = new HashMap<>();
		hmap.put("id", id);
		hmap.put("password", password);
		UserRegisterVO rvo = null;
		rvo = UserRegisterDAO.getInstance().selectByInfo(mapper, hmap);
		return rvo;
	}
	
	
	   public void userUpdate(String id, String height, String currentWeight, String goalWeight, String age, String state, String active) {
		      System.out.println("UserRegisterService 클래스의 userUpdate()");
		      SqlSession mapper = MySession.getSession();
		      HashMap<String, String> hmap = new HashMap<>();
		      hmap.put("id", id);
		      hmap.put("height", height);
		      hmap.put("currentWeight", currentWeight);
		      hmap.put("goalWeight", goalWeight);
		      hmap.put("age", age);
		      hmap.put("state", state);
		      hmap.put("active", active);
		      UserRegisterDAO.getInstance().userUpdate(mapper, hmap);
		      mapper.commit();
		      mapper.close();
		   }
	
	public void dropInfo(String id) {
		System.out.println("UserRegisterService 클래스의 dropInfo()");
		SqlSession mapper = MySession.getSession();
		UserRegisterDAO.getInstance().dropInfo(mapper, id);
		mapper.commit();
		mapper.close();
		
	}
	
	public void infoUpdate(String name, String id, String email) {
		System.out.println("UserRegisterService 클래스의 infoUpdate()");
		SqlSession mapper = MySession.getSession();
		HashMap<String, String> hmap = new HashMap<>();
		hmap.put("name", name);
		hmap.put("id", id);
		hmap.put("email", email);
		System.out.println(id);
		System.out.println(name);
		UserRegisterDAO.getInstance().infoUpdate(mapper, hmap);
		mapper.commit();
		mapper.close();
	}
	
	public void newpasswordUpdate(String id, String currentpassword, String newpassword) {
		System.out.println("UserRegisterService 클래스의 newpasswordUpdate()");
		SqlSession mapper = MySession.getSession();
		HashMap<String, String> hmap = new HashMap<>();
		hmap.put("id", id);
		hmap.put("currentpassword", currentpassword);
		hmap.put("newpassword", newpassword);
		UserRegisterDAO.getInstance().newpasswordUpdate(mapper, hmap); 
		mapper.commit();
		mapper.close();
	}
	
	
	
}










