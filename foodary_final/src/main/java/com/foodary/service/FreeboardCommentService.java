package com.foodary.service;

import org.apache.ibatis.session.SqlSession;

import com.foodary.dao.FreeboardCommentDAO;
import com.foodary.mybatis.MySession;
import com.foodary.vo.FreeboardCommentList;
import com.foodary.vo.FreeboardCommentVO;

public class FreeboardCommentService {

	private static FreeboardCommentService instance = new FreeboardCommentService();
	private FreeboardCommentService() { }
	public static FreeboardCommentService getInstance() {
		return instance;
	}
	
//	commentOK.jsp에서 호출되는 댓글로 저장할 정보가 저장된 객체를 넘겨받고 mapper를 얻어온 후 
//	FreeboardCommentDAO 클래스의 댓글을 저장하는 insert sql 명령을 실행하는 메소드를 호출하는 메소드
	public boolean insertComment(FreeboardCommentVO co) {
		// System.out.println("FreeboardCommentService의 insertComment()");
		SqlSession mapper = MySession.getSession();
		int result = FreeboardCommentDAO.getInstance().insertComment(mapper, co);
		System.out.println("result: " + result);
		if (result == 1) {
			mapper.commit();
			mapper.close();
			return true;
		} else {
			mapper.close();
			return false;
		}
	}
	
//	list.jsp에서 호출되는 공지글 또는 메인글의 글번호로 넘겨받고 mapper를 얻어온 후 FreeboardCommentDAO 
//	클래스의 댓글의 개수를 얻어오는 select sql 명령을 실행하는 메소드를 호출하는 메소드
	public int commentCount(int idx) {
		// System.out.println("FreeboardCommentService의 commentCount()");
		SqlSession mapper = MySession.getSession();
		int commentCount = FreeboardCommentDAO.getInstance().commentCount(mapper, idx);
		mapper.close();
		return commentCount;
	}
	
//	selectByIdx.jsp에서 호출되는 댓글 목록을 얻어올 메인글의 글번호를 넘겨받고 mapper를 얻어온 후 
//	FreeboardCommentDAO 클래스의 댓글 목록을 얻어오는 select sql 명령을 실행하는 메소드를 호출하는 메소드
	public FreeboardCommentList selectCommentList(int idx) {
		// System.out.println("FreeboardCommentService의 selectCommentList()");
		SqlSession mapper = MySession.getSession();
		FreeboardCommentList freeboardCommentList = new FreeboardCommentList();
		freeboardCommentList.setList(FreeboardCommentDAO.getInstance().selectCommentList(mapper, idx));
		mapper.close();
		return freeboardCommentList;
	}
	
//	commentOK.jsp에서 호출되는 댓글을 수정할 정보가 저장된 객체를 넘겨받고 mapper를 얻어온 후 
//	FreeboardCommentDAO 클래스의 댓글을 수정하는 update sql 명령을 실행하는 메소드를 호출하는 메소드
	public boolean updateComment(FreeboardCommentVO co) {
		// System.out.println("FreeboardCommentService의 updateComment()");
		SqlSession mapper = MySession.getSession();
		FreeboardCommentDAO dao = FreeboardCommentDAO.getInstance();
		
		// 댓글을 수정하기 위해서 입력한 비밀번호와 수정할 댓글의 비밀번호를 비교하기 위해서 수정할 댓글을
		// 얻어온다.
			dao.updateComment(mapper, co);
			mapper.commit();
			mapper.close();
			return true;
	}
	
	
	public boolean deleteComment(FreeboardCommentVO co) {
		System.out.println("FreeboardCommentService의 deleteComment()");
		SqlSession mapper = MySession.getSession();
		FreeboardCommentDAO dao = FreeboardCommentDAO.getInstance();
		
		dao.deleteComment(mapper, co);
		mapper.commit();
		mapper.close();
		return true;

	}
	
}







