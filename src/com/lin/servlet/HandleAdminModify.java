package com.lin.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.readbug.bean.Admins;
import com.readbug.linkDB.ReadBugDataBase;

/**
 * Servlet implementation class HandleAdminModify
 */
@WebServlet({ "/HandleAdminModify", "/login/HandleAdminModify" })
public class HandleAdminModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleAdminModify() {
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
		Admins admin = new Admins();
		RequestDispatcher dispatcher = null;
		HttpSession session = request.getSession();
		
		String account = request.getParameter("account").trim();
		String password = request.getParameter("password").trim();
		String name = request.getParameter("name").trim();
		Integer isactive = Integer.parseInt(request.getParameter("isactive"));
		Integer type = Integer.parseInt(request.getParameter("type"));
		
		admin.setId(Integer.parseInt(request.getParameter("id")));
		admin.setAccount(account);
		admin.setPassword(password);
		admin.setName(name);
		admin.setIsactive(isactive);
		admin.setType(type);
		
		ReadBugDataBase.update(admin);
		session.setAttribute("admin", admin);
		response.sendRedirect(request.getContextPath()+"/login/GetAdminInfo");
	}

}
