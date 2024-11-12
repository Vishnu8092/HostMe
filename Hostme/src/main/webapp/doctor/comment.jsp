<%@page import="com.entity.Appointment"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Comment</title>
<%@include file="../component/allcss.jsp"%>

<style type="text/css">
.point-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: Linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("../img/back.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body>

	<%@include file="navbar.jsp"%>
	<c:if test="${ empty doctorObj }">
		<c:redirect url="../doctorLogin.jsp"></c:redirect>
	</c:if>

	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>

	<div class="container p-3">
		<div class="row">

			<div class="col-md-6 offset-md-3">
				<div class="card point-card">
					<div class="card-body">
						<p class="text-center fs-4">Patient Comment</p>

						<%
						int appoint_id= Integer.parseInt(request.getParameter("appoint_id"));
						AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
						
						Appointment ap = dao.getAppointmentById(appoint_id);
						
						%>
							
						<form action="../updateStatus" method="post" class="row">

							<div class="col-md-6">
								<label>Patient Name</label> <input type="text" readonly value="<%=ap.getFullName()%>"
									class="form-control">
							</div>

							<div class="col-md-6">
								<label>Age</label> <input type="text" readonly value="<%=ap.getAge()%>"
									class="form-control">
							</div>

							<div class="col-md-6">
								<br>
								<label>Mobile No</label> <input type="text" readonly value="<%=ap.getPhNo()%>"
									class="form-control">
							</div>

							<div class="col-md-6">
								<br>
								<label>Dieases</label> <input type="text" readonly value="<%=ap.getDiseases()%>"
									class="form-control">
							</div>


							<div class="col-md-12">
								<br>
								<label>Comment</label>
								<textarea required name="comm" class="form-control" rows="3"
									cols=""></textarea>
							</div>

							<input type="hidden" name="id" value="<%=ap.getId()%>"> <input
								type="hidden" name="docId" value="<%=ap.getDoctorId()%>">

							<button class="mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>

</body>
</html>