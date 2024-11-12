<%@page import="com.db.DBConnect"%>
<%@page import="com.entity.Specalist"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.SpecialistDao"%>
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
	
	<div class="container p-4">
		<div class="row">
			<div class="col-md-4">
				<div class="card point-card">
					<p class="text-center fs-3"><span>Change Password</span></p>
					
					   <c:if test="${not empty success}">
							<p class="text-center text-success fs-3">${success}</p>
							<c:remove var="success" scope="session" />
						</c:if> 

						<c:if test="${not empty error}">
							<p class="text-center text-danger fs-5">${error}</p>
							<c:remove var="error" scope="session" />
						</c:if>
					
					<div class="card-body">

						<form action="../doctorChangePassword" method="post">

							<div class="mb-3">
								<label>Enter New Password</label> <input type="text"
									name="newPassword" class="form-control" required>
							</div>

							<div class="mb-3">
								<label>Enter Old Password</label> <input type="text"
									name="oldPassword" class="form-control" required>
							</div>
							<input type="hidden" value="${doctorObj.id}" name="uid">
							<button class="btn btn-success col-md-12">Change
								Password</button>
						</form>

					</div>
				</div>
			</div>
			
			<div class="col-md-5 offset-md-2">
			<div class="card point-card">
			<p class="text-center fs-3"><span>Edit Profile</span></p>
			
			<c:if test="${not empty successd}">
							<p class="text-center text-success fs-3">${successd}</p>
							<c:remove var="successd" scope="session" />
						</c:if> 

						<c:if test="${not empty errord}">
							<p class="text-center text-danger fs-5">${errord}</p>
							<c:remove var="errord" scope="session" />
						</c:if>
			
			<div class="card-body">
			
			<form action="../doctorUpdateProfile" method="post">

							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									name="fullname" class="form-control" value="${doctorObj.fullName}" required>
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									name="dob" class="form-control" value="${doctorObj.dob}" required>
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> <input
									type="text" name="qualification" class="form-control" value="${doctorObj.qualification}" required>
							</div>

							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="spec"
									class="form-control" required>
									<option>${doctorObj.specialist}</option>
								
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
								<label class="form-label">Email</label> <input type="email"
									name="email" readonly class="form-control" value="${doctorObj.email}"  required>
							</div>

							<div class="mb-3">
								<label class="form-label">Mobile No</label> <input type="text"
									name="mobno" class="form-control" value="${doctorObj.mobNo}" required>
							</div>

							<div class="text-center mt-3">
							<input type="hidden" name="id" value="${doctorObj.id }">
							<button type="submit" class="btn btn-primary">Update</button>
							</div>
						</form>
			
			</div>
			</div>
			</div>
			
		</div>
	</div>


</body>
</html>