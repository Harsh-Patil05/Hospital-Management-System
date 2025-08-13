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
			<div class="col-md-12">
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
											<a href="editdoctor.jsp?id=<%=d.getId()%>" class="btn btn-primary">Edit</a><a href="../DeleteDoctor?id=<%=d.getId() %>" class="btn btn-danger">Delete</a>
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