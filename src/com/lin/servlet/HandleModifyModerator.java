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
 * Servlet implementation class HandleModifyModerator
 */
@WebServlet("/login/HandleModifyModerator")
public class HandleModifyModerator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleModifyModerator() {
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
		int i= 0;
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String section = request.getParameter("section");
		if(section.equals("sport")) i = 1;
		if(section.equals("life"))	 i = 2;
		if(section.equals("study"))i = 3;
		List moderatorList = ReadBugDataBase.select(Admins.class, "account='"+account+"'");
		if(moderatorList.size()!=0){
			request.getSession().setAttribute("tip", "改账号已存在");
			request.getRequestDispatcher("ModifyModerator.jsp").forward(request, response);
		}
		if(moderatorList.size() == 0){
			Admins admin = (Admins)request.getSession().getAttribute("moderator");
			admin.setAccount(account);
			admin.setName(name);
			admin.setPassword(password);
			admin.setType(i);
			boolean isUpdate = ReadBugDataBase.update(admin);
			int adminId = admin.getId();
			if(isUpdate){
				request.getSession().setAttribute("Mtip", "修改成功");
				response.sendRedirect("HandleGetModeratorDetail?id="+adminId);
			}
		}
	}

}
