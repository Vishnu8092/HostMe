<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="com.entity.Doctor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp"%>

<style type="text/css">
.point-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	
	<c:if test="${ empty doctorObj }">
		<c:redirect url="../doctorLogin.jsp"></c:redirect>
	</c:if>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card point-card">
					<div class="card-body">
						<p class="fs-3 text-center">Patient Details</p>

						<c:if test="${not empty success}">
							<p class="text-center text-success fs-3">${success}</p>
							<c:remove var="success" scope="session" />
						</c:if>

						<c:if test="${not empty error}">
							<p class="text-center text-danger fs-5">${error}</p>
							<c:remove var="error" scope="session" />
						</c:if>

						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appoint Date</th>
									<th scope="col">Email</th>
									<th scope="col">Mobile No</th>
									<th scope="col">Diseases</th>
									<th scope="col">Status</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								Doctor d = (Doctor) session.getAttribute("doctorObj");
								AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
								List<Appointment> list = dao.getAllAppointmentByDoctorLogin(d.getId());
								for (Appointment ap : list) {
								%>
								<tr>
									<th><%=ap. getFullName()%></th>
									<th><%=ap.getGender() %></th>
									<th><%=ap.getAge() %></th>
									<th><%=ap.getAppoinDate() %></th>
									<th><%=ap.getEmail() %></th>
									<th><%=ap.getPhNo() %></th>
									<th><%=ap. getDiseases()%></th>
									<th><%=ap.getStatus() %></th>
									<th>
									
									<%
									if("Pending".equals(ap.getStatus())){%>
										
									<a href="comment.jsp?appoint_id=<%=ap.getId() %>" class="btn btn-success btn-sm">Comment</a>	
										
									<%}else{%>
										<a href="#" class="btn btn-success btn-sm disabled">Comment</a>
									<%}
									%>
									
									</th>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>