<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>one_view</title>
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

				<%
					int id = Integer.parseInt(request.getParameter("id"));
					JobDAO dao = new JobDAO(DBConnect.getConn());
					Jobs j = dao.getJobById(id);
				%>
				<div class="card mt-5">
					<div class="card-body">
						<div class="text-center text-danger">
							<i class="far fa-clipboard fa-2x"></i>
						</div>
						<h6><%=j.getTitle()%></h6>
						<p><%=j.getDescription()%></p>
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

					</div>
				</div>



			</div>
		</div>
	</div>
</body>
</html>