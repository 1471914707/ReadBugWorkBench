package com.lin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.readbug.bean.Admins;
import com.readbug.linkDB.ReadBugDataBase;

/**
 * Servlet implementation class HandleAddModerator
 */
@WebServlet("/login/HandleAddModerator")
public class HandleAddModerator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleAddModerator() {
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
		request.setCharacterEncoding("utf8");
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String section = request.getParameter("section");
		List adminList = ReadBugDataBase.select(Admins.class, "account = '"+account+"'");
		if(adminList.size() != 0){
			request.setAttribute("tip", "该账号已存在");
			request.getRequestDispatcher("AddModerator.jsp").forward(request, response);
		}
		if(adminList.size() == 0){
			Admins admin = new Admins();
			admin.setAccount(account);
			admin.setPassword(password);
			admin.setName(name);
			if(section.equals("sport"))
				admin.setType(1);
			if(section.equals("life"))
				admin.setType(2);
			if(section.equals("study"))
				admin.setType(3);
			boolean isSave = ReadBugDataBase.save(admin);
			if(isSave){
				request.setAttribute("tip", "增加成功");
				request.getRequestDispatcher("AddModerator.jsp").forward(request, response);
			}
		}
	}

}
