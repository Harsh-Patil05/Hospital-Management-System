<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.dao.SpecialistDao,com.entity.*,com.db.*,java.util.*,com.dao.DoctorDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp"%>
<style>
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="../component/navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center text-danger">Edit Doctor Details</p>
						<c:if test="${not empty sucMsg}">
                			<p class="text-center text-success fs-3">${sucMsg}</p>
                			<c:remove var="sucMsg" scope="session"/>
                		</c:if>
                		<c:if test="${not empty errorMsg}">
                			<p class="text-center text-danger fs-3">${errorMsg}</p>
                			<c:remove var="errorMsg" scope="session"/>
                		</c:if>
                		<%
                			int id=Integer.parseInt(request.getParameter("id"));
                			DoctorDao dao2=new DoctorDao(DBConnect.getConn());
                			Doctor d=dao2.getDoctorById(id);
                		%>
						<form action="../UpdateDoctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name:</label>
								<input type="text" class="form-control" required name="fullname" value="<%=d.getFullname() %>">
							</div>
							<div class="mb-3">
								<label class="form-label">DOB</label>
								<input type="date" class="form-control" required name="dob" value="<%=d.getDob() %>">
							</div>
							<div class="mb-3">
								<label class="form-label">Qualification</label>
								<input type="text" class="form-control" required name="qualificaation" value="<%=d.getQualificaation() %>">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label>
								<select name="spec" required class="form-control">
									<option selected><%=d.getSpecialist() %></option>
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
								<input type="text" class="form-control" required name="email" value="<%=d.getEmail() %>">
							</div>
							<div class="mb-3">
								<label class="form-label">Mobile No.</label>
								<input type="text" class="form-control" required name="mobno" value="<%=d.getMobno() %>">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label>
								<input type="text" class="form-control" required name="password" value="<%=d.getPassword() %>">
							</div>
							<button type="submit" class="btn btn-primary col-md-12">Update</button>
							<input type="hidden" name=id value="<%=d.getId() %>">
						</form>
					</div>
				</div>
			</div>
		</div>
	
	</div>

</body>
</html>