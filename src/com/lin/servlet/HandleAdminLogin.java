package com.lin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
 * Servlet implementation class HandleAdminLogin
 */
@WebServlet("/HandleAdminLogin")
public class HandleAdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleAdminLogin() {
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
		Admins admin = null;
		RequestDispatcher dispatcher = null;
		HttpSession session = request.getSession();
		
		String account = request.getParameter("account").trim();
		String password = request.getParameter("password").trim();

		if (account.length() < 1 || password.length() < 6){
			request.setAttribute("tip", "账号为空或密码长度过短");
			dispatcher = request.getRequestDispatcher("/AdminLogin.jsp");
			dispatcher.forward(request, response);
		}	
		List adminList = ReadBugDataBase.select(Admins.class, "account="+account);

		if (adminList.size() == 0){
			request.setAttribute("tip", "不存在该账号");
			dispatcher = request.getRequestDispatcher("/AdminLogin.jsp");
		}else{
			admin = (Admins) adminList.get(0);
			if (!admin.getPassword().equals(password)){
				request.setAttribute("tip", "密码错误");
				dispatcher = request.getRequestDispatcher("/AdminLogin.jsp");
			}else{
				session.setAttribute("admin", admin);
				dispatcher = request.getRequestDispatcher("/login/index.jsp");
			}
		}
		dispatcher.forward(request, response);
	}

}
