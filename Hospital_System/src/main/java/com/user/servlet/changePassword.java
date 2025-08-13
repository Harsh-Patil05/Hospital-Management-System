package com.user.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.UserDao;
import com.db.DBConnect;


@WebServlet("/changePassword")
public class changePassword extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid=Integer.parseInt(request.getParameter("uid"));
		String oldPassword=request.getParameter("oldPassword");
		String newPassword=request.getParameter("newPassword");
		
		UserDao dao=new UserDao(DBConnect.getConn());
		HttpSession session=request.getSession();
		if(dao.checkOldPassword(uid, oldPassword))
		{
			if(dao.changePassword(uid, newPassword))
			{
				session.setAttribute("sucMsg", "Password changed successfully!");
				response.sendRedirect("changepassword.jsp");
			}
			else
			{
				session.setAttribute("errorMsg", "Something went wrong!");
				response.sendRedirect("changepassword.jsp");
			}
		}else {
			session.setAttribute("errorMsg", "Old Password Incorrect!");
			response.sendRedirect("changepassword.jsp");
		}
	}

}
