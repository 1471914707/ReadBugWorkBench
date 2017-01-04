package com.lin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lin.util.Tab;
import com.readbug.bean.Admins;
import com.readbug.bean.Article;
import com.readbug.bean.Articletype;
import com.readbug.linkDB.ReadBugDataBase;

/**
 * Servlet implementation class GetDraftsList
 */
@WebServlet({ "/GetDraftsList", "/login/GetDraftsList" })
public class GetDraftsList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetDraftsList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Tab tab = new Tab();
		int index = 1;
		String indexString = request.getParameter("index");
		if (indexString != null)
			index = Integer.parseInt(indexString);
		tab.setIndex(index);
		//SELECT * FROM notices WHERE id ORDER BY time DESC LIMIT 0,1
		List DraftsList =  ReadBugDataBase.select(Article.class,"type=0 ORDER BY lastTime DESC LIMIT "+(index-1)*Tab.simpleNum+","+Tab.simpleNum);
		tab.setTotalCount(DraftsList.size());
		tab.setPageCount(tab.getTotalCount()%Tab.getSimplenum()==0?tab.getTotalCount()/Tab.getSimplenum():tab.getTotalCount()/Tab.getSimplenum()+1);
		int begin = index-Tab.getColnum()/2>=0?index-Tab.getColnum()/2:1;
		int end = index+Tab.getColnum()/2>tab.getPageCount()?tab.getPageCount():index+Tab.getColnum()/2;
		tab.setBegin(begin);
		tab.setEnd(end);
				
		request.setAttribute("DraftsList", DraftsList);
		request.setAttribute("Tab", tab);
		System.out.print("789");
		request.getRequestDispatcher("/login/DraftsList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
