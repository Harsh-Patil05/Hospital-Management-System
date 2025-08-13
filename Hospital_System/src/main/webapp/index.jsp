<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="com.db.DBConnect" %>
	<%@page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
<%@include file="component/allcss.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/Hosp_sys_1.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/Hos_sys_2.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/Hos_sys_3.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
		<div class="container p-3">
			<p class="text-center fs-2">Key Features of our Hospital</p>
			<div class="row">
				<div class="col-md-8 p-5">
					<div class="row">
						<div class="col-md-6">
							<div class="card paint-card">
								<div class="card body p-2">
									<p class="fs-5">Medical Facilities</p>
									<p>Hospitals are equipped with advanced diagnostic tools
										like MRI and CT scanners, state-of-the-art surgical
										instruments, and specialized departments (e.g., cardiology,
										oncology, pediatrics) to address diverse medical needs.</p>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="card paint-card">
								<div class="card body p-2">
									<p class="fs-5">Patient-Centered Care</p>
									<p>They aim to create a comfortable environment for
										patients, offering amenities like private rooms, attentive
										staff, and customized treatment plans that prioritize
										individual health and emotional well-being.</p>
								</div>
							</div>
						</div>
						<div class="col-md-6 mt-2">
							<div class="card paint-card">
								<div class="card body p-2">
									<p class="fs-5">Emergency Services</p>
									<p>Emergency departments operate 24/7, featuring
										ambulances, trauma care units, and skilled personnel trained
										to handle critical situations and urgent medical cases.</p>
								</div>
							</div>
						</div>
						<div class="col-md-6 mt-2">
							<div class="card paint-card">
								<div class="card body p-2">
									<p class="fs-5">Hygiene and Safety</p>
									<p>Hospitals maintain rigorous cleanliness standards and
										implement infection control measures, ensuring safe and
										sterile environments to protect patients, visitors, and staff.
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 mt-4">
					<img alt="..." src="img/Hos_sys_4.jpg">
				</div>
			</div>
		</div>
		<hr>
        <div class="container p-2">
        	<p class="text-center fs-2">Our Team</p>
        	<div class="row">
        		<div class="col-md-3">
        			<div class="card paint-card p-2">
        				<img src="img/Doc_1.webp" width="250px" height="300px">
        				<p class="fw-bold fs-5">Dr.Harsh Patil</p>
        				<p class="fs-7">(CEO and Chairman)</p>
        			</div>
        		</div>
        		<div class="col-md-3">
        			<div class="card paint-card p-2">
        				<img src="img/Doc_2.jpg" width="250px" height="300px">
        				<p class="fw-bold fs-5">Dr.Mathue Samuel</p>
        				<p class="fs-7">(Chief Doctor)</p>
        			</div>
        		</div>
        		<div class="col-md-3">
        			<div class="card paint-card p-2">
        				<img src="img/Doc_3.jpg" width="250px" height="300px">
        				<p class="fw-bold fs-5">Dr.Vishram Jagtap</p>
        				<p class="fs-7">(Chief Doctor)</p>
        			</div>
        		</div>
        		<div class="col-md-3">
        			<div class="card paint-card p-2">
        				<img src="img/Doc_4.jpg" width="250px" height="300px">
        				<p class="fw-bold fs-5">Dr.Marco Paul</p>
        				<p class="fs-7">(Chief Doctor)</p>
        			</div>
        		</div>
        	</div>
        </div>
	<%@include file="component/footer.jsp" %>
</body>
</html>