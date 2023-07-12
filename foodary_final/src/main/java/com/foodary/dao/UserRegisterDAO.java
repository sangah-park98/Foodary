package com.foodary.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.foodary.vo.UserRegisterVO;

public class UserRegisterDAO {

	private static UserRegisterDAO instance = new UserRegisterDAO();
	private UserRegisterDAO() { }
	public static UserRegisterDAO getInstance() {
		return instance;
	}
	
//	FreeboardService 클래스에서 호출되는 mapper와 메인글이 저장된 객체를 넘겨받고 freeboard.xml 파일의
//	insert sql 명령을 실행하는 메소드
	public void insertregister(SqlSession mapper, UserRegisterVO rvo) {
		System.out.println("UserRegisterDAO의 insert()");
		mapper.insert("User.insertRegister", rvo);
	}


//	UserRegisterService에서 넘어온 idx를 처리하는 dao 메소드	
	public UserRegisterVO selectByIdx(SqlSession mapper, int idx) {
		System.out.println("UserRegisterDAO 클래스의 selectByIdx() 메소드 실행");
		return (UserRegisterVO) mapper.selectOne("User.selectByIdx", idx);
	}
	
//	회원 정보 한 건을 저장하는 메소드
	public UserRegisterVO selectByInfo(SqlSession mapper, HashMap<String, String> hmap) {
		return (UserRegisterVO) mapper.selectOne("User.selectByInfo", hmap);
	}
	
//	키, 현재 체중, 목표 체중, 나이를 수정하는 메소드	
	public void userUpdate(SqlSession mapper, HashMap<String, String> hmap) {
		mapper.update("User.update", hmap);
	}
	
//	회원 탈퇴하는 메소드
	public void dropInfo(SqlSession mapper, String id) {
	 mapper.delete("User.dropInfo", id);
	}
	
//	이름, 이메일을 수정하는 메소드		
	public void infoUpdate(SqlSession mapper, HashMap<String, String> hmap) {
		mapper.update("User.infoUpdate", hmap);
	}
//	비밀번호 변경하는 메소드	
	public void newpasswordUpdate(SqlSession mapper, HashMap<String, String> hmap) {
		mapper.update("User.newpasswordUpdate", hmap);
	}

}




