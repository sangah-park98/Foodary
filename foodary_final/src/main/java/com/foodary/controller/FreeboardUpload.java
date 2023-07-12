package com.foodary.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodary.service.FreeboardService;
import com.foodary.vo.FreeboardVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/FreeboardUpload")
public class FreeboardUpload extends HttpServlet {
   private static final long serialVersionUID = 1L;
    public FreeboardUpload() {
        super();
    }
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      actionDo(request, response);
   }
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      actionDo(request, response);
   }
   protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html; charset=UTF-8");
      
      
      
      String fileurl= "C:\\DevData\\WEB\\foodary_final\\src\\main\\webapp\\JSP_freeboard\\upload";
      String encType="UTF-8";
      int Maxsize = 5*1024*1024;
      ServletContext servletContext = request.getServletContext();
      DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
      
      try {
         MultipartRequest mr = new MultipartRequest(request, fileurl, Maxsize, encType, policy);
         File realFilename = mr.getFile("fileName");
         String picture = realFilename.getName();
         String subject = mr.getParameter("subject");
         Date writeDate = new Date();
         String content = mr.getParameter("content");
         String name = mr.getParameter("name");
         String notice = mr.getParameter("notice");
         String id = mr.getParameter("id");
         String realFilePath = realFilename.getPath();
         
         FreeboardVO vo = new FreeboardVO(0, subject, content, writeDate, 0, name, notice, picture, 0, id, realFilePath);
         FreeboardService.getInstance().insert(vo);
         
         response.sendRedirect("./JSP_freeboard/list.jsp");
         
      } catch (Exception e) {
         MultipartRequest mr = new MultipartRequest(request, fileurl, Maxsize, encType, policy);
         String picture = "";
         String subject = mr.getParameter("subject");
         Date writeDate = new Date();
         String content = mr.getParameter("content");
         String name = mr.getParameter("name");
         String notice = mr.getParameter("notice");
         String id = mr.getParameter("id");
         String realFilePath = "";
         
         FreeboardVO vo = new FreeboardVO(0, subject, content, writeDate, 0, name, notice, picture, 0, id, realFilePath);
         FreeboardService.getInstance().insert(vo);
         
         response.sendRedirect("./JSP_freeboard/list.jsp"); 
      }
   }
}










