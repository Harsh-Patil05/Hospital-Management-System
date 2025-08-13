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
import com.entity.Doctor;
import com.entity.User;

@WebServlet("/DoctorLogin")
public class DoctorLogin extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			
			HttpSession session=request.getSession();
			DoctorDao dao=new DoctorDao(DBConnect.getConn());
			Doctor d=dao.login(email, password);
			if(d!=null)
			{
				session.setAttribute("doctorObj", d);
				response.sendRedirect("doctor/index.jsp");
			}
			else
			{
				session.setAttribute("errorMsg", "Invalid Credentials");
				response.sendRedirect("doctor_login.jsp");
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
