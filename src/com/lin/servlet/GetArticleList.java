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
 * Servlet implementation class GetArticleList
 */
@WebServlet("/login/GetArticleList")
public class GetArticleList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetArticleList() {
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
		List NewList =  ReadBugDataBase.select(Article.class,"type="+((Admins)request.getSession().getAttribute("admin")).getType()+" ORDER BY lastTime DESC LIMIT "+(index-1)*Tab.simpleNum+","+Tab.simpleNum);
		tab.setTotalCount(ReadBugDataBase.Count(Article.class));
		tab.setPageCount(tab.getTotalCount()%Tab.getSimplenum()==0?tab.getTotalCount()/Tab.getSimplenum():tab.getTotalCount()/Tab.getSimplenum()+1);
		int begin = index-Tab.getColnum()/2>=0?index-Tab.getColnum()/2:1;
		int end = index+Tab.getColnum()/2>tab.getPageCount()?tab.getPageCount():index+Tab.getColnum()/2;
		tab.setBegin(begin);
		tab.setEnd(end);
		int num = NewList.size();
		StringBuffer sb = new StringBuffer();
		for (int i=0; i<num; i++){
			sb.append(((Admins)ReadBugDataBase.load(Admins.class, ((Article)NewList.get(i)).getUserId())).getName()+"&");
		}
		List typeList = ReadBugDataBase.list(Articletype.class);
		num =  typeList.size();
		String[] types = new String[num];
		for (int i=0; i<num; i++){
			Articletype type = (Articletype) typeList.get(i);
			types[i] = type.getName();
		}
				
		request.setAttribute("types",types);
		request.setAttribute("NewList", NewList);
		request.setAttribute("Tab", tab);
		request.setAttribute("sbs",sb);
		
		request.getRequestDispatcher("/login/NewList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
