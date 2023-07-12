package com.foodary.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.foodary.dao.FoodDAO;
import com.foodary.mybatis.MySession;
import com.foodary.vo.FoodVO;

@WebServlet("/FoodSearch")
public class FoodSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FoodSearch() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("GET방식");
		//System.out.println(request.getParameter("name"));
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("POST방식");
	    //request.setCharacterEncoding("UTF-8");
		//System.out.println(request.getParameter("name"));
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("actuonDo");
		response.setContentType("text/html; charset=UTF-8");
		String name = request.getParameter("name");
		//System.out.println(name);
		
		// ajax 방식으로 요청한 곳으로 데이터를 리턴한다.
		// write() 메소드로 ajax 방식으로 요청한 곳으로 데이터를 리턴한다.
		// write() 메소드의 인수는 반드시 문자열이 나와야 하고 ajax로 서블릿을 호출한 곳에서는
		// responseText를 사용해서 받는다.
		response.getWriter().write(getJSON(name));
	}
	
	private String getJSON(String name) {
		//검색할 이름을 입력하지 않고 검색 버튼을 클릭했을 때 넘어오는 null을 공백으로 처리한다. 
		if(name == null) {
			name = "";
		}
		SqlSession mapper = MySession.getSession();
		// ajax 테이블에서 입력한 문자열이 name 필드에 포함된 데이터를 얻어온다. 
		ArrayList<FoodVO> list = FoodDAO.getInstance().search(mapper ,name);
		//System.out.println(list);
		
		//테이블을 검색해서 얻어온 데이터를 json 형식의 문자열로 만든다.
		StringBuffer result = new StringBuffer();
		result.append("{\"result\": ["); //json 시작
		// 데이터의 개수만큼 반복하며 json 형태의 문자열을 만든다.
		for(FoodVO vo : list) {
			result.append("[{\"value\" : \"" + vo.getIdx() + "\"},");
			result.append(" {\"value\" : \"" + vo.getFoodName().trim() + "\"},");
			result.append(" {\"value\" : \"" + vo.getKcal() + "\"},");
			result.append(" {\"value\" : \"" + vo.getCarbs() + "\"},");
			result.append(" {\"value\" : \"" + vo.getProtein() + "\"},");
			result.append(" {\"value\" : \"" + vo.getProtein() + "\"}],");
		}
		result.append("]}"); //json 끝
		
		// StringBuffer 타입의 객체를 String 타입으로 리턴시키기 위해 toString() 메소드 실행
		return result.toString();
	}

}
