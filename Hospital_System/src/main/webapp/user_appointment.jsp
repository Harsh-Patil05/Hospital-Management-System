<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="com.dao.SpecialistDao,com.entity.*,com.db.*,java.util.*,com.dao.DoctorDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Appointment</title>
<style>
.paint-card {
box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
<%@include file="component/allcss.jsp" %>
</head>
<body>
	<%@ include file="component/navbar.jsp" %>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 p-5">
				<img alt="..." src="img/Hos_sys_4.jpg">
			</div>
			<div class="col-md-6 p-3">
				<div class="card paint-card p-3">
					<div class="card-body">
						<p class="text-center text-danger fs-3">User Appointment</p> 
					</div>
						<c:if test="${not empty sucMsg}">
                			<p class="text-center text-success fs-3">${sucMsg}</p>
                			<c:remove var="sucMsg" scope="session"/>
                		</c:if>
                		<c:if test="${not empty errorMsg}">
                			<p class="text-center text-danger fs-3">${errorMsg}</p>
                			<c:remove var="errorMsg" scope="session"/>
                		</c:if>
					<form class="row g-3" action="AppointmentServlet" method="post">
						<input type="hidden" name="userId" value="${userObj.id }">
						<div class="col-md-6">
							<label class="form-label">Full Name</label>
							<input required type="text" class="form-control" name="fullname">
						</div>
						<div class="col-md-6">
							<label class="form-label">Gender</label>
							<select class="form-control" name="gender" required>
								<option value="male">Male</option>
								<option value="female">Female</option>
							</select>
						</div>
						<div class="col-md-6">
							<label class="form-label">Age</label>
							<input required type="number" class="form-control" name="age">
						</div>
						<div class="col-md-6">
							<label class="form-label">Appointment Date</label>
							<input required type="date" class="form-control" name="appointDate">
						</div>
						<div class="col-md-6">
							<label class="form-label">Email</label>
							<input required type="email" class="form-control" name="email">
						</div>
						<div class="col-md-6">
							<label class="form-label">Phone no.</label>
							<input required type="number" class="form-control" name="phno">
						</div>
						<div class="col-md-6">
							<label class="form-label">Diseases</label>
							<input required type="text" class="form-control" name="diseases">
						</div>
						<div class="col-md-6">
							<label class="form-label">Doctor</label>
							<select required class="form-control" name="doct">
								<option value="" selected>--select--</option>
								<%
									DoctorDao dao=new DoctorDao(DBConnect.getConn());
									List<Doctor> list=dao.getAllDoctor();
									for(Doctor d:list)
									{%>
										<option value="<%=d.getId() %>"><%=d.getFullname() %>(<%=d.getSpecialist() %>)</option>
									<%}
								%>
							</select>
						</div>
						<div class="col-md-12">
							<label>Full Address</label>
							<textarea required name="address" class="form-control" rows="3" cols=""></textarea>
						</div>
						<c:if test="${empty userObj }">
							<a href="user_login.jsp" class="col-md-6 offset-md-3 btn btn-success">Submit</a>
						</c:if>
						<c:if test="${not empty userObj }">
							<button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
						</c:if>
					</form>
				</div>
			</div>
		</div>
	</div>	 
</body>
</html>