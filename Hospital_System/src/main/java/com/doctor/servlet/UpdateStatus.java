package com.doctor.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.AppointmentDao;
import com.db.DBConnect;


@WebServlet("/UpdateStatus")
public class UpdateStatus extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(request.getParameter("id"));
			int did=Integer.parseInt(request.getParameter("did"));
			String comm=request.getParameter("comm");
			AppointmentDao dao=new AppointmentDao(DBConnect.getConn());
			HttpSession session=request.getSession();
			if(dao.updateCommentStatus(id, did, comm))
			{
				session.setAttribute("sucMsg", "Comment Uploaded!");
				response.sendRedirect("doctor/patient.jsp");
			}
			else
			{
				session.setAttribute("errorMsg","Something went wrong!");
				response.sendRedirect("doctor/patient.jsp");
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
