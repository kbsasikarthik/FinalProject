<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Include Required Prerequisites -->
<script type="text/javascript" src="//cdn.jsdelivr.net/jquery/1/jquery.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap/3/css/bootstrap.css" /> -->
 
<!-- Include Date Range Picker -->
<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Home page</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/journal/bootstrap.min.css" />
<!-- <link rel="stylesheet" href="/style.css" /> -->
<%@include file="navbar.jsp"%>
</head>
<body>

<div align="center"  >
<br>
<h2>Results for ${city} in ${mState} Search</h2>
<br>

<h3>Filter by Date Range</h3>
<p>Database starts Jan. 1, 2013</p>
<form action="/dateSearch/${state }/${city}">
<table>
	<thead><strong><tr><td>FROM DATE</td><td>TO DATE</td></tr></strong></thead>
		<tr><td><input type="date" name="fromDate" /></td>
		<td><input type="date" name="toDate" /></td></tr>
</table>
<button>SUBMIT</button>
</form>

 	 <%@include file="locations-map.jsp"%>
<br>    
</div>
<table>
	<thead>
		<tr><td></td><td>Incident Date</td><td>Address</td><td>Number Killed</td><td>Number Injured</td>
		</tr>
	</thead>
<c:forEach var="incident" items="${incidents }">
	<tr>
	<td><a href = "/incident/${incident.incidentId}" class="btn btn-secondary">Details</a></td>
	<td>${incident.date}</td>
	<td>${incident.address}</td>
	<td style="text-align:center">${incident.n_killed}</td>
	<td style="text-align:center">${incident.n_injured}</td>	
	</tr>
</c:forEach>

</table>

</body>
</html>