<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="com.dao.SpecialistDao,com.entity.*,com.db.*,java.util.*,com.dao.DoctorDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
<title>Insert title here</title>
<%@include file="allcss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp" %>
	<% response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
		if(session.getAttribute("AdminObj")==null)
		{
			response.sendRedirect("admin_login.jsp");
		}
	%>
	<c:if test="${empty AdminObj}">
	 <c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>
	<%
		DoctorDao dao = new DoctorDao(DBConnect.getConn());
	%>
      <div class="container p-2">
        	<p class="text-center fs-2">Our Team</p>
        	<div class="row">
        		<div class="col-md-4">
        			<div class="card paint-card p-2">
        			 <div class="card-body text-center">
        			 <i class="fa-solid fa-user-doctor fa-3x"></i>
        				<p class="fw-bold fs-5 text-center text-success">Doctor</p>
        				<p class="fs-7 text-center"><%=dao.countDoctor() %></p>
        			</div>
        			</div>
        		</div>
        		<div class="col-md-4">
        			<div class="card paint-card p-2">
        			  <div class="card-body text-center">
        			  <i class="fa-solid fa-user fa-3x"></i>
        				<p class="fw-bold fs-5 text-center text-success">User</p>
        				<p class="fs-7 text-center"><%=dao.countUser()%></p>
        			</div>
        			</div>
        		</div>
        		<div class="col-md-4">
        			<div class="card paint-card p-2">
        			<div class="card-body text-center">
        			<i class="fa-solid fa-calendar-check fa-3x"></i>
        				<p class="fw-bold fs-5 text-center text-success">Total Appointments</p>
        				<p class="fs-7 text-center"><%=dao.countAppointment()%></p>
        			</div>
        			</div>
        		</div>
        		<div class="col-md-4 mt-4" data-bs-toggle="modal" data-bs-target="#exampleModal">
        			<div class="card paint-card p-2">
        			<div class="card-body text-center">
        			<i class="fa-solid fa-brain fa-3x"></i>
        				<p class="fw-bold fs-5 text-center text-success">Specialists</p>
        				<p class="fs-7 text-center"><%=dao.countSpecialist()%></p>
        			</div>
        			<c:if test="${not empty sucMsg}">
                			<p class="text-center text-success fs-3">${sucMsg}</p>
                			<c:remove var="sucMsg" scope="session"/>
                		</c:if>
                		<c:if test="${not empty errorMsg}">
                			<p class="text-center text-danger fs-3">${errorMsg}</p>
                			<c:remove var="errorMsg" scope="session"/>
                		</c:if>
        			</div>
        		</div>
        	</div>
        </div>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Add specialist</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		         <form action="../AddSpecialist" method="post">
		         	<div class="form group">
		         		<label>Enter Specialist Name: </label>
		         		<input type="text" name="specName" class="form-control"></input>
		         	</div>
		         	<div class="text-center mt-3">
		         		<button type="submit" class="btn btn-primary">Add</button>
		         	</div>
		         </form>
		      </div>
		      
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Add</button>
		      </div>
		    </div>
		  </div>
		</div>
</body>
</html>