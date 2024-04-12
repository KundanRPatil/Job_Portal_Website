<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Jobs</title>
<%@include file="all_components/all_css.jsp"%>
</head>
<body>

	<c:if test="${userobj.role ne 'admin' }">
		<c:redirect url="login.jsp">
			</c:redirect>
	</c:if>

	<%@include file="all_components/navbar.jsp"%>
	<%@page import="com.dao.JobDAO"%>
	<%@page import="com.DB.DBConnect"%>
	<%@page import="java.util.*"%>
	<%@page import="com.entity.*"%>




	<div class="container p-2">

		<div class="col-md-10 offset-md-1">
			<div class="card">
				<div class="card-body">
					<div class="text-center text-success">
						<i class="fas fa-user-friends fa-3x"></i>

						<%
							int id = Integer.parseInt(request.getParameter("id"));
								JobDAO dao = new JobDAO(DBConnect.getConn());
								Jobs j = dao.getJobById(id);
						%>

						<h5>Edit Jobs</h5>
					</div>

					<form action="update" method="post">
						<input type="hidden" name="id" value="<%=j.getId()%>">
						<div class="form-group">
							<label>Enter Title</label> <input type="text" name="title"
								required="required" class="form-control"
								value="<%=j.getTitle()%>">
						</div>
						<div class="form-row">
							<div class="form-group col-md-4">
								<label>Location</label> <select name="location"
									class="custom-select" id="inlineFormCustomSelectPref">
									<option value="<%=j.getLocation()%>"><%=j.getLocation()%></option>
									<option value="Mumbai">Mumbai</option>
									<option value="Pune">Pune</option>
									<option value="Nashik">Nashik</option>
									<option value="Rajkot">Rajkot</option>
									<option value="Chennai">Chennai</option>
									<option value="Banglore">Banglore</option>
									<option value="Hydrabad">Hydrabad</option>
									<option value="Delhi">Delhi</option>
								</select>
							</div>
							<div class="form-group col-md-4">
								<label>Category</label> <select name="category"
									class="custom-select" id="inlineFormCustomSelectPref">
									<option value="<%=j.getCategory()%>"><%=j.getCategory()%></option>
									<option value="IT">IT</option>
									<option value="Devloper">Devloper</option>
									<option value="Banking">Banking</option>
									<option value="Engineer">Engineer</option>
									<option value="Teacher">Teacher</option>

								</select>
							</div>

							<div class="form-group col-md-4">
								<label>Status</label> <select name="status">
									<option class="Active" value="<%=j.getStatus()%>"><%=j.getStatus()%></option>
									<option class="Active" value="Active">Active</option>

									<option class="Inactive" value="Inactive">Inactive</option>

								</select>
							</div>

						</div>

						<div class="form-group">
							<label>Enter Description</label>
							<textarea required rows="6" name="desc" class="form-control"><%=j.getDescription()%></textarea>
						</div>



						<button type="submit" class="btn bg-custom badge-pill btn-block">Update
							Job</button>
					</form>
				</div>

			</div>
		</div>

	</div>
</body>
</html>