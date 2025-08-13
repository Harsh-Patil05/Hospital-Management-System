package com.user.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.AppointmentDao;
import com.db.DBConnect;
import com.entity.Appointment;

@WebServlet("/AppointmentServlet")
public class AppointmentServlet extends HttpServlet {
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId=Integer.parseInt(request.getParameter("userId"));
		String fullname=request.getParameter("fullname");
		String gender=request.getParameter("gender");
		String age=request.getParameter("age");
		String appointDate=request.getParameter("appointDate");
		String email=request.getParameter("email");
		String phno=request.getParameter("phno");
		String diseases=request.getParameter("diseases");
		int docId=Integer.parseInt(request.getParameter("doct"));
		String address=request.getParameter("address");

		
		Appointment ap=new Appointment(userId,fullname,gender,age,appointDate,email,phno,diseases,docId,address,"Pending");
		AppointmentDao dao=new AppointmentDao(DBConnect.getConn());
		HttpSession session = request.getSession();
		if(dao.addAppointment(ap))
		{
			session.setAttribute("sucMsg", "Appointment successful!");
			response.sendRedirect("user_appointment.jsp");
		}
		else
		{
			session.setAttribute("errorMsg","Something went Wrong!");
			response.sendRedirect("user_appointment.jsp");
		}
		
		
	}

}
