<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Specalist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Doctor</title>
<%@include file="../component/allcss.jsp"%>

<style type="text/css">
.point-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container-fluid p-3">
		<div class="row">

			<div class="col-md-4 offset-md-4">
				<div class="card point-card">
					<div class="card-body">
						<p class="fs-3 text-center">Edit Doctor Details</p>

						<c:if test="${not empty error}">
							<p class="text-center text-danger fs-3">${error}</p>
							<c:remove var="error" scope="session" />
						</c:if>

						<c:if test="${not empty success}">
							<p class="text-center text-success fs-3" role="alert">${success}</p>
							<c:remove var="success" scope="session" />
						</c:if>

						<%
						int id=Integer.parseInt(request.getParameter("id"));
						DoctorDao dao2=new DoctorDao(DBConnect.getConn());
						Doctor d=dao2.getDoctorById(id);
						%>


						<form action="../updateDoctor" method="post">

							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									name="fullname" class="form-control" value="<%=d.getFullName() %>" required>
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									name="dob" class="form-control" value="<%=d.getDob() %>" required>
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> <input
									type="text" name="qualification" class="form-control" value="<%=d.getQualification() %>"required>
							</div>

							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="spec"
									class="form-control" required>
									<option><%=d.getSpecialist() %></option>
								
									<% SpecialistDao dao=new SpecialistDao(DBConnect.getConn());
									List<Specalist> list= dao.getAllSpecialist();
									for(Specalist s:list)
									{%>
										<option><%=s.getSpecailistName()%></option>
									<%
									}
									%>
								
								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label> <input type="text"
									name="email" class="form-control" value="<%=d.getEmail() %>" required>
							</div>

							<div class="mb-3">
								<label class="form-label">Mobile No</label> <input type="text"
									name="mobno" class="form-control" value="<%=d.getMobNo() %>" required>
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> <input
									type="text" name="password" class="form-control" value="<%=d.getPassword()%>" required>
							</div>
							
							<input type="hidden" name="id" value="<%=d.getId()%>">
							
							<div class="text-center mt-3">
							<button type="submit" class="btn btn-primary col-md-12">Update</button>
							</div>
						</form>

					</div>
				</div>
			</div>

			

		</div>
	</div>


</body>
</html>