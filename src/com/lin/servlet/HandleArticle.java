package com.lin.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.readbug.bean.Admins;
import com.readbug.bean.Article;
import com.readbug.linkDB.ReadBugDataBase;

/**
 * Servlet implementation class HandleArticle
 */
@WebServlet({ "/HandleArticle", "/login/HandleArticle" })
public class HandleArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleArticle() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String[] setdraft = request.getParameterValues("setdraft");
		Admins admin = (Admins)request.getSession().getAttribute("admin");
		if(setdraft == null)
		{
			System.out.print("123");
			Article draft = new Article();
			draft.setType(admin.getType());//存储为新闻
			draft.setContent(request.getParameter("content"));
			draft.setTitle(request.getParameter("title"));
			draft.setUserId(admin.getId());
			Date date = new Date();
			SimpleDateFormat ds = new SimpleDateFormat("yyyy-MM-dd HH:mm");		
			draft.setLastTime(ds.format(date));
			ReadBugDataBase.save(draft);
			response.sendRedirect(request.getContextPath()+"/login/GetArticleList");
			return;
		}
		if(setdraft[0].equals("setdraft"))
		{
			if(request.getParameter("draftId") == "")
			{
				Article draft = new Article();
				draft.setType(0);//存储为草稿
				draft.setContent(request.getParameter("content"));
				draft.setTitle(request.getParameter("title"));
				draft.setUserId(admin.getId());
				Date date = new Date();
				SimpleDateFormat ds = new SimpleDateFormat("yyyy-MM-dd HH:mm");		
				draft.setLastTime(ds.format(date));
				ReadBugDataBase.save(draft);
				response.sendRedirect(request.getContextPath()+"/login/GetDraftsList");
			}
			else
			{
				System.out.print(request.getParameter("draftId"));
				Article draft = (Article) ReadBugDataBase.load(Article.class, Integer.parseInt(request.getParameter("draftId")));
				draft.setContent(request.getParameter("content"));
				draft.setTitle(request.getParameter("title"));
				Date date = new Date();
				SimpleDateFormat ds = new SimpleDateFormat("yyyy-MM-dd HH:mm");		
				draft.setLastTime(ds.format(date));
				ReadBugDataBase.update(draft);
				response.sendRedirect(request.getContextPath()+"/login/GetDraftsList");
			}
		}
	}

}
