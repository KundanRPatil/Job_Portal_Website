<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<%@include file="all_components/all_css.jsp"%>
</head>
<body>
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp">
		</c:redirect>
	</c:if>


	<%@include file="all_components/navbar.jsp"%>
	<%@page import="com.dao.JobDAO"%>
	<%@page import="com.DB.DBConnect"%>
	<%@page import="java.util.*"%>
	<%@page import="com.entity.*"%>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-danger">All Jobs</h5>

				<c:if test="${not empty succMsg}">
					<div class="alert alert-success" role="alert">${ succMsg}</div>
					<c:remove var="succMsg" />
				</c:if>


				<div class="card">
					<div class="card-body">
						<form class="form-inline" action="more_view.jsp" method="get">
							<div class="form-group col-md-5 mt-1">
								<h5>Location</h5>

							</div>
							<div class="form-group col-md-4 mt-1">
								<h5>Category</h5>

							</div>


							<div class="form-group col-md-4">
								<select name="loc" class="custom-select"
									id="inlineFormCustomSelectPref">
									<option Selected value="lo">Choose...</option>
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
								<select name="cat" class="custom-select"
									id="inlineFormCustomSelectPref">
									<option Selected value="ca">Choose...</option>
									<option value="IT">IT</option>
									<option value="Devloper">Devloper</option>
									<option value="Banking">Banking</option>
									<option value="Engineer">Engineer</option>
									<option value="Teacher">Teacher</option>

								</select>
							</div>


							<button type="submit" class="btn bg-custom ">Submit</button>

						</form>

					</div>
				</div>
				<%
					JobDAO dao = new JobDAO(DBConnect.getConn());
					List<Jobs> list = dao.getAllJobsForUser();
					for (Jobs j : list) {
				%>
				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-danger">
							<i class="far fa-clipboard fa-2x"></i>
						</div>

						<h6><%=j.getTitle()%></h6>
						<%
							if (j.getDescription().length() > 0 && j.getDescription().length() < 120) {
						%>
						<p><%=j.getDescription()%></p>

						<%
							} else {
						%>
						<p><%=j.getDescription().substring(0, 120)%>...
						</p>
						<%
							}
						%>

						<br>
						<div class="form-row">
							<div class="form-group col-md-3">
								<input type="text " class="form-control-sm"
									value="Location:<%=j.getLocation()%>" readonly>
							</div>
							<div class="form-group col-md-3">
								<input type="text " class="form-control-sm"
									value="Category:<%=j.getCategory()%>" readonly>
							</div>
							

						</div>
						<h6>
							Publish Date:
							<%=j.getPdate().toString()%></h6>
						<div class="text-center">
							<a href="one_view.jsp?id=<%=j.getId()%>"
								class="btn btn-sm bg-custom text-white">View more</a> 
						</div>


					</div>
				</div>
				<%
					}
				%>





			</div>
		</div>
	</div>
</body>
</html>