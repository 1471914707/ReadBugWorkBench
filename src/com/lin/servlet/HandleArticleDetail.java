package com.lin.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.readbug.bean.Admins;
import com.readbug.bean.Article;
import com.readbug.linkDB.ReadBugDataBase;

/**
 * Servlet implementation class HandleArticleDetail
 */
@WebServlet({ "/HandleArticleDetail", "/login/HandleArticleDetail" })
public class HandleArticleDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleArticleDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = null;
		String author;
		Article article = (Article) ReadBugDataBase.load(Article.class, request.getParameter("articleId"));
		author = ((Admins)ReadBugDataBase.load(Admins.class,article.getUserId())).getName();
		request.setAttribute("article", article);
		request.setAttribute("author", author);
		dispatcher = request.getRequestDispatcher("/login/ArticleDetail.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
