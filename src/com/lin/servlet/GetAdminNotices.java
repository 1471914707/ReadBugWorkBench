package com.lin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lin.util.Tab;
import com.readbug.bean.Notices;
import com.readbug.linkDB.ReadBugDataBase;

/**
 * Servlet implementation class GetAdminNotices
 */
@WebServlet("/GetAdminNotices")
public class GetAdminNotices extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAdminNotices() {
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
			List noticelist =  ReadBugDataBase.select(Notices.class,"id ORDER BY time DESC LIMIT "+(index-1)*Tab.simpleNum+","+Tab.simpleNum);
			
			tab.setTotalCount(noticelist.size());
			tab.setPageCount(tab.getTotalCount()%Tab.getSimplenum()==0?tab.getTotalCount()/Tab.getSimplenum():tab.getTotalCount()/Tab.getSimplenum()+1);
			int begin = index-Tab.getColnum()/2>=0?index-Tab.getColnum()/2:1;
			int end = index+Tab.getColnum()/2>tab.getPageCount()?tab.getPageCount():index+Tab.getColnum()/2;
			tab.setBegin(begin);
			tab.setEnd(end);
			
			request.setAttribute("noticeList", noticelist);
			request.setAttribute("Tab", tab);
			request.getRequestDispatcher("/login/NoticeMain.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}

}
