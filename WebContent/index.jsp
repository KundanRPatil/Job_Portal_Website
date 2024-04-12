<%@page import="com.DB.DBConnect" %>
<%@page import="java.sql.Connection" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_components/all_css.jsp" %>
</head>
<body>
  <%@include file="all_components/navbar.jsp" %>
  <%--Connection conn = DBConnect.getConn(); 
  out.println(conn);--%>
  <%@include file="all_components/carousel.jsp" %>
  <%@include file="all_components/footer.jsp" %>
    
  
  
</body>
</html>