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
import com.entity.User;


@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			
			HttpSession session=request.getSession();
			UserDao dao=new UserDao(DBConnect.getConn());
			User user=dao.Login(email, password);
			if(user!=null)
			{
				session.setAttribute("userObj", user);
				response.sendRedirect("index.jsp");
			}
			else
			{
				session.setAttribute("errorMsg", "Invalid Credentials");
				response.sendRedirect("user_login.jsp");
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
