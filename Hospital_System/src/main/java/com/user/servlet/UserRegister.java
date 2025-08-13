package com.user.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;


@WebServlet("/UserRegister")
public class UserRegister extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String fullname=request.getParameter("name");
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			
			User u = new User(fullname,email,password);
			UserDao dao=new UserDao(DBConnect.getConn());
			HttpSession session=request.getSession();
			boolean f=dao.UserRegister(u);
			if(f)
			{
				session.setAttribute("sucMsg","Registered Successfully");
				response.sendRedirect("signup.jsp");
			}
			else
			{
				session.setAttribute("errorMsg","Something went wrong!");
				response.sendRedirect("signup.jsp");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
