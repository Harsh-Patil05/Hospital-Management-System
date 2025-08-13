package com.doctor.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.DoctorDao;
import com.dao.UserDao;
import com.db.DBConnect;


@WebServlet("/DoctorChangePassword")
public class DoctorChangePassword extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int uid=Integer.parseInt(request.getParameter("uid"));
			String oldPassword=request.getParameter("oldPassword");
			String newPassword=request.getParameter("newPassword");
			
			DoctorDao dao=new DoctorDao(DBConnect.getConn());
			HttpSession session=request.getSession();
			if(dao.checkOldPassword(uid, oldPassword))
			{
				if(dao.changePassword(uid, newPassword))
				{
					session.setAttribute("sucMsg", "Password changed successfully!");
					response.sendRedirect("doctor/editprofile.jsp");
				}
				else
				{
					session.setAttribute("errorMsg", "Something went wrong!");
					response.sendRedirect("doctor/editprofile.jsp");
				}
			}else {
				session.setAttribute("errorMsg", "Old Password Incorrect!");
				response.sendRedirect("doctor/editprofile.jsp");
			}
		}

	}


