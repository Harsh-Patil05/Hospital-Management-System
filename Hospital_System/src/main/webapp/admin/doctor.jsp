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
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center text-danger">Add Doctor</p>
						<c:if test="${not empty sucMsg}">
                			<p class="text-center text-success fs-3">${sucMsg}</p>
                			<c:remove var="sucMsg" scope="session"/>
                		</c:if>
                		<c:if test="${not empty errorMsg}">
                			<p class="text-center text-danger fs-3">${errorMsg}</p>
                			<c:remove var="errorMsg" scope="session"/>
                		</c:if>
						<form action="../AddDoctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name:</label>
								<input type="text" class="form-control" required name="fullname">
							</div>
							<div class="mb-3">
								<label class="form-label">DOB</label>
								<input type="date" class="form-control" required name="dob">
							</div>
							<div class="mb-3">
								<label class="form-label">Qualification</label>
								<input type="text" class="form-control" required name="qualificaation">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label>
								<select name="spec" required class="form-control">
									<option selected>..Select..</option>
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
								<input type="text" class="form-control" required name="email">
							</div>
							<div class="mb-3">
								<label class="form-label">Mobile No.</label>
								<input type="text" class="form-control" required name="mobno">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label>
								<input type="password" class="form-control" required name="password">
							</div>
							<button type="submit" class="btn btn-primary">ADD</button>
							
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-8">
				<div class="card-body paint-card">
					<p class="fs-3 text-center">Doctor Details</p>
					<table class="table">
						<thead>
							<tr>
								<th scope="col">Full Name</th>
								<th scope="col">DOB</th>
								<th scope="col">Qualification</th>
								<th scope="col">Specialist</th>
								<th scope="col">Email</th>
								<th scope="col">Mobile no</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<% 
								DoctorDao dao2=new DoctorDao(DBConnect.getConn());
								List<Doctor> list2=dao2.getAllDoctor();
								for(Doctor d:list2)
								{%>
									<tr>
										<td><%=d.getFullname() %></td>
										<td><%=d.getDob() %></td>
										<td><%=d.getQualificaation() %></td>
										<td><%=d.getSpecialist() %></td>
										<td><%=d.getEmail() %></td>
										<td><%=d.getMobno() %></td>
										<td>
											<a href="editdoctor.jsp?id=<%=d.getId()%>" class="btn btn-primary">Edit</a><a href="#" class="btn btn-danger">Delete</a>
										</td>
									</tr>
								<%}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	
	</div>

</body>
</html>