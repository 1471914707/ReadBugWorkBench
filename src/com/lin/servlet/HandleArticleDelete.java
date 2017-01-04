package com.lin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.readbug.bean.Article;
import com.readbug.linkDB.ReadBugDataBase;

/**
 * Servlet implementation class HandleArticleDelete
 */
@WebServlet({ "/HandleArticleDelete", "/login/HandleArticleDelete" })
public class HandleArticleDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleArticleDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		boolean success = ReadBugDataBase.delete(Article.class, Integer.parseInt(request.getParameter("articleId")));
		if(success)
		{
			System.out.print("删除新闻成功！！");
			response.sendRedirect(request.getContextPath()+"/login/GetArticleList");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
