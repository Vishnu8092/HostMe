<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>!!Host Me!!</title>
<%@include file="component/allcss.jsp"%>

<style type="text/css">
.point-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
 <%@include file="component/navbar.jsp"%>

	<div class="markue" style="background-color: silver;">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<marquee behavior="scroll" direction="left"
						style="color: red; font-size: 25px;" onmouseover="this.stop();"
						onmouseout="this.start();">
						<b>Consulting Best Doctor:</b><a href="userAppointment.jsp"
							style="text-decoration: none; color: blue;"><strong>
								Click Here Book an appointment !</strong></a>
					</marquee>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>

	<!-- CAROUSEL PART -->
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
				<img src="img/dis1.jpg" class="d-block w-100" alt="img/dis1.jpg"
					height="600px">
			</div>
			<div class="carousel-item">
				<img src="img/dis2.png" class="d-block w-100" alt="img/dis2.png"
					height="600px">
			</div>
			<div class="carousel-item">
				<img src="img/dis3.jpg" class="d-block w-100" alt="img/dis3.jpg"
					height="600px">
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

	<!-- Details of Hospital-->
	<div class="container p-3">
		<p class="text-center fs-2"><b>Key Features of Our Hospital</b></p>
		<div class="row">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-md-6">
						<div class="card point-card">
							<div class="card-body">
								<p class="fs-4">100% Safety</p>
								<p>Your actions can save lives so do not be a bystander when it comes to safety.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card point-card">
							<div class="card-body">
								<p class="fs-4">Clean Environment</p>
								<p>Take care of the earth and she will take care of you.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card point-card">
							<div class="card-body">
								<p class="fs-4">Friendly Doctors</p>
								<p>Wherever the art of medicine is loved, there is also a love of humanity</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card point-card">
							<div class="card-body">
								<p class="fs-4">Medical Research</p>
								<p>Somewhere, something incredible is waiting to be known.</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<img alt="img/doctor.jpg" src="img/doctor.jpg"
					style="height: 310px; width: 230px;">
			</div>

		</div>
	</div>

	<!--Doctor List  -->
	<hr>

	<div class="container p-2">
		<p class="text-center fs-2"><b>Our Best Team</b></p>
		<div class="row">
			<div class="col-md-3">
				<div class="card point-card">
					<div class="card-body text-center">
						<img alt="img/doc1.jpg" src="img/doc1.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr.Shushila Kumari</p>
						<p class="fs-7">(CEO & Chairman)</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card point-card">
					<div class="card-body text-center">
						<img alt="img/doc2.png" src="img/doc2.png" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr.Rajendra Kumar</p>
						<p class="fs-7">(Child Doctor)</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card point-card">
					<div class="card-body text-center">
						<img alt="img/doc3.jpg" src="img/doc3.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr.Shiva Kumar</p>
						<p class="fs-7">(Child Doctor)</p>
					</div>
				</div>
			</div>
			
			<div class="col-md-3">
				<div class="card point-card">
					<div class="card-body text-center">
						<img alt="img/doc4.png" src="img/doc4.png" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr.Shri Devi</p>
						<p class="fs-7">(Child Doctor)</p>
					</div>
				</div>
			</div>
			
		</div>
	</div>






<!-- Footer Part -->
<%@include file="component/footer.jsp"%>

</body>
</html>