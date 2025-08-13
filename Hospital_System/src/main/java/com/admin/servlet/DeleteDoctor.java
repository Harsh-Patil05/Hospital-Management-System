package com.admin.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.DoctorDao;
import com.db.DBConnect;

@WebServlet("/DeleteDoctor")
public class DeleteDoctor extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		DoctorDao dao=new DoctorDao(DBConnect.getConn());
		HttpSession session=request.getSession();
		if(dao.deleteDoctor(id))
		{
			session.setAttribute("sucMsg", "Doctor deleted Successfully!");
			response.sendRedirect("admin/viewDoctor.jsp");
		}
		else
		{
			session.setAttribute("errorMsg", "Something went wrong!");
			response.sendRedirect("admin/viewDoctor.jsp");
		}
	}

}
