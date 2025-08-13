<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="com.dao.SpecialistDao,com.entity.*,com.db.*,java.util.*,com.dao.DoctorDao"%>
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
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<p class="text-center fs-3">Change Password</p>
					<c:if test="${not empty sucMsg}">
                			<p class="text-center text-success fs-3">${sucMsg}</p>
                			<c:remove var="sucMsg" scope="session"/>
                		</c:if>
                		<c:if test="${not empty errorMsg}">
                			<p class="text-center text-danger fs-3">${errorMsg}</p>
                			<c:remove var="errorMsg" scope="session"/>
                		</c:if>
					<div class="card-body">
						<form action="../DoctorChangePassword" method="post">
							<div class="mb-3">
								<label>Enter New Password</label>
								<input type="text" name="newPassword" class="form-control" required>
							</div>
							<div class="mb-3">
								<label>Enter Old Password</label>
								<input type="text" name="oldPassword" class="form-control" required>
								
							</div>
							<input type="hidden" value="${doctorObj.id }" name="uid">
							<button class="btn btn-success col-md-12">Change Password</button>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-8">
				<div class="card paint-card">
				<p class="text-center fs-3">Edit Profile</p>
				<c:if test="${not empty sucMsgd}">
                			<p class="text-center text-success fs-3">${sucMsgd}</p>
                			<c:remove var="sucMsgd" scope="session"/>
                		</c:if>
                		<c:if test="${not empty errorMsgd}">
                			<p class="text-center text-danger fs-3">${errorMsgd}</p>
                			<c:remove var="errorMsgd" scope="session"/>
                		</c:if>
					<div class="card-body">
						
						<form action="../editprofile" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name:</label>
								<input type="text" class="form-control" required name="fullname" value="${doctorObj.fullname }">
							</div>
							<div class="mb-3">
								<label class="form-label">DOB</label>
								<input type="date" class="form-control" required name="dob" value="${doctorObj.dob }">
							</div>
							<div class="mb-3">
								<label class="form-label">Qualification</label>
								<input type="text" class="form-control" required name="qualificaation" value="${doctorObj.qualificaation }">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label>
								<select name="spec" required class="form-control">
									<option selected>${doctorObj.specialist }</option>
									<%
										SpecialistDao dao=new SpecialistDao(DBConnect.getConn());
										List<Specialist> list= dao.getAllSpecialist();
										for(Specialist s:list)
										{%>
											<option value="<%= s.getSpecialistName() %>"><%= s.getSpecialistName() %></option>
										<%}
									%>
								</select>
							</div>
							<div class="mb-3">
								<label class="form-label">Email</label>
								<input type="text" class="form-control" required name="email" readonly value="${doctorObj.email }">
							</div>
							<div class="mb-3">
								<label class="form-label">Mobile No.</label>
								<input type="text" class="form-control" required name="mobno" value="${doctorObj.mobno }">
							</div>
							<input type="hidden" name="id" value="${doctorObj.id }">
							<button type="submit" class="btn btn-primary">Submit</button>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>