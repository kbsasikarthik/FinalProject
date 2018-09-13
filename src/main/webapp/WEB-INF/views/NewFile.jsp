<%@page import="java.util.Random"%>
<%@page import="java.util.Arrays"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Home page</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/journal/bootstrap.min.css" />
<link rel="stylesheet" href="/style.css" />

</head>
<body>
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

<!-- <form method ="post" action="/listresults">
		 <div class="form-group">
		  	<label class="sr-only" for="city">City</label>
			<select class="form-control mb-2 mr-sm-2" id="city" name="city">
			<option value="">City</option>
		  	<c:forEach items="${ cities }" var="city">
		  		<option <c:if test="${ city eq param.city_or_county }">selected</c:if>>${ city }</option>
		  	</c:forEach>
		  	</select>
		 </div>
		<button action = "submit">Submit</button>
	</form> -->
</body>
</html>