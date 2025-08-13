package com.admin.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.SpecialistDao;
import com.db.DBConnect;
import com.entity.User;


@WebServlet("/AddSpecialist")
public class AddSpecialist extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String specName=request.getParameter("specName");
		SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
		boolean f=dao.AddSpecialist(specName);
		
		HttpSession session = request.getSession();
		if(f)
		{
			session.setAttribute("sucMsg","Specialist Added!");
			response.sendRedirect("admin/index.jsp");
		}
		else
		{
			session.setAttribute("errorMsg", "Something Wrong on server!");
			response.sendRedirect("admin/index.jsp");
		}
	}

}
