<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="com.dao.SpecialistDao,com.entity.*,com.db.*,java.util.*,com.dao.AppointmentDao,com.dao.DoctorDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.paint-card {
box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
<%@ include file="../component/allcss.jsp" %>
</head>
<body>
	<c:if test="${empty doctorObj}">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>
	 <%@ include file="navbar.jsp" %>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Patient Details</p>
						<c:if test="${not empty sucMsg}">
                			<p class="text-center text-success fs-3">${sucMsg}</p>
                			<c:remove var="sucMsg" scope="session"/>
                		</c:if>
                		<c:if test="${not empty errorMsg}">
                			<p class="text-center text-danger fs-3">${errorMsg}</p>
                			<c:remove var="errorMsg" scope="session"/>
                		</c:if>
                		<table class="table">
                			<thead>
                				<tr>
                					<th scope="col">Full Name</th>
                					<th scope="col">Gender</th>
                					<th scope="col">Age</th>
                					<th scope="col">Appointment Date</th>
                					<th scope="col">Email</th>
                					<th scope="col">Mob No</th>
                					<th scope="col">Diseases</th>
                					<th scope="col">Status</th>
                					<th scope="col">Action</th>
                				</tr>
                			</thead>
                			<tbody>
                			<%
                				Doctor d=(Doctor) session.getAttribute("doctorObj");
                				AppointmentDao dao=new AppointmentDao(DBConnect.getConn());
                				List<Appointment> list=dao.getAllAppointmentByDoctorUser(d.getId());
                				for(Appointment ap:list){
                			%>
                				<tr>
                					<th><%=ap.getFullname() %></th>
                					<td><%=ap.getGender() %></td>
                					<td><%=ap.getAge() %></td>
                					<td><%=ap.getAppointDate() %></td>
                					<td><%=ap.getEmail() %></td>
                					<td><%=ap.getPhno() %></td>
                					<td><%=ap.getDiseases() %></td>
                					<td><%=ap.getStatus() %></td>
                					<td>
                					<%
                						if("Pending".equals(ap.getStatus()))
                								{%>
                								<a href="comment.jsp?id=<%=ap.getId() %>" class="btn btn-success btn-sm">Comment</a>
                								<%}else{%>
                									<a href="#" class="btn btn-success btn-sm disabled">Comment</a>
                									
                								<%}%>
                					</td>
                				</tr>
                				 <%}%>
                			</tbody>
                		</table>
                		
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>