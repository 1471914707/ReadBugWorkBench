package com.lin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.readbug.bean.AdminType;
import com.readbug.bean.Admins;
import com.readbug.linkDB.ReadBugDataBase;

/**
 * Servlet implementation class HandleGetModeratorDetail
 */
@WebServlet("/login/HandleGetModeratorDetail")
public class HandleGetModeratorDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleGetModeratorDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("1");
		String str_id = request.getParameter("id");
		int id = Integer.parseInt(str_id);
		Admins moderator = (Admins)ReadBugDataBase.load(Admins.class, id);
		AdminType Type = (AdminType) ReadBugDataBase.load(AdminType.class, moderator.getType());
		request.getSession().setAttribute("type", Type.getName());
		request.getSession().setAttribute("moderator", moderator);
		request.getRequestDispatcher("ModeratorDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
