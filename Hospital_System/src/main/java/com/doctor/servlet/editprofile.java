package com.doctor.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;


@WebServlet("/editprofile")
public class editprofile extends HttpServlet {
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String fullname=request.getParameter("fullname");
			String dob=request.getParameter("dob");
			String qualification=request.getParameter("qualificaation");
			String specialist=request.getParameter("spec");
			String email=request.getParameter("email");
			String mobno=request.getParameter("mobno");
			
			int id=Integer.parseInt(request.getParameter("id"));
			Doctor d=new Doctor(id,fullname,dob,qualification,specialist,email,mobno,"");
			DoctorDao dao=new DoctorDao(DBConnect.getConn());
			HttpSession session=request.getSession();
			if(dao.editDoctor(d))
			{
				Doctor updateDoctor=dao.getDoctorById(id);
				session.setAttribute("sucMsgd", "Doctor profile updated Successfully!");
				session.setAttribute("doctorObj", updateDoctor);
				response.sendRedirect("doctor/editprofile.jsp");
			}
			else
			{
				session.setAttribute("errorMsgd", "Something went wrong!Try again.");
				response.sendRedirect("doctor/editprofile.jsp");
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
