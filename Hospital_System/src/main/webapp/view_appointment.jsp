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
<%@include file="../component/allcss.jsp" %>
</head>
<body>
	<%@ include file="../component/navbar.jsp" %>
	<c:if test="${empty userObj}">
		<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-9 p-5">
				<div class="paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center text-success">Appointment List</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appoint Date</th>
									<th scope="col">Diseases</th>
									<th scope="col">Doctor Name</th>
									<th scope="col">Status</th>
								</tr>
							</thead>
							<tbody>
							<%
								User user=(User) session.getAttribute("userObj");
								AppointmentDao dao=new AppointmentDao(DBConnect.getConn());
								DoctorDao dao2=new DoctorDao(DBConnect.getConn());
								List<Appointment> list =dao.getAllAppointmentByLoginUser(user.getId());
								for(Appointment ap :list){
									Doctor d=dao2.getDoctorById(ap.getDocId());
								
							%>
								<tr>
									<th><%=ap.getFullname() %></th>
									<td><%=ap.getGender() %></td>
									<td><%=ap.getAge() %></td>
									<td><%=ap.getAppointDate() %></td>
									<td><%=ap.getDiseases() %></td>
									<td><%=d.getFullname()%></td>
									<td><%
										if("Pending".equals(ap.getStatus()))
										{%>
											<a href="#" class="btn btn-sm btn-warning">Pending</a>
										<%}else{%>
											
										<%}
									%></td>
								</tr>
								<% }%>
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-3 p-3">
				<img alt="..." src="img/Hos_sys_4.jpg">
			</div>
		</div>
	</div>
</body>
</html>