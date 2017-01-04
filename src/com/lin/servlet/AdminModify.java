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
 * Servlet implementation class AdminModify
 */
@WebServlet({ "/AdminModify", "/login/AdminModify" })
public class AdminModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminModify() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Admins admin = (Admins)request.getSession().getAttribute("admin");
		AdminType type = (AdminType)ReadBugDataBase.load(AdminType.class, admin.getType());
		String typeStr = type.getName();
		request.setAttribute("type", typeStr);
		request.setAttribute("admin_my", admin);
		request.getRequestDispatcher("/login/AdminModify.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
