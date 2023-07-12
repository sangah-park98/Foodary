package com.foodary.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.foodary.vo.FreeboardCommentVO;

public class FreeboardCommentDAO {

	private static FreeboardCommentDAO instance = new FreeboardCommentDAO();
	private FreeboardCommentDAO() { }
	public static FreeboardCommentDAO getInstance() {
		return instance;
	}
	
	public int insertComment(SqlSession mapper, FreeboardCommentVO co) {
		return mapper.insert("insertComment", co);
	}
	
	public int commentCount(SqlSession mapper, int idx) {
		// System.out.println("FreeboardCommentDAO의 commentCount()");
		return (int) mapper.selectOne("commentCount", idx);
	}
	
	public ArrayList<FreeboardCommentVO> selectCommentList(SqlSession mapper, int idx) {
		//System.out.println("FreeboardCommentDAO의 commentCount()");
		return (ArrayList<FreeboardCommentVO>) mapper.selectList("selectCommentList", idx);
	}
	
	public FreeboardCommentVO selectCommentByIdx(SqlSession mapper, int idx) {
		// System.out.println("FreeboardCommentDAO의 selectCommentByIdx()");
		return (FreeboardCommentVO) mapper.selectOne("selectCommentByIdx", idx);
	}
	
	public void updateComment(SqlSession mapper, FreeboardCommentVO co) {
		// System.out.println("FreeboardCommentDAO의 updateComment()");
		mapper.update("updateComment", co);
	}
	
//	FreeboardCommentService 클래스에서 호출되는 mapper와 댓글을 삭제할 정보가 저장된 객체를 넘겨받고 댓글
//	1건을 삭제하는 freeboardcomment.xml 파일의 delete sql 명령을 실행하는 메소드
	public void deleteComment(SqlSession mapper, FreeboardCommentVO co) {
		// System.out.println("FreeboardCommentDAO의 updateComment()");
		mapper.delete("deleteComment", co);
	}
	
}
