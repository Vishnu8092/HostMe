<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment Book</title>
<%@include file="component/allcss.jsp"%>

<style type="text/css">
.point-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: Linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("img/back.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>

</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 p-5">
				<img alt="img/appoint.png" src="img/appoint.png">
			</div>

			<div class="col-md-6">
				<div class="card point-card">
					<div class="card-body">
						<p class="text-center fs-3">User Appointment</p>

						<c:if test="${not empty error}">
							<p class="text-center text-danger fs-5">${error}</p>
							<c:remove var="error" scope="session" />
						</c:if>
						<c:if test="${not empty success}">
							<p class="text-center text-success fs-3">${success}</p>
							<c:remove var="success" scope="session" />
						</c:if>

						<form action="addAppointment" method="post" class="row g-3">

							<input type="hidden" name="userid" value="${userObj.id }">

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Full Name</label> <input
									type="text" class="form-control" name="fullname" required>
							</div>

							<div class="col-md-6">
								<label>Gender</label><select class="form-control" name="gender"
									required>
									<option value="male">Male</option>
									<option value="female">Femail</option>
								</select>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Age</label> <input
									type="number" class="form-control" name="age" required>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Appointment
									Date</label> <input type="date" class="form-control"
									name="appoint_date" required>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Email</label> <input
									type="email" class="form-control" name="email" required>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Mobile No</label> <input
									type="number" class="form-control" name="mobile" required>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Diseases</label> <input
									type="text" class="form-control" name="diseases" required>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Doctor</label> <select
									class="form-control" name="doctor" required>
									<option value="">--Select--</option>
									
									
									<%
									DoctorDao dao=new DoctorDao(DBConnect.getConn());
										List<Doctor>list = dao.getAllDoctor();
										for(Doctor d:list){
											%>
											<option value="<%=d.getId() %>"><%=d.getFullName() %>(<%=d.getSpecialist() %>)</option>
											<% 
										}
									%>
									
									
								</select>
							</div>

							<div class="col-md-12">
								<label>Full Address</label>
								<textarea rows="3" cols="" name="address" required></textarea>
							</div>

							<c:if test="${empty userObj }">
								<a href="userLogin.jsp"
									class="col-md-6 offset-md-3 btn btn-success">Submit</a>
							</c:if>
							<c:if test="${not empty userObj }">
								<button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
							</c:if>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>